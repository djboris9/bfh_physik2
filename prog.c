#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>
#include "prog.h"

void ADC_Init(void)
{
  // Set AVcc as Reference
  ADMUX = (1<<REFS0);    

  // Frequenzvorteiler
  ADCSRA = (1<<ADPS1) | (1<<ADPS0);

  // ADC Enable
  ADCSRA |= (1<<ADEN);

  // ADC Dummy readout
  ADC_Read(0);
}

uint16_t ADC_Read( uint8_t channel )
{
  // Select read channel
  ADMUX = (ADMUX & ~(0x1F)) | (channel & 0x1F);

  // Set single conversion
  ADCSRA |= (1<<ADSC);

  // Wait for conversion
  while (ADCSRA & (1<<ADSC) ) {}

  // Read out
  return ADCW;
}


int main (void) {

   DDRB |= (1 << PB5);

   while(1) {
       PORTB ^= (1 << PB5);
       uint16_t t = ADC_Read(0);
       for (;t>0; t--) {
           _delay_ms(50);
       }
   }

   return 0;
}
