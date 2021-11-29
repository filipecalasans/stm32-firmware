#!/usr/bin/env bash

# Make sure you first flash the device.

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ELF_FIRMWARE="$THIS_DIR/out/src/main.elf"
PORT=4500

sudo ./st st-util -p "$PORT" &

gdb-multiarch "$ELF_FIRMWARE" \
    -ex 'target extended-remote localhost:$PORT' \
    -ex 'break main'


