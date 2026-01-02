#!/usr/bin/env bash

set -e

# Define importnat paths and variables commonly used 
# on other scripts.

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export TOOLS_DIR="${THIS_DIR}/tools"
export ARCHIVES_DIR="${THIS_DIR}/archives"
export BUILD_OUTPUT="${THIS_DIR}/out"

export NINJA_PATH="${TOOLS_DIR}/ninja/ninja"
export GCC_TOOLCHAIN_PATH="${TOOLS_DIR}/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-eabi"
