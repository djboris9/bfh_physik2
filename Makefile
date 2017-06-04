# Variables
TARGET=prog
SOURCES=prog.c uart.c
F_CPU=16000000UL
PORT=/dev/ttyACM0
MCU=atmega328p
PROGRAMMER=arduino
PART=m328p

# Compiling and linking
OBJECTS=$(SOURCES:.c=.o)
CFLAGS += -DF_CPU=$(F_CPU) -mmcu=$(MCU) -Os -c
LDFLAGS += -mmcu=$(MCU) -Wl,-u,vfprintf -lprintf_flt -lm

.c.o:
	avr-gcc $(CFLAGS) $< -o $@

$(TARGET).elf: $(OBJECTS)
	avr-gcc $(LDFLAGS) $(OBJECTS) -o $(TARGET).elf

$(TARGET).hex: $(TARGET).elf
	avr-objcopy -O ihex -j .text -j .data $(TARGET).elf $(TARGET).hex

size:
	avr-size --mcu=$(MCU) -C $(TARGET).elf 

flash:
	avrdude -p $(PART) -c $(PROGRAMMER) -P $(PORT) -U flash:w:$(TARGET).hex:a

clean:
	rm -f *.elf *.o *.hex

.PHONY: all size flash clean
all: clean $(TARGET).hex size flash
