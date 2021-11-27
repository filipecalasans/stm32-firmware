
#
# ARM Cortex - M4 CMSIS headers.
#
add_library(cmsis_c4 INTERFACE)

target_include_directories(cmsis_c4 INTERFACE ./)

target_compile_options(cmsis_c4 INTERFACE "-Wno-sign-conversion" "-Wno-unused-parameter")