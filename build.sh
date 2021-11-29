#!/usr/bin/env bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
TOOLS_DIR="${THIS_DIR}/tools"
CMAKE_DIR="${THIS_DIR}/cmake"
NINJA_PATH="${TOOLS_DIR}/ninja/ninja"

mkdir -p "${THIS_DIR}/out"

(cd out/ && cmake ../ -G Ninja \
    -DARM_TOOLCHAIN_PATH="${TOOLS_DIR}/gcc-arm-none-eabi-10.3" \
    -DARM_TARGET_TRIPLET="arm-none-eabi" \
    -DCMAKE_TOOLCHAIN_FILE="${CMAKE_DIR}/toolchain/gcc.cmake" \
    -DCMAKE_MAKE_PROGRAM="${NINJA_PATH}" \
    -DCMAKE_BUILD_TYPE="Debug" \
    && "${NINJA_PATH}"  
)
