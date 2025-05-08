#!/bin/bash


cd ../build/lib/Transforms/
make -j7
cd ../../..
./build/bin/opt -load build/lib/TaintAnalysisPass.so -enable-new-pm=0 -taint-analysis project/assign_c/output_IR/test_6_0.ll
cd project