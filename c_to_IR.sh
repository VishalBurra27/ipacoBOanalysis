#!/bin/bash

LLVM_BUILD_DIR=$1

if [[ -z "$1" ]]; then
    echo -e "Please provide path to LLVM Build Directory as first argument."
    echo -e "Usage: ./run.sh (PATH_to_llvm_build_directory). e.g. ./run.sh ../../llvm_project/build/"
    echo "Exiting..."
    exit 0
fi

# Paths
CLANG=$LLVM_BUILD_DIR/bin/clang
CLANGPP=$LLVM_BUILD_DIR/bin/clang++
INP_DIR=./input/
OUT_DIR_IR=./input/output_IR

# Include paths for C++ compilation
CPP_INCLUDE_PATHS="-I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11"

# Debug flags
DEBUG_FLAGS="-g -gline-tables-only"

# Optimization flags (keep it at -O0 to preserve debug info)
OPT_FLAGS="-O0"

# Create output directories if they don't exist
mkdir -p $OUT_DIR_IR

# Generate .ll files for all input files with debug info
for file in $INP_DIR/*.{c,cpp}; do
    if [[ -f "$file" ]]; then  # Check if file exists (handles case where no .c/.cpp files exist)
        filename=$(basename ${file%.*})
        
        if [[ $file == *.c ]]; then
            # Generate LLVM IR with debug info (no mem2reg)
            $CLANG $OPT_FLAGS $DEBUG_FLAGS $file -S -emit-llvm -o $OUT_DIR_IR/$filename.ll
            echo "Generated debug-enabled IR for C file: $file"
        elif [[ $file == *.cpp ]]; then
            # Generate LLVM IR with debug info for C++ (no mem2reg)
            $CLANGPP $OPT_FLAGS $DEBUG_FLAGS $file -S -emit-llvm $CPP_INCLUDE_PATHS -o $OUT_DIR_IR/$filename.ll
            echo "Generated debug-enabled IR for C++ file: $file"
        fi
    fi
done

echo ""
echo "LLVM IR generation with debug symbols completed successfully (without mem2reg)."
echo "Output files:"
ls -l $OUT_DIR_IR/*.ll
