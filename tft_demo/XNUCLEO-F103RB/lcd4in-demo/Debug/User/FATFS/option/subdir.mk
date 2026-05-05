################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/FATFS/option/ccsbcs.c \
../User/FATFS/option/syscall.c \
../User/FATFS/option/unicode.c 

OBJS += \
./User/FATFS/option/ccsbcs.o \
./User/FATFS/option/syscall.o \
./User/FATFS/option/unicode.o 

C_DEPS += \
./User/FATFS/option/ccsbcs.d \
./User/FATFS/option/syscall.d \
./User/FATFS/option/unicode.d 


# Each subdirectory must supply rules for building sources it contributes
User/FATFS/option/%.o User/FATFS/option/%.su User/FATFS/option/%.cyclo: ../User/FATFS/option/%.c User/FATFS/option/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/FATFS" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Lib" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/SDCard" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-User-2f-FATFS-2f-option

clean-User-2f-FATFS-2f-option:
	-$(RM) ./User/FATFS/option/ccsbcs.cyclo ./User/FATFS/option/ccsbcs.d ./User/FATFS/option/ccsbcs.o ./User/FATFS/option/ccsbcs.su ./User/FATFS/option/syscall.cyclo ./User/FATFS/option/syscall.d ./User/FATFS/option/syscall.o ./User/FATFS/option/syscall.su ./User/FATFS/option/unicode.cyclo ./User/FATFS/option/unicode.d ./User/FATFS/option/unicode.o ./User/FATFS/option/unicode.su

.PHONY: clean-User-2f-FATFS-2f-option

