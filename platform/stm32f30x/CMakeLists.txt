include(target/stm32f30x)

add_library(smt32f30x_std_peripherals STATIC system_stm32f30x.c system_stm32f30x.h stm32f30x.h stm32f30x_conf.h)

target_compile_definitions(smt32f30x_std_peripherals PRIVATE USE_STDPERIPH_DRIVER)

target_link_libraries(smt32f30x_std_peripherals
    PUBLIC stm32f30x   
    PUBLIC cmsis_c4  
)

target_include_directories(smt32f30x_std_peripherals PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
