
#include <msp430f5438a.h>

int main(void) {

         WDTCTL = WDTPW | WDTHOLD;
//DISABLE WATCHDOG TIMER
         P1DIR = 0x03;
//SET P1 TO OUTPUT
         P2DIR = 0;
//SET P2 TO INPUT
         P2REN = 0xC0;
//CONFIGURE P2
         P2OUT = 0xC0;
//ENABLE P2

         TA1CTL = TASSEL_1|MC_1|TACLR;
//CONFIGURE TIMER A1 CTL
TA1CCR0 = 62000;
//SET THE MAX

         int sum;

         while (1) {
//WHILE THIS IS TRUE
                  P1OUT ^= 1;
//TOGGLE LED 1
                  while ((TA1CTL & BIT0) == 0){
//IF THE TIMER IS NOT DONE
                           if ((P2IN & BIT6) == 0){
//IF WE PRESS THE LEST BUTTON
                                    if (TA1CCR0 > 36000){
//SKIP
                                    }
                                    else {
                                             P1OUT ^= 0x02;
//TOGGLE THE SECOND LED
                                             sum = sum + 1;
//INCREASE SUM
                                             if (sum == 5050){
                                                      TA1CCR0 = TA1CCR0 + 5276;
//DECREASE THE FLASH SPEED
                                                      sum = 0;
//RESET SUM
                                             }
                                    }
                           }
                           else if ((P2IN & BIT7) == 0){
//IF WE PRESS THE RIGHT BUTTON
                                    if (TA1CCR0 < 4500) {

//SKIP
                                    }
                                    else {
                                             P1OUT ^= 0x02;
//TOGGLE THE SECOND LED
                                             sum = sum + 1;
//INCREASE SUM
                                             if (sum == 5050) {
                                                      TA1CCR0 = TA1CCR0 - 5276;
//INCREASE THE FLASH SPEED
                                                      sum = 0;
//RESET SUM
                                             }
                                    }
                           }
                           else {
                                    P1OUT &= 0xFD;
//TURN THEM OFF
                           }
                  }
                  TA1CTL &= ~BIT0;
//RESETS THE TIMER A1
         }
}
