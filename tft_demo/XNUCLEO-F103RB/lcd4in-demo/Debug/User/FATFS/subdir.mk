################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/FATFS/diskio.c \
../User/FATFS/fatfs_storage.c \
../User/FATFS/ff.c 

OBJS += \
./User/FATFS/diskio.o \
./User/FATFS/fatfs_storage.o \
./User/FATFS/ff.o 

C_DEPS += \
./User/FATFS/diskio.d \
./User/FATFS/fatfs_storage.d \
./User/FATFS/ff.d 


# Each subdirectory must supply rules for building sources it contributes
User/FATFS/%.o User/FATFS/%.su User/FATFS/%.cyclo: ../User/FATFS/%.c User/FATFS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Inc -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/FATFS" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Lib" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/SDCard" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/tft_demo/XNUCLEO-F103RB/lcd4in-demo/User" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-User-2f-FATFS

clean-User-2f-FATFS:
	-$(RM) ./User/FATFS/diskio.cyclo ./User/FATFS/diskio.d ./User/FATFS/diskio.o ./User/FATFS/diskio.su ./User/FATFS/fatfs_storage.cyclo ./User/FATFS/fatfs_storage.d ./User/FATFS/fatfs_storage.o ./User/FATFS/fatfs_storage.su ./User/FATFS/ff.cyclo ./User/FATFS/ff.d ./User/FATFS/ff.o ./User/FATFS/ff.su

.PHONY: clean-User-2f-FATFS

