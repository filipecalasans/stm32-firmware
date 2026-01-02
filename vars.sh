#!/usr/bin/env bash

set -e

# Define importnat paths and variables commonly used
# on other scripts.

# Detect OS and architecture
detect_os_arch() {
    local os_name=""
    local arch_name=""

    # Detect OS
    case "$(uname -s)" in
        Linux*)
            os_name="linux"
            ;;
        Darwin*)
            os_name="macos"
            ;;
        *)
            echo "Error: Unsupported operating system $(uname -s)" >&2
            exit 1
            ;;
    esac

    # Detect architecture
    case "$(uname -m)" in
        x86_64|amd64)
            arch_name="x86_64"
            ;;
        aarch64|arm64)
            arch_name="arm64"
            ;;
        *)
            echo "Error: Unsupported architecture $(uname -m)" >&2
            exit 1
            ;;
    esac

    echo "${os_name}-${arch_name}"
}

OS_PREFIX=$(detect_os_arch)
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export TOOLS_DIR="${THIS_DIR}/tools/${OS_PREFIX}"
export ARCHIVES_DIR="${THIS_DIR}/archives"
export BUILD_OUTPUT="${THIS_DIR}/out"

export NINJA_PATH="${TOOLS_DIR}/ninja/ninja"
export GCC_TOOLCHAIN_PATH="${TOOLS_DIR}/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-eabi"
