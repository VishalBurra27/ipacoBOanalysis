#!/bin/bash

# Usage: ./run_pipeline.sh a.cpp patch.cpp

# Exit if any command fails
set -e

# Input files
# FILE1=$1

# Verify arguments
if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_file.cpp> "
  exit 1
fi

# Copy to input directory
# cp "$FILE1" ./input/a.cpp

# Step 1: Compile and run file_comparator to get vulnerable lines
# python3 ./helper_files/file_comp.py ./input/a.cpp ./input/patch.cpp
# echo "Vulnerable lines written to vulnerable_lines.txt"

# Step 2: Run stubs and typefixer
# python3 ./helper_files/stubs.py ./input/a.cpp ./input/patch.cpp
# python3 ./helper_files/typefixer.py ./input/a.cpp ./input/patch.cpp
# echo "Ran stubs.py and typefixer.py"


LLVM_BUILD_DIR=../../llvm-project/build/
CLANG=$LLVM_BUILD_DIR/bin/clang
DEBUG_FLAGS="-g -gline-tables-only"


# Step 3: Convert C/C++ to LLVM IR
$CLANG $OPT_FLAGS $DEBUG_FLAGS $1 -S -emit-llvm -o ./input/output_IR/a.ll

# ./c_to_IR.sh ../../llvm-project/build/
echo "C to LLVM IR completed"

# Step 4: Run TaintAnalysisPass on the generated IR
cd ../build/lib/Transforms/
make -j7
cd ../../..

# You may want to generalize this to support different IR file names
IR_FILE="project/input/output_IR/a.ll"
if [ ! -f "$IR_FILE" ]; then
  echo "IR file not found: $IR_FILE"
  exit 1
fi

./build/bin/opt -load build/lib/TaintAnalysisPass.so -enable-new-pm=0 -taint-analysis "$IR_FILE"
echo "Taint analysis completed on $IR_FILE"

# Return to project dir
cd project
