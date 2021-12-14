
/*  Author: Nathan Lee nlee096@ucr.edu
 *  Partner(s) Name: none
 *  Lab Section: 022
 *  Assignment: Lab #5 Exercise #2
 *  Exercise Description: 2 buttons: increment, decrement, reset with lights
 *
 *  I acknowledge all content contained herein, excluding template or example
 *  code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

enum States {Start, WAIT, A0_PRESS, A1_PRESS, RESET} state;
unsigned char cnt;
unsigned char button;

void Tick() {
    switch(state){ // Transitions...
        case Start:
            cnt = 0x07;
            state = WAIT;
            break;
        case WAIT:
            if(button == 0x00){
                state = WAIT;
            }
            else if(button == 0x03){
                cnt = 0x00;
                state = RESET;
            }
            else if(button == 0x01){
                cnt = (cnt<9)? (cnt+1) :  0x09;
                state = A0_PRESS;
            }
            else if(button == 0x02){
                cnt = (cnt>0)? (cnt-1) :  0x00;
                state = A1_PRESS;
            }
            break;
        case A0_PRESS:
            if(button == 0x00){
                state = WAIT;
            }
            else if(button == 0x03){
                cnt = 0x00;
                state = RESET;
            }
            else if(button == 0x01){
                state = A0_PRESS;
            }
            else if(button == 0x02){
                cnt = (cnt>0)? (cnt-1) :  0x00;
                state = A1_PRESS;
            }
            break;
        case A1_PRESS:
            if(button == 0x00){
                state = WAIT;
            }
            else if(button == 0x03){
                cnt = 0x00;
                state = RESET;
            }
            else if(button == 0x01){
                cnt = (cnt<9)? (cnt+1) :  0x09;
                state = A0_PRESS;
            }
            else if(button == 0x02){
                state = A1_PRESS;
            }
            break;
        case RESET:
            if(button == 0x00){
                state = WAIT;
            }
            else if(button == 0x03){
                cnt = 0x00;
                state = RESET;
            }
            else if(button == 0x01){
                cnt = 0x00;
                state = RESET;
                /*cnt = (cnt<9)? (cnt+1) :  0x09;
                state = A0_PRESS;*/
            }
            else if(button == 0x02){
                cnt = 0x00;
                state = RESET;
                /*cnt = (cnt>0)? (cnt-1) :  0x00;
                state = A1_PRESS;*/
            }
        default:
            break;

    } 
    //switch(state){ // State actions... 
    //}
}

int main(void) {
    /* Insert DDR and PORT initializations */
    DDRA = 0x00; PORTA = 0xFF;
    DDRC = 0xFF; PORTC = 0x00;
    /* Insert your solution below */
    cnt = 0x00;
    state = Start;
    button = 0x00;
    while (1) { 
        button = ~PINA & 0x03;
        Tick();
        PORTC = cnt;
    }
    //return 1;
}