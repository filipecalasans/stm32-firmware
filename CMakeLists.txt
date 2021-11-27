cmake_minimum_required(VERSION 3.17)

project(baremetal C ASM)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

# optimizations (-O0 -O1 -O2 -O3 -Os -Ofast -Og -flto)
set(CMAKE_C_FLAGS_DEBUG "-Og -g -DDEBUG")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g")
set(CMAKE_C_FLAGS_RELEASE "-Os -flto")
set(CMAKE_CXX_FLAGS_RELEASE "-Os -flto")


add_compile_options(
    $<$<COMPILE_LANGUAGE:C>:-std=c11>
    $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
    $<$<COMPILE_LANGUAGE:CXX>:-fms-extensions>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-use-cxa-atexit>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-threadsafe-statics>
    -fstrict-volatile-bitfields
    -ffunction-sections
    -fdata-sections

    -Werror
    -Wall
    -Wextra
    -Wcast-align
    -Wconversion
    -Wsign-conversion
    -Wshadow
    -Wlogical-op
    -Wsuggest-final-types
    -Wsuggest-final-methods
    -pedantic
)

add_link_options(
    -Wl,--gc-sections
    --sysroot="${TOOLCHAIN_SYSROOT}"
)

# Arch
# add_subdirectory(arch/arm)
# SoC
#add_subdirectory(startup/${TARGET_SOC})
# BSP
#add_subdirectory(bsp/${BOARD})
# Drivers

# Application
add_subdirectory(src)