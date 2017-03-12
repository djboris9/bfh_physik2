#include <avr/io.h>
#include <stdio.h>

#define BAUD 9600
#include <util/setbaud.h>

// Initializes the UART to 8-Bit (according 20.11.4) TX only
void uart_init(void) {
	UBRR0H = UBRRH_VALUE;
	UBRR0L = UBRRL_VALUE;

	UCSR0B = _BV(TXEN0);   /* Only TX */
}

void uart_putchar(char c, FILE *stream) {
	if (c == '\n') {
		uart_putchar('\r', stream);
	}
	loop_until_bit_is_set(UCSR0A, UDRE0);
	UDR0 = c;
}

