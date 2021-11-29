# Define constants related to the toolchain sysroot. For STM32F bare-metal
# firmwares the sysroot used is the set of libraries shipped with the 
# ARM GCC cross-compiler. By using the pre-comipled sysroot, we avoid
# having to compile the compiler RT for LLVM.

if(NOT ARM_TOOLCHAIN_PATH)
    if(DEFINED ENV{ARM_TOOLCHAIN_PATH})
        message(STATUS "Detected toolchain path ARM_TOOLCHAIN_PATH in environmental variables: ")
        message(STATUS "$ENV{ARM_TOOLCHAIN_PATH}")
        set(ARM_TOOLCHAIN_PATH $ENV{ARM_TOOLCHAIN_PATH})
    endif()
    file(TO_CMAKE_PATH "${ARM_TOOLCHAIN_PATH}" ARM_TOOLCHAIN_PATH)
endif()

message(STATUS "Toolchain Path: " ${ARM_TOOLCHAIN_PATH})

if(NOT ARM_TARGET_TRIPLET)
    set(ARM_TARGET_TRIPLET "arm-none-eabi")
    message(STATUS "No ARM_TARGET_TRIPLET specified, using default: " ${ARM_TARGET_TRIPLET})
endif()

message(STATUS "Target Triplet: " ${ARM_TARGET_TRIPLET})

set(TOOLCHAIN_SYSROOT  ${ARM_TOOLCHAIN_PATH}/${ARM_TARGET_TRIPLET})
set(TOOLCHAIN_INC_PATH ${ARM_TOOLCHAIN_PATH}/${ARM_TARGET_TRIPLET}/include)
set(TOOLCHAIN_LIB_PATH ${ARM_TOOLCHAIN_PATH}/${ARM_TARGET_TRIPLET}/lib)

message(STATUS "Sysroot: " ${TOOLCHAIN_SYSROOT})


