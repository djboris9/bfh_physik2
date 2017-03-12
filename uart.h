#include <stdio.h>

void uart_init(void);
int uart_putchar(char c, FILE *stream);

FILE uart_output = FDEV_SETUP_STREAM(uart_putchar, NULL, _FDEV_SETUP_WRITE);
