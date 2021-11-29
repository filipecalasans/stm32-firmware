#!/usr/bin/env bash 

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

BIN_FILE="$THIS_DIR/out/src/main.bin"

FLASH_START_ADDRESS=0x8000000

./st st-flash write "$BIN_FILE" "$FLASH_START_ADDRESS"

