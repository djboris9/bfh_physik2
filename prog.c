#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>
#include "prog.h"
#include "uart.h"

#define INPBUF_LEN 200

void adc_init(void) {
	ADMUX   = _BV(REFS0); // Set AVcc as reference
	ADCSRA  = _BV(ADPS2); // Prescaler: 16MHz/16 = 1 MHz
	ADCSRA |= _BV(ADEN);  // ADC Enable

	(void) adc_read(0); // Dummy read
}

uint16_t adc_read(uint8_t chan) {
	ADMUX = (ADMUX & ~(0x1F)) | (chan & 0x1F); // Select read channel
	ADCSRA |= _BV(ADSC);                       // Start conversion

	loop_until_bit_is_clear(ADCSRA, ADSC);     // Busy wait for completion
	return ADCW;
}

// Initialize 16-Bit timer
void timer1_init(void) {
	TCCR1B = _BV(CS10); // Prescaler: 16MHz/1 = 16 MHz
	TCNT1 = 0; // Initialize to zero
}

inline void timer1_reset(void) {
	TCNT1 = 0;
}

inline uint16_t timer1_get(void) {
	return TCNT1;
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

#define BREAKOUT_LEVEL 600

void distMeter() {
	uint16_t inp_0_ref = 0;
	uint16_t inp_1_ref = 0;
	uint16_t inp_2_ref = 0;
	uint8_t inp_0_set = 0;
	uint8_t inp_1_set = 0;
	uint8_t inp_2_set = 0;
	uint8_t timing = 0;

	for (;;) {
		uint16_t inp_0 = adc_read(0);
		uint16_t inp_1 = adc_read(1);
		uint16_t inp_2 = adc_read(2);

		if (inp_0 >= BREAKOUT_LEVEL && !inp_0_set) {
			// inp_0 breakout
			if (!timing) {
				timer1_reset();
				timing = 1;
			}

			inp_0_ref = timer1_get();
			inp_0_set = 1;

		} else if (inp_1 >= BREAKOUT_LEVEL && !inp_1_set) {
			// inp_1 breakout
			if (!timing) {
				timer1_reset();
				timing = 1;
			}

			inp_1_ref = timer1_get();
			inp_1_set = 1;
		} else if (inp_2 >= BREAKOUT_LEVEL && !inp_2_set) {
			// inp_2 breakout
			if (!timing) {
				timer1_reset();
				timing = 1;
			}

			inp_2_ref = timer1_get();
			inp_2_set = 1;
		}

		if (inp_0_set && inp_1_set && inp_2_set) {
			// Process and display result
			stdout = &uart_output;
			fprintf(stdout, "TimeDiffRaw: inp0=%i inp1=%i inp2=%i\n", inp_0_ref, inp_1_ref, inp_2_ref);

			// Reset variables to default
			inp_0_ref = 0;
			inp_1_ref = 0;
			inp_2_ref = 0;
			inp_0_set = 0;
			inp_1_set = 0;
			inp_2_set = 0;
			timing = 0;

			// Sleep for 2s
			_delay_ms(2000);
		}
	}
}

int main(void) {
	// Initializations
	uart_init();
	stdout = &uart_output;
	adc_init();
	timer1_init();

	puts("Initialized!");

	distMeter();

	return 0;
}
