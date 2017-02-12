#include <msp430f5438a.h>

int main(void) {

         WDTCTL = WDTPW | WDTHOLD;
//DISABLE WATCHDOG TIMER
         P1DIR = 0x03;
//SET P1 TO OUTPUT
         TA1CTL = TASSEL_1|MC_1|TACLR;
//CONFIGURE TIMER A1 CTL
TA1CCR0 = 1000000;
//SETS THE SPEED
         while (1) {
//WHILE THIS IS TRUE
                  P1OUT ^= 1;
//TOGGLE LED 1
                  while ((TA1CTL & BIT0) == 0){
                	  P1OUT &=0xFD;
                  }
                  TA1CTL &= ~BIT0;
//RESETS THE TIMER A1
         }
}
