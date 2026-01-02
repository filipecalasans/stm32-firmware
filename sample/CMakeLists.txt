include(utils)

add_executable(main)

target_sources(main PUBLIC 
    main.c 
    ${CMAKE_CURRENT_SOURCE_DIR}/../platform/stm32f30x/startup/startup_stm32f30x.s 
    newlib.c
)

target_link_libraries(main smt32f30x_std_peripherals c m gcc)

target_link_options(main PUBLIC 
    -T 
    ${CMAKE_CURRENT_SOURCE_DIR}/../platform/stm32f30x/startup/stm32f303.ld 
    -nostartfiles
    -nostdlib
)

target_compile_options(
    main
    PRIVATE
    $<$<COMPILE_LANGUAGE:C>:-std=c11>

    -fstrict-volatile-bitfields
    -ffunction-sections
    -fdata-sections

    -Wl,--gc-sections
    -Werror
    -Wall
    -Wextra
    -Wcast-align
    -Wconversion
    -Wsign-conversion
    -Wlogical-op
    -pedantic
)

generate_hex_file(main)
generate_binary_file(main)
