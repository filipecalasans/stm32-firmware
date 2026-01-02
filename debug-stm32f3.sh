#!/usr/bin/env bash

# Make sure you first flash the device.

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# var.sh defines:
# BUILD_OUTPUT
# GCC_TOOLCHAIN_PATH
source ${THIS_DIR}/vars.sh

# Default ELF file path
ELF_FIRMWARE="$BUILD_OUTPUT/sample/main.elf"

# Default to toolchain GDB
GDB="${GCC_TOOLCHAIN_PATH}/bin/arm-none-eabi-gdb"

# Help function
show_help() {
    cat << EOF
Usage: $(basename "$0") [OPTIONS] [ELF_FILE]

Debug STM32F3 microcontroller using GDB.

ARGUMENTS:
    ELF_FILE            Path to the .elf file to debug (default: out/sample/main.elf)

OPTIONS:
    -m, --multiarch     Use gdb-multiarch instead of toolchain GDB
    -h, --help          Show this help message and exit

EXAMPLES:
    $(basename "$0")                        # Debug default ELF with toolchain GDB
    $(basename "$0") custom.elf             # Debug custom ELF with toolchain GDB
    $(basename "$0") -m custom.elf          # Debug custom ELF with gdb-multiarch

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -m|--multiarch)
            GDB="gdb-multiarch"
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        -*)
            echo "Error: Unknown option: $1"
            show_help
            exit 1
            ;;
        *)
            ELF_FIRMWARE="$1"
            shift
            ;;
    esac
done

# Check if ELF file exists
if [[ ! -f "$ELF_FIRMWARE" ]]; then
    echo "Error: ELF file not found: $ELF_FIRMWARE"
    exit 1
fi

echo "Starting GDB server on port 4500..."
"${THIS_DIR}/st" st-util -p 4500 --connect-under-reset &

echo "Debugging $ELF_FIRMWARE with $GDB..."

${GDB} "${ELF_FIRMWARE}" \
    -ex 'target extended-remote localhost:4500' \
    -ex 'break main'


