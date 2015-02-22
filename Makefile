stm32f4xx_hal.o: ../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Src/ -DSTM32F401xE -Os -g -c ../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c -o stm32f4xx_hal.o

stm32f4xx_hal_rcc.c.o: ../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Src/ -DSTM32F401xE -Os -g -c ../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c -o stm32f4xx_hal_rcc.c.o

stm32f4xx_hal_cortex.o: ../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Src/ -DSTM32F401xE -Os -g -c ../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c -o stm32f4xx_hal_cortex.o

stm32f4xx_hal_gpio.o: stm32f4xx_hal_gpio.c
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -DSTM32F401xE -Os -g -c stm32f4xx_hal_gpio.c -o stm32f4xx_hal_gpio.o

stm32f4xx_it.o: stm32f4xx_it.c
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/BSP/STM324x9I_EVAL/ -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -I. -DSTM32F401xE -Os -g -c stm32f4xx_it.c -o stm32f4xx_it.o

stm32f4xx_nucleo.o: stm32f4xx_nucleo.c
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/BSP/STM324x9I_EVAL/ -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -I. -DSTM32F401xE -Os -g -c stm32f4xx_nucleo.c -o stm32f4xx_nucleo.o

system.o: system.c
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I. -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Drivers/BSP/STM324x9I_EVAL/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -DSTM32F401xE -Os -g -c system.c -o system.o

main.o: main.c
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/STM32F4xx_HAL_Driver/Inc/ -I../STM32Cube_FW_F4_V1.3.0/Projects/STM324x9I_EVAL/Examples/BSP/Inc/ -DSTM32F401xE -Os -g -c main.c -o main.o

startup_stm32f401xe.o: startup_stm32f401xe.s
	arm-none-eabi-gcc -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../STM32Cube_FW_F4_V1.3.0/Drivers/CMSIS/Include -DSTM32F401xE -Os -g -c startup_stm32f401xe.s -o startup_stm32f401xe.o

app.elf: system.o main.o startup_stm32f401xe.o stm32f4xx_hal_gpio.o stm32f4xx_it.o stm32f4xx_nucleo.o stm32f4xx_hal.o stm32f4xx_hal_rcc.c.o stm32f4xx_hal_cortex.o
	arm-none-eabi-gcc -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -DSTM32F401xE -T../STM32Cube_FW_F4_V1.3.0/Projects/STM32F401RE-Nucleo/Templates/TrueSTUDIO/STM32F4xx-Nucleo/STM32F401CE_FLASH.ld -Wl,--gc-sections system.o main.o startup_stm32f401xe.o stm32f4xx_hal_gpio.o stm32f4xx_it.o stm32f4xx_nucleo.o stm32f4xx_hal.o stm32f4xx_hal_rcc.c.o stm32f4xx_hal_cortex.o -o app.elf

app.bin: app.elf
	arm-none-eabi-objcopy -Obinary app.elf app.bin

app.hex: app.elf
	arm-none-eabi-objcopy -Oihex app.elf app.hex

flash: app.bin
	sudo st-flash write app.bin 0x08000000

dump: app.elf
	arm-none-eabi-objdump --disassemble-all --reloc --full-contents --all-headers --source --syms --debugging app.elf > app.dmp

clean:
	-@rm *.o *.bin *.elf

distclean:
	rm *.o *.bin *.elf *.hex *.dmp

all: clean flash
