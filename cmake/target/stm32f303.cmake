
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

add_library(stm32f303 INTERFACE)

set(STM32F303_CPU_OPTIONS 
    -mthumb 
    -mcpu=cortex-m4
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
)

target_compile_options(
    stm32f303 INTERFACE ${STM32F303_CPU_OPTIONS}
)

target_link_options(
    stm32f303 INTERFACE ${STM32F303_CPU_OPTIONS}
)

