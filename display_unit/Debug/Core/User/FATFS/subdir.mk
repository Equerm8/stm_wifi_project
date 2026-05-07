################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/User/FATFS/diskio.c \
../Core/User/FATFS/fatfs_storage.c \
../Core/User/FATFS/ff.c 

OBJS += \
./Core/User/FATFS/diskio.o \
./Core/User/FATFS/fatfs_storage.o \
./Core/User/FATFS/ff.o 

C_DEPS += \
./Core/User/FATFS/diskio.d \
./Core/User/FATFS/fatfs_storage.d \
./Core/User/FATFS/ff.d 


# Each subdirectory must supply rules for building sources it contributes
Core/User/FATFS/%.o Core/User/FATFS/%.su Core/User/FATFS/%.cyclo: ../Core/User/FATFS/%.c Core/User/FATFS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/FATFS" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/Lib" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/SDCard" -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-User-2f-FATFS

clean-Core-2f-User-2f-FATFS:
	-$(RM) ./Core/User/FATFS/diskio.cyclo ./Core/User/FATFS/diskio.d ./Core/User/FATFS/diskio.o ./Core/User/FATFS/diskio.su ./Core/User/FATFS/fatfs_storage.cyclo ./Core/User/FATFS/fatfs_storage.d ./Core/User/FATFS/fatfs_storage.o ./Core/User/FATFS/fatfs_storage.su ./Core/User/FATFS/ff.cyclo ./Core/User/FATFS/ff.d ./Core/User/FATFS/ff.o ./Core/User/FATFS/ff.su

.PHONY: clean-Core-2f-User-2f-FATFS

