################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/Fonts/font12.c \
../User/Fonts/font16.c \
../User/Fonts/font20.c \
../User/Fonts/font24.c \
../User/Fonts/font8.c 

OBJS += \
./User/Fonts/font12.o \
./User/Fonts/font16.o \
./User/Fonts/font20.o \
./User/Fonts/font24.o \
./User/Fonts/font8.o 

C_DEPS += \
./User/Fonts/font12.d \
./User/Fonts/font16.d \
./User/Fonts/font20.d \
./User/Fonts/font24.d \
./User/Fonts/font8.d 


# Each subdirectory must supply rules for building sources it contributes
User/Fonts/%.o User/Fonts/%.su User/Fonts/%.cyclo: ../User/Fonts/%.c User/Fonts/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/FATFS" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Lib" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/SDCard" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-User-2f-Fonts

clean-User-2f-Fonts:
	-$(RM) ./User/Fonts/font12.cyclo ./User/Fonts/font12.d ./User/Fonts/font12.o ./User/Fonts/font12.su ./User/Fonts/font16.cyclo ./User/Fonts/font16.d ./User/Fonts/font16.o ./User/Fonts/font16.su ./User/Fonts/font20.cyclo ./User/Fonts/font20.d ./User/Fonts/font20.o ./User/Fonts/font20.su ./User/Fonts/font24.cyclo ./User/Fonts/font24.d ./User/Fonts/font24.o ./User/Fonts/font24.su ./User/Fonts/font8.cyclo ./User/Fonts/font8.d ./User/Fonts/font8.o ./User/Fonts/font8.su

.PHONY: clean-User-2f-Fonts

