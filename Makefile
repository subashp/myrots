# Copyright 2015, Subash Patel <subashrp@gmail.com>

STM32CUBE_ROOT ?= /var/repos/STM32Cube_FW_F4_V1.3.0
CC_PREFIX ?= arm-none-eabi-

CFLAGS := -Wall -mcpu=cortex-m4 -mlittle-endian -mthumb -mthumb-interwork -Os -g
DEFINES := STM32F401xE

BUILD = build

INCLUDE  = ./include
INCLUDE += -I$(STM32CUBE_ROOT)/Drivers/CMSIS/Device/ST/STM32F4xx/Include
INCLUDE += -I$(STM32CUBE_ROOT)/Drivers/STM32F4xx_HAL_Driver/Inc
INCLUDE += -I$(STM32CUBE_ROOT)/Drivers/STM32F4xx_HAL_Driver/Src
INCLUDE += -I$(STM32CUBE_ROOT)/Drivers/CMSIS/Include
INCLUDE += -I$(STM32CUBE_ROOT)/Drivers/BSP/STM324x9I_EVAL
INCLUDE += -I$(STM32CUBE_ROOT)/Drivers/BSP/STM32F4xx-Nucleo/
INCLUDE += -I$(STM32CUBE_ROOT)/Projects/STM324x9I_EVAL/Examples/BSP/Inc

VPATH += ./src/
VPATH += $(STM32CUBE_ROOT)/Drivers/STM32F4xx_HAL_Driver/Src/

OBJS  = $(BUILD)/stm32f4xx_hal.o
OBJS += $(BUILD)/stm32f4xx_hal_rcc.c.o
OBJS += $(BUILD)/stm32f4xx_hal_cortex.o
OBJS += $(BUILD)/stm32f4xx_hal_gpio.o
OBJS += $(BUILD)/stm32f4xx_it.o
OBJS += $(BUILD)/stm32f4xx_nucleo.o
OBJS += $(BUILD)/system.o
OBJS += $(BUILD)/main.o
OBJS += $(BUILD)/startup_stm32f401xe.o

$(BUILD)/stm32f4xx_hal.o: stm32f4xx_hal.c
	$(CC_PREFIX)gcc $(CFLAGS) -I$(INCLUDE) -D$(DEFINES) -c $< -o $@

$(BUILD)/stm32f4xx_hal_rcc.c.o: stm32f4xx_hal_rcc.c
	$(CC_PREFIX)gcc $(CFLAGS) -I$(INCLUDE) -D$(DEFINES) -c $< -o $@

$(BUILD)/stm32f4xx_hal_cortex.o: stm32f4xx_hal_cortex.c
	$(CC_PREFIX)gcc $(CFLAGS) -I$(INCLUDE) -D$(DEFINES) -c $< -o $@

$(BUILD)/stm32f4xx_hal_gpio.o: stm32f4xx_hal_gpio.c
	$(CC_PREFIX)gcc $(CFLAGS) -I$(INCLUDE) -D$(DEFINES) -c $< -o $@

$(BUILD)/stm32f4xx_nucleo.o: stm32f4xx_nucleo.c
	$(CC_PREFIX)gcc $(CFLAGS) -I$(INCLUDE) -D$(DEFINES) -c $< -o $@

$(BUILD)/stm32f4xx_it.o: stm32f4xx_it.c
	$(CC_PREFIX)gcc $(CFLAGS) -I$(INCLUDE) -D$(DEFINES) -c $< -o $@

$(BUILD)/system.o: system.c
	$(CC_PREFIX)gcc $(CFLAGS) -I$(INCLUDE) -D$(DEFINES) -c $< -o $@

$(BUILD)/main.o: main.c
	$(CC_PREFIX)gcc $(CFLAGS) -I$(INCLUDE) -D$(DEFINES) -c $< -o $@

$(BUILD)/startup_stm32f401xe.o: startup_stm32f401xe.s
	$(CC_PREFIX)gcc $(CFLAGS) -I$(INCLUDE) -D$(DEFINES) -c $< -o $@

directory:
	mkdir -p $(BUILD)

$(BUILD)/app.elf: directory $(OBJS)
	$(CC_PREFIX)gcc $(CFLAGS) -D$(DEFINES) -T$(STM32CUBE_ROOT)/Projects/STM32F401RE-Nucleo/Templates/TrueSTUDIO/STM32F4xx-Nucleo/STM32F401CE_FLASH.ld -Wl,--gc-sections $(OBJS) -o $@

app.bin: $(BUILD)/app.elf
	$(CC_PREFIX)objcopy -Obinary $< $(BUILD)/$@

app.hex: $(BUILD)/app.elf
	$(CC_PREFIX)objcopy -Oihex $< $(BUILD)/$@

app.dmp: $(BUILD)/app.elf
	$(CC_PREFIX)objdump --disassemble-all --reloc --full-contents --all-headers --source --syms --debugging $< > $(BUILD)/$@

clean:
	-@rm -rf $(BUILD)

all: clean app.bin
.PHONY: all

flash: $(BUILD)/app.bin
	sudo st-flash write $(BUILD)/app.bin 0x08000000

dump: app.dmp
