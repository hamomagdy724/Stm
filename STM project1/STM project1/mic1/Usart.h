#ifndef _USART_H
#define  _USART_H


#include <stdint.h>
#include <stdbool.h>
#include "GPIO.h"

/* This Function will start USART1 to transmit and receive data
   buadRate for selection buad rate ex 9600
*/
void usart1_begin(uint64_t baudRate);


/* This Function will use to make sure that recived data bus is empty if it recived then i can read or write data
   return 1 if empty
          0 if not empty
*/
int available ();

/*
   This Function will use to write character
   ch : is the character that you will write it
*/
void  write(int8_t ch);

/*
   This Function will use to write String
   String : is the String that you will write it
   Length : the Length of  String
*/
void  writeString(int8_t* String, uint32_t Length);

/*
   This Function will use to read character
*/
uint8_t  read();

/*
   This Function will use to read string
   String : will store string that will read  in this Parameter
*/
uint8_t readBytes(uint8_t* String, uint32_t Length);

/*
   This Function will use to print string
   String : this is the string that will be Print it
*/
void Print(char* String);

/*
   This Function will use to print string  with NULL terminator '\0'
   String : this is the string that will be Print it
*/
void Println(char* String);

#endif