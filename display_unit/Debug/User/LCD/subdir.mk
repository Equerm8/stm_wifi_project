################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/LCD/LCD_Driver.c \
../User/LCD/LCD_GUI.c 

OBJS += \
./User/LCD/LCD_Driver.o \
./User/LCD/LCD_GUI.o 

C_DEPS += \
./User/LCD/LCD_Driver.d \
./User/LCD/LCD_GUI.d 


# Each subdirectory must supply rules for building sources it contributes
User/LCD/%.o User/LCD/%.su User/LCD/%.cyclo: ../User/LCD/%.c User/LCD/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/User/Fonts" -I../Core/Inc -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/User" -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@"  -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User-2f-LCD

clean-User-2f-LCD:
	-$(RM) ./User/LCD/LCD_Driver.cyclo ./User/LCD/LCD_Driver.d ./User/LCD/LCD_Driver.o ./User/LCD/LCD_Driver.su ./User/LCD/LCD_GUI.cyclo ./User/LCD/LCD_GUI.d ./User/LCD/LCD_GUI.o ./User/LCD/LCD_GUI.su

.PHONY: clean-User-2f-LCD

