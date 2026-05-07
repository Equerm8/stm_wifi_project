################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/User/LCD/LCD_Bmp.c \
../Core/User/LCD/LCD_Driver.c \
../Core/User/LCD/LCD_GUI.c \
../Core/User/LCD/LCD_Touch.c 

OBJS += \
./Core/User/LCD/LCD_Bmp.o \
./Core/User/LCD/LCD_Driver.o \
./Core/User/LCD/LCD_GUI.o \
./Core/User/LCD/LCD_Touch.o 

C_DEPS += \
./Core/User/LCD/LCD_Bmp.d \
./Core/User/LCD/LCD_Driver.d \
./Core/User/LCD/LCD_GUI.d \
./Core/User/LCD/LCD_Touch.d 


# Each subdirectory must supply rules for building sources it contributes
Core/User/LCD/%.o Core/User/LCD/%.su Core/User/LCD/%.cyclo: ../Core/User/LCD/%.c Core/User/LCD/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/FATFS" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/Lib" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/SDCard" -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-User-2f-LCD

clean-Core-2f-User-2f-LCD:
	-$(RM) ./Core/User/LCD/LCD_Bmp.cyclo ./Core/User/LCD/LCD_Bmp.d ./Core/User/LCD/LCD_Bmp.o ./Core/User/LCD/LCD_Bmp.su ./Core/User/LCD/LCD_Driver.cyclo ./Core/User/LCD/LCD_Driver.d ./Core/User/LCD/LCD_Driver.o ./Core/User/LCD/LCD_Driver.su ./Core/User/LCD/LCD_GUI.cyclo ./Core/User/LCD/LCD_GUI.d ./Core/User/LCD/LCD_GUI.o ./Core/User/LCD/LCD_GUI.su ./Core/User/LCD/LCD_Touch.cyclo ./Core/User/LCD/LCD_Touch.d ./Core/User/LCD/LCD_Touch.o ./Core/User/LCD/LCD_Touch.su

.PHONY: clean-Core-2f-User-2f-LCD

