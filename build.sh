rm *.o *.dmp *.bin *.elf *.hex

# GPIO HAL library
arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -DSTM32F401xE -Os -g -c stm32f4xx_hal_gpio.c -o stm32f4xx_hal_gpio.o

#INT routines
arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/BSP/STM324x9I_EVAL/ -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -I. -DSTM32F401xE -Os -g -c stm32f4xx_it.c -o stm32f4xx_it.o

#LED driver (SPI, I2C etc are disabled in this file)
arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/BSP/STM324x9I_EVAL/ -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -I. -DSTM32F401xE -Os -g -c stm32f4xx_nucleo.c -o stm32f4xx_nucleo.o

arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Drivers/BSP/STM324x9I_EVAL/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -DSTM32F401xE -Os -g -c system.c -o system.o

arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -DSTM32F401xE -Os -g -c main.c -o main.o

arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -DSTM32F401xE -Os -g -c startup_stm32f401xe.s -o startup_stm32f401xe.o

arm-none-eabi-gcc -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -DSTM32F401xE -T../STM32Cube_FW_F4_V1.3.0/Projects/STM32F401RE-Nucleo/Templates/TrueSTUDIO/STM32F4xx-Nucleo/STM32F401CE_FLASH.ld -Wl,--gc-sections system.o main.o startup_stm32f401xe.o stm32f4xx_hal_gpio.o stm32f4xx_it.o stm32f4xx_nucleo.o -o app.elf

arm-none-eabi-objdump --disassemble-all --reloc --full-contents --all-headers --source --syms --debugging app.elf > app.dmp

arm-none-eabi-objcopy -Oihex app.elf app.hex
arm-none-eabi-objcopy -Obinary app.elf app.bin

# sudo st-flash write app.bin 0x08000000
