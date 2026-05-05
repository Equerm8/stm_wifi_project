################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/Config/DEV_Config.c 

OBJS += \
./User/Config/DEV_Config.o 

C_DEPS += \
./User/Config/DEV_Config.d 


# Each subdirectory must supply rules for building sources it contributes
User/Config/%.o User/Config/%.su User/Config/%.cyclo: ../User/Config/%.c User/Config/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/FATFS" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Lib" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/SDCard" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-User-2f-Config

clean-User-2f-Config:
	-$(RM) ./User/Config/DEV_Config.cyclo ./User/Config/DEV_Config.d ./User/Config/DEV_Config.o ./User/Config/DEV_Config.su

.PHONY: clean-User-2f-Config

