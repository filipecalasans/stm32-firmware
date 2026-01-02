#!/usr/bin/env bash

# Make sure you first flash the device.

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# var.sh defines:
# BUILD_OUTPUT
# 
source ${THIS_DIR}/vars.sh

ELF_FIRMWARE="$BUILD_OUTPUT/sample/main.elf"

GDB="gdb-multiarch"
if [[ $1 == "-t" ]]; then
    GDB="${GCC_TOOLCHAIN_PATH}/bin/arm-none-eabi-gdb"
fi

if [[ $1 == "-h"  || $1 == "--help" ]]; then
    echo "Usage: debug-stm32f3.sh [-t]"
    echo "Options:"
    echo "   -t: Use Gdb provided in the ARM gcc toolchain, instead of the default gdb-multiarch."
    exit 1
fi

"${THIS_DIR}/st" st-util -p 4500 --connect-under-reset &

${GDB} "${ELF_FIRMWARE}" \
    -ex 'target extended-remote localhost:4500' \
    -ex 'break main'


