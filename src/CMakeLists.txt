
add_executable(main)

target_sources(main PUBLIC 
    main.c 
    startup_stm32f30x.s 
    newlib.c
)

target_link_libraries(main smt32f30x_std_peripherals c m gcc)

target_link_options(main PUBLIC -T ${CMAKE_CURRENT_SOURCE_DIR}/stm32f303.ld -nostartfiles) 


target_compile_options(
    main
    PRIVATE
    $<$<COMPILE_LANGUAGE:C>:-std=c11>

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
