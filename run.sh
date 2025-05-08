#!/bin/bash

# Sample command to run
# $ ./run.sh ../build 
# or 
# $ ./run.sh ../../llvm-project/build/
# Assuming this folder(assignment-1) is in the same directory as the LLVM project folder

LLVM_BUILD_DIR=$1

if [[ -z "$1" ]]; then
	echo -e "Please provide path to LLVM Build Directory as first argument."
	echo -e "Usage: ./run.sh (PATH_to_llvm_build_directory). e.g. ./run.sh ../../llvm-project/build/"
	echo "Exiting..."
    	exit 0
fi
LLVM_OPT=""
OPT=$LLVM_OPT
CLANG=$LLVM_BUILD_DIR/bin/clang
CLANG_CPP=$LLVM_BUILD_DIR/bin/clang++

OUT_DIR=./assign_c/output_IR

#Write similar code for output_mem

INP_DIR=./assign_c

mkdir -p $OUT_DIR

# $CLANG $INP_DIR/file1.c -S -emit-llvm -o $OUT_DIR/file1.ll
# sample code
# ../build/bin/clang -S -emit-llvm file_name.c -o file_name.ll
# ../build/bin/clang++ -S -emit-llvm file_name.cpp -o file_name.ll -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11
# $CLANG_CPP $INP_DIR/file1.cpp -S -emit-llvm -o $OUT_DIR/file1.ll -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11

for file in $INP_DIR/*
do
	if [[ $file == *.c ]]; then
		$CLANG $file -S -emit-llvm -o $OUT_DIR/$(basename $file .c).ll
		echo "Done IR for $(basename $file)"
	elif [[ $file == *.cpp ]]; then
		$CLANG_CPP $file -S -emit-llvm -o $OUT_DIR/$(basename $file .cpp).ll -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11
		echo "Done IR for $(basename $file)"
	fi
	# print done message
done

# Now for -mem2reg pass
# sample command
# $ ../build/bin/opt -mem2reg assign_c/output_IR/file1.ll -S -o assign_c/output_mem/file1_mem.ll
OPT_TOOL=$LLVM_BUILD_DIR/bin/opt
INP_DIR=./assign_c/output_IR # supply IR files directory
OUT_DIR=./assign_c/output_mem # supply output directory for mem2reg pass
mkdir -p $OUT_DIR

# iterate over all IR files in $INP_DIR
for file in $INP_DIR/*
do
	# save output as file_name_mem.ll
	# concatenate file_name with _mem.ll
	# $OPT_TOOL -mem2reg $file -S -o $OUT_DIR/$(basename $file .ll)"_mem.ll"
	sed 's/optnone //' $file | $OPT_TOOL -mem2reg -S -o "$OUT_DIR/$(basename "$file" .ll)_mem.ll"
	echo "Applied mem2reg pass on $(basename $file)"
done
