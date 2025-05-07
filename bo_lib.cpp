#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/CFG.h"
#include "llvm/Analysis/CFG.h"
#include <bits/stdc++.h>
using namespace llvm;
using namespace std;
namespace {
  struct TaintAnalysisPass : public FunctionPass {
    static char ID;
    set<unsigned> vulnerableLines;
    set<Value*> relevantVariables;
    set<Instruction*> relevantStatements;
    map<Instruction*, unsigned> instToLineMap;
    
    TaintAnalysisPass() : FunctionPass(ID) {
      // Read vulnerable lines from input file
      ifstream inFile("./project/vulnerable_lines.txt");
      if (inFile.is_open()) {
        unsigned lineNum;
        while (inFile >> lineNum) {
          vulnerableLines.insert(lineNum);
        }
        inFile.close();
      } else {
        errs() << "Error: Could not open ./project/vulnerable_lines.txt\n";
      }
    }
    
    bool isBufferAllocation(const Instruction *I) {
      // Check for stack buffer allocations (alloca instructions)
      if (const AllocaInst *AI = dyn_cast<AllocaInst>(I)) {
        if (AI->getAllocatedType()->isArrayTy())
          return true;
      }
      return false;
    }
    
    
    bool is_valid_variable(Value *V) {
      if (!isa<Constant>(V) && !isa<MetadataAsValue>(V)) {
        return isa<AllocaInst>(V) || 
           isa<Argument>(V) || 
           isa<GlobalVariable>(V) ||
           V->getType()->isPointerTy() ||
           (isa<Instruction>(V) && !V->getType()->isVoidTy());
      }
      return false;
    }

    bool definesRelevantVariable(Instruction *I) {
      // Check if this instruction defines a relevant variable
      for (auto &relevantVar : relevantVariables) {
        if (I == relevantVar) {
          return true;
        }
      }
      
      // Check if this instruction uses a relevant variable
      for (Use &U : I->operands()) {
        if (!is_valid_variable(U.get())) continue;
        if (relevantVariables.find(U.get()) != relevantVariables.end()) {
          return true;
        }
      }
      return false;
    }

    void mapInstructionsToLines(Function &F) {
      for (auto &BB : F) {
          for (auto &I : BB) {
              if (const DILocation *Loc = I.getDebugLoc()) {
                  unsigned Line = Loc->getLine();
                  instToLineMap[&I] = Line;
                  
                  if (vulnerableLines.find(Line) != vulnerableLines.end()) {
                      relevantStatements.insert(&I);
                      
                      if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                          for (unsigned i = 0; i < CI->getNumOperands(); i++) {
                              Value *Op = CI->getOperand(i);
                              
                              // If operand is a GEP, get its base pointer
                              if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(Op)) {
                                  Value *BasePtr = GEP->getPointerOperand();
                                  relevantVariables.insert(BasePtr);
                              }
                              // For other instructions, insert the operand directly
                              else if (is_valid_variable(Op)) {
                                  relevantVariables.insert(Op);
                              }
                          }
                      }
                      
                      if (isBufferAllocation(&I)) {
                          relevantVariables.insert(&I);
                      }
                  }
              }
          }
      }
    }
    
    void identifyControlDependencies(Function &F) {
      // First, identify all vulnerable buffer operations
      set<Instruction*> vulnerableBufferOps;
      for (auto *I : relevantStatements) {
        if (CallInst *CI = dyn_cast<CallInst>(I)) {
          Function *Callee = CI->getCalledFunction();
          if (Callee) {
            vulnerableBufferOps.insert(I);
          }
        }
      }
      
      // Build post-dominator information to determine control dependence
      map<BasicBlock*, set<BasicBlock*>> postDominators;
      
      // For each basic block, find all branch instructions that control vulnerable operations
      set<Instruction*> newRelevantStmts;
      set<Value*> newRelevantVars;
      
      // For each vulnerable buffer operation, trace back control dependencies
      for (auto *VulnOp : vulnerableBufferOps) {
        BasicBlock *VulnBB = VulnOp->getParent();
        
        // Find all branches that this block is control dependent on
        for (auto &BB : F) {
          Instruction *TI = BB.getTerminator();
          if (BranchInst *BI = dyn_cast<BranchInst>(TI)) {
            if (BI->isConditional()) {
              // Check if this branch controls the execution of the vulnerable block
              // This is a simplified check - a proper implementation would use post-dominance
              for (unsigned i = 0; i < BI->getNumSuccessors(); i++) {
                BasicBlock *Succ = BI->getSuccessor(i);
                if (Succ == VulnBB || isPotentiallyReachable(Succ, VulnBB)) {
                  // This branch potentially controls the vulnerable operation
                  newRelevantStmts.insert(BI);
                  
                  // Add the condition to relevant variables
                  Value *Cond = BI->getCondition();
                  if (is_valid_variable(Cond)) {
                    newRelevantVars.insert(Cond);
                    
                    // If condition is a comparison instruction, add its operands
                    if (CmpInst *Cmp = dyn_cast<CmpInst>(Cond)) {
                      for (unsigned j = 0; j < Cmp->getNumOperands(); j++) {
                        Value *Op = Cmp->getOperand(j);
                        if (is_valid_variable(Op)) {
                          newRelevantVars.insert(Op);
                        }
                      }
                    }
                  }
                  break;
                }
              }
            }
          }
        }
      }
      
      // Add new relevant statements and variables
      relevantStatements.insert(newRelevantStmts.begin(), newRelevantStmts.end());
      relevantVariables.insert(newRelevantVars.begin(), newRelevantVars.end());
    }
    
    void slice_printer() {
      for(auto *I : relevantStatements) {
        I->print(errs());
        errs() << "\n";
        
        // Also print the source line number for reference
        auto it = instToLineMap.find(I);
        if (it != instToLineMap.end()) {
          errs() << "  ; Source line: " << it->second << "\n";
        }
        errs() << "\n";
      }
    }

    bool runOnFunction(Function &F) override {
      // Skip functions without debug info
      if (F.getSubprogram() == nullptr)
        return false;
        
      // Map instructions to source lines and identify initial relevant statements
      mapInstructionsToLines(F);
      
      // Perform backward slicing to find all relevant statements
      bool changed = true;
      while (changed) {
        changed = false;
        set<Value*> newRelevantVars;
        
        for (auto &BB : F) {
          for (auto &I : BB) {
            if (relevantStatements.find(&I) != relevantStatements.end()) continue;
            if (definesRelevantVariable(&I)) {
              // Add this instruction to the relevant statements
              relevantStatements.insert(&I);
              changed = true;
              
              // Add operands to relevant variables
              for (Use &U : I.operands()) {
                if (is_valid_variable(U.get()) && 
                    relevantVariables.find(U.get()) == relevantVariables.end()) {
                  newRelevantVars.insert(U.get());
                  changed = true;
                }
              }
            }
          }
        }
        slice_printer();
        // Add new relevant variables
        relevantVariables.insert(newRelevantVars.begin(), newRelevantVars.end());
        
        // Identify control dependencies
        size_t prevSize = relevantStatements.size();
        identifyControlDependencies(F);
        if (prevSize != relevantStatements.size()) {
          changed = true;
        }
      }
      
      // Output the analysis results
      errs() << "\nRelevant IR statements after slicing:\n";
      slice_printer();
      
      return false;
    }
  };
}

char TaintAnalysisPass::ID = 0;
static RegisterPass<TaintAnalysisPass> X("taint-analysis", "Buffer Overflow Slice Pass");

static RegisterStandardPasses Y(
  PassManagerBuilder::EP_EarlyAsPossible,
  [](const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
    PM.add(new TaintAnalysisPass());
  }
);
