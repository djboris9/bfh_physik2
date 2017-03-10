TARGET=prog
CC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-DF_CPU=16000000UL -mmcu=atmega328p -Os
PORT=/dev/ttyACM0

compile:
	${CC} -mmcu=atmega328p -Os -c $(TARGET).c -o $(TARGET).o

link: $(TARGET).o
	${CC} $(TARGET).o -o $(TARGET).elf

ihex: $(TARGET).elf
	${OBJCOPY} -O ihex -j .text -j .data $(TARGET).elf $(TARGET).hex

.PHONY: size
size:
	avr-size --mcu=atmega328p -C $(TARGET).elf 

.PHONY: flash
flash:
	avrdude -p m328p -c arduino -P $(PORT) -U flash:w:$(TARGET).elf:a

.PHONY: clean
clean:
	rm -f $(TARGET).elf $(TARGET).o $(TARGET).hex

.PHONY: all
all: clean compile link ihex size flash
