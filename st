#!/usr/bin/env bash 

# A Bash script wrapper to invoke st link tools with
# the correct LD_LIBRARY_PATH.

 LD_LIBRARY_PATH=/usr/local/lib "$@"
