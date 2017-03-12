#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>
#include "prog.h"
#include "uart.h"

#define INPBUF_LEN 200

void adc_init(void) {
	ADMUX   = _BV(REFS0);              // Set AVcc as reference
	ADCSRA  = _BV(ADPS2) | _BV(ADPS0); // Prescaler: 16MHz/32 = 500KHz
	ADCSRA |= _BV(ADEN);               // ADC Enable

	(void) adc_read(0); // Dummy read
}

uint16_t adc_read(uint8_t chan) {
	ADMUX = (ADMUX & ~(0x1F)) | (chan & 0x1F); // Select read channel
	ADCSRA |= _BV(ADSC);                       // Start conversion

	loop_until_bit_is_clear(ADCSRA, ADSC);     // Busy wait for completion
	return ADCW;
}

uint16_t inpbuf[INPBUF_LEN];

void recordInpbuf(uint8_t chan) {
	// Read into inpbuf
	for (uint8_t i=0; i<INPBUF_LEN; i++)
		inpbuf[i] = adc_read(chan);

	// Write inpbuf out
	stdout = &uart_output;
	for (uint8_t i=0; i<INPBUF_LEN; i++)
		fprintf(stdout, "%i\n", inpbuf[i]);

	puts("\n");
}

int main(void) {
	// Initializations
	uart_init();
	stdout = &uart_output;
	adc_init();

	puts("Initialized!");

	// XXX Time meassurement
	DDRB |= _BV(PB5); // Set arduino LED pin 13 to output 

	while(1) {
		PORTB |= _BV(PB5);  // High
		recordInpbuf(0);
		PORTB &= ~_BV(PB5); // Low
		_delay_ms(5000);
	}

	return 0;
}
