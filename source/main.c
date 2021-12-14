
/*  Author: Nathan Lee nlee096@ucr.edu
 *  Partner(s) Name: none
 *  Lab Section: 022
 *  Assignment: Lab #5 Exercise #3
 *  Exercise Description: festive light display (6 LED) button advances sequence. link to folder with the video: https://drive.google.com/drive/folders/1k0q6lkBQ9E0uEqfn2aC5QpUDatSKANSo?usp=sharing
 *
 *  I acknowledge all content contained herein, excluding template or example
 *  code, is my own original work.
 * 
 *  Demo Link: https://drive.google.com/file/d/1bqgPHCygfCEDnh-yOqLcC-ti-qzNO638/view?usp=sharing
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

enum States {Start, RELEASE, PRESS} state;
unsigned char temp;
unsigned char button;

void Tick() {
    switch(state){ // Transitions...
        case Start:
            state = RELEASE;
            temp = 0x00;
            break;
        case RELEASE:
            if(button == 0x00){
                state = RELEASE;
            }
            else if(button == 0x01){
                if((temp >= 0x03) && (temp <= 0x18)){
                    temp = temp <<1;
                }
                else if(temp == 0x30){
                    temp = 0x20;
                }
                else if(temp == 0x20){
                    temp = 0x00;
                }
                else if(temp == 0x00){
                    temp = 0x01;
                }
                else if(temp == 0x01){
                    temp = 0x03;
                }
                state = PRESS;
            }
            break;
        case PRESS:
            if(button == 0x01){
                state = PRESS;
            }
            else if(button == 0x00){
                state = RELEASE;
            }
            break;
        
        default:
            break;

    } 
    /*switch(state){ // State actions... 

    }*/
}

int main(void) {
    /* Insert DDR and PORT initializations */
    DDRA = 0x00; PORTA = 0xFF;
    DDRB = 0xFF; PORTB = 0x00;
    /* Insert your solution below */
    state = Start;
    temp = 0x00;
    button = 0x00;
    while (1) { 
        button = ~PINA & 0x01;
        Tick();
        PORTB = temp;
    }
    //return 1;
}