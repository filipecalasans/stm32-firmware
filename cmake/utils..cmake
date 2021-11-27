function(print_size_of_target TARGET)
    add_custom_target(${TARGET}_always_display_size
        ALL COMMAND ${CMAKE_SIZE} ${TARGET}${CMAKE_EXECUTABLE_SUFFIX_C}
        COMMENT "Target Sizes: "
        DEPENDS ${TARGET}
    )
endfunction()

function(generate_binary_file TARGET)
    add_custom_command(
        TARGET ${TARGET}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O binary ${TARGET}${CMAKE_EXECUTABLE_SUFFIX_C} ${TARGET}.bin
        BYPRODUCTS ${TARGET}.bin
        COMMENT "Generating binary file ${CMAKE_PROJECT_NAME}.bin"
    )
endfunction()

function(generate_srec_file TARGET)
    add_custom_command(
        TARGET ${TARGET}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O srec ${TARGET}${CMAKE_EXECUTABLE_SUFFIX_C} ${TARGET}.srec
        BYPRODUCTS ${TARGET}.srec

        COMMENT "Generating srec file ${CMAKE_PROJECT_NAME}.srec"
    )
endfunction()

function(generate_hex_file TARGET)
    add_custom_command(
        TARGET ${TARGET}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O ihex ${TARGET}${CMAKE_EXECUTABLE_SUFFIX_C} ${TARGET}.hex
        BYPRODUCTS ${TARGET}.hex
        COMMENT "Generating hex file ${CMAKE_PROJECT_NAME}.hex"
    )
endfunction()