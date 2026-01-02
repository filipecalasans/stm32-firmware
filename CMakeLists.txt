cmake_minimum_required(VERSION 3.17)

project(baremetal C ASM)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

# optimizations (-O0 -O1 -O2 -O3 -Os -Ofast -Og -flto)
set(CMAKE_C_FLAGS_DEBUG "-Og -g -DDEBUG")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g")
set(CMAKE_C_FLAGS_RELEASE "-Os -flto")
set(CMAKE_CXX_FLAGS_RELEASE "-Os -flto")

add_link_options(
    --sysroot="${TOOLCHAIN_SYSROOT}"
)

# Arch
add_subdirectory(arch/arm-cortex-m4)

# SoC - System on Chip
add_subdirectory(platform/stm32f30x)

# Board
#add_subdirectory(bsp/${BOARD})
# Drivers

# Application
add_subdirectory(sample)