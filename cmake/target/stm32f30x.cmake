
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

add_library(stm32f30x INTERFACE)

set(STM32F30X_CPU_OPTIONS 
    -mthumb 
    -mcpu=cortex-m4
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
)

target_compile_options(
    stm32f30x INTERFACE ${STM32F30X_CPU_OPTIONS}
)

target_link_options(
    stm32f30x INTERFACE ${STM32F30X_CPU_OPTIONS}
)

