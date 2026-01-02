#!/usr/bin/env bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Default bin file path
BIN_FILE="$THIS_DIR/out/sample/main.bin"

FLASH_START_ADDRESS=0x8000000

# Help function
show_help() {
    cat << EOF
Usage: $(basename "$0") [OPTIONS]

Flash a binary file to STM32F3 microcontroller.

OPTIONS:
    -f, --file FILE     Specify the binary file to flash (default: out/sample/main.bin)
    -h, --help          Show this help message and exit

EXAMPLES:
    $(basename "$0")                           # Flash default binary
    $(basename "$0") -f custom.bin             # Flash custom binary
    $(basename "$0") --file out/firmware.bin   # Flash specific binary

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--file)
            BIN_FILE="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "Error: Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Check if bin file exists
if [[ ! -f "$BIN_FILE" ]]; then
    echo "Error: Binary file not found: $BIN_FILE"
    exit 1
fi

echo "Flashing $BIN_FILE to STM board..."

${THIS_DIR}/st st-flash write "$BIN_FILE" "$FLASH_START_ADDRESS"

