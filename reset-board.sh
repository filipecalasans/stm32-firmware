#!/usr/bin/env bash 

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

${THIS_DIR}/st st-flash reset
