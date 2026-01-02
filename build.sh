#!/usr/bin/env bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# var.sh defines:
# TOOLS_DIR
# NINJA_PATH
# GCC_TOOLCHAIN_DIR
# BUILD_OUTPUT
source "${THIS_DIR}/vars.sh"

CMAKE_DIR="${THIS_DIR}/cmake"
mkdir -p "${BUILD_OUTPUT}"

(cd ${THIS_DIR}/out/ && cmake ../ -G Ninja \
    -DARM_TOOLCHAIN_PATH="${GCC_TOOLCHAIN_PATH}" \
    -DARM_TARGET_TRIPLET="arm-none-eabi" \
    -DCMAKE_MODULE_PATH="${CMAKE_DIR}" \
    -DCMAKE_TOOLCHAIN_FILE="${CMAKE_DIR}/toolchain/gcc.cmake" \
    -DCMAKE_MAKE_PROGRAM="${NINJA_PATH}" \
    -DCMAKE_BUILD_TYPE="Debug" \
    && "${NINJA_PATH}"  
)
