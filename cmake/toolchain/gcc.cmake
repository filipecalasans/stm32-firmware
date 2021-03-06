
get_filename_component(STM32_CMAKE_DIR ${CMAKE_CURRENT_LIST_FILE} DIRECTORY)
list(APPEND CMAKE_MODULE_PATH ${STM32_CMAKE_DIR})

include(sysroot)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(TOOLCHAIN_BIN_PATH ${ARM_TOOLCHAIN_PATH}/bin)
set(TOOLCHAIN_BIN_PREFIX ${TOOLCHAIN_BIN_PATH}/${ARM_TARGET_TRIPLET}-)

set(CMAKE_OBJCOPY ${TOOLCHAIN_BIN_PREFIX}objcopy)
set(CMAKE_OBJDUMP ${TOOLCHAIN_BIN_PREFIX}objdump)
set(CMAKE_SIZE ${TOOLCHAIN_BIN_PREFIX}size)
set(CMAKE_DEBUGGER ${TOOLCHAIN_BIN_PREFIX}gdb)
set(CMAKE_CPPFILT ${TOOLCHAIN_BIN_PREFIX}c++filt)

set(CMAKE_C_COMPILER ${TOOLCHAIN_BIN_PREFIX}gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN_PREFIX}g++)
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_BIN_PREFIX}gcc)
set(CMAKE_OBJCOPY ${TOOLCHAIN_BIN_PREFIX}objcopy)
set(CMAKE_SIZE_UTIL ${TOOLCHAIN_BIN_PREFIX}size)

set(CMAKE_C_COMPILER_ID GNU)
set(CMAKE_CXX_COMPILER_ID GNU)

set(CMAKE_EXECUTABLE_SUFFIX_C   .elf)
set(CMAKE_EXECUTABLE_SUFFIX_CXX .elf)
set(CMAKE_EXECUTABLE_SUFFIX_ASM .elf)