if(NOT STM32_TOOLCHAIN_PATH)
    if(DEFINED ENV{STM32_TOOLCHAIN_PATH})
        message(STATUS "Detected toolchain path STM32_TOOLCHAIN_PATH in environmental variables: ")
        message(STATUS "$ENV{STM32_TOOLCHAIN_PATH}")
        set(STM32_TOOLCHAIN_PATH $ENV{STM32_TOOLCHAIN_PATH})
    else()
        message(FATAR_ERROR "Provide the ARM toolchain direcotry in STM32_TOOLCHAIN_PATH")
    endif()
    file(TO_CMAKE_PATH "${STM32_TOOLCHAIN_PATH}" STM32_TOOLCHAIN_PATH)
endif()

if(NOT STM32_TARGET_TRIPLET)
    set(STM32_TARGET_TRIPLET "arm-none-eabi")
    message(STATUS "No STM32_TARGET_TRIPLET specified, using default: " ${STM32_TARGET_TRIPLET})
endif()

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(TOOLCHAIN_SYSROOT  ${STM32_TOOLCHAIN_PATH}/${STM32_TARGET_TRIPLET})
set(TOOLCHAIN_INC_PATH ${STM32_TOOLCHAIN_PATH}/${STM32_TARGET_TRIPLET}/include)
set(TOOLCHAIN_LIB_PATH ${STM32_TOOLCHAIN_PATH}/${STM32_TARGET_TRIPLET}/lib)

set(CMAKE_EXECUTABLE_SUFFIX_C   .elf)
set(CMAKE_EXECUTABLE_SUFFIX_CXX .elf)
set(CMAKE_EXECUTABLE_SUFFIX_ASM .elf)

function(stm32_print_size_of_target TARGET)
    add_custom_target(${TARGET}_always_display_size
        ALL COMMAND ${CMAKE_SIZE} ${TARGET}${CMAKE_EXECUTABLE_SUFFIX_C}
        COMMENT "Target Sizes: "
        DEPENDS ${TARGET}
    )
endfunction()

function(stm32_generate_binary_file TARGET)
    add_custom_command(
        TARGET ${TARGET}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O binary ${TARGET}${CMAKE_EXECUTABLE_SUFFIX_C} ${TARGET}.bin
        BYPRODUCTS ${TARGET}.bin
        COMMENT "Generating binary file ${CMAKE_PROJECT_NAME}.bin"
    )
endfunction()

function(stm32_generate_srec_file TARGET)
    add_custom_command(
        TARGET ${TARGET}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O srec ${TARGET}${CMAKE_EXECUTABLE_SUFFIX_C} ${TARGET}.srec
        BYPRODUCTS ${TARGET}.srec

        COMMENT "Generating srec file ${CMAKE_PROJECT_NAME}.srec"
    )
endfunction()

function(stm32_generate_hex_file TARGET)
    add_custom_command(
        TARGET ${TARGET}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O ihex ${TARGET}${CMAKE_EXECUTABLE_SUFFIX_C} ${TARGET}.hex
        BYPRODUCTS ${TARGET}.hex
        COMMENT "Generating hex file ${CMAKE_PROJECT_NAME}.hex"
    )
endfunction()