include(utils)

add_executable(main)

target_sources(main PUBLIC 
    main.c 
    ../platform/stm32f30x/startup/startup_stm32f30x.s 
    newlib.c
)

target_link_libraries(main smt32f30x_std_peripherals c m gcc nosys)

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
    $<$<C_COMPILER_ID:GNU>:--specs=nosys.specs>

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

generate_hex_file(main)
