
add_executable(main)

target_sources(main PUBLIC 
    main.c 
    startup_stm32f30x.s 
    system_stm32f30x.c
    newlib.c
)

target_link_libraries(main c m gcc)

target_link_options(main PUBLIC -T ${CMAKE_CURRENT_SOURCE_DIR}/stm32f303.ld -nostartfiles) 

target_include_directories(main PRIVATE .)