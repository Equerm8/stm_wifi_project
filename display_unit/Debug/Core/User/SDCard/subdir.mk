################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/User/SDCard/MMC_SD.c 

OBJS += \
./Core/User/SDCard/MMC_SD.o 

C_DEPS += \
./Core/User/SDCard/MMC_SD.d 


# Each subdirectory must supply rules for building sources it contributes
Core/User/SDCard/%.o Core/User/SDCard/%.su Core/User/SDCard/%.cyclo: ../Core/User/SDCard/%.c Core/User/SDCard/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/Config" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/FATFS" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/Fonts" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/LCD" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/Lib" -I"C:/Users/Equer/OneDrive/PWr/Semester 1/Microcontroller programming/Project/stm_wifi_project/display_unit/Core/User/SDCard" -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-User-2f-SDCard

clean-Core-2f-User-2f-SDCard:
	-$(RM) ./Core/User/SDCard/MMC_SD.cyclo ./Core/User/SDCard/MMC_SD.d ./Core/User/SDCard/MMC_SD.o ./Core/User/SDCard/MMC_SD.su

.PHONY: clean-Core-2f-User-2f-SDCard

