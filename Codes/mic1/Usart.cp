#line 1 "C:/Users/Mega Store/Desktop/STM project1/STM project1/mic1/Usart.c"
#line 1 "c:/users/mega store/desktop/stm project1/stm project1/mic1/usart.h"
#line 1 "d:/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "d:/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 1 "c:/users/mega store/desktop/stm project1/stm project1/mic1/gpio.h"
#line 1 "d:/mikroc pro for arm/include/stdio.h"
#line 1 "d:/mikroc pro for arm/include/stdlib.h"







 typedef struct divstruct {
 int quot;
 int rem;
 } div_t;

 typedef struct ldivstruct {
 long quot;
 long rem;
 } ldiv_t;

 typedef struct uldivstruct {
 unsigned long quot;
 unsigned long rem;
 } uldiv_t;

int abs(int a);
float atof(char * s);
int atoi(char * s);
long atol(char * s);
div_t div(int number, int denom);
ldiv_t ldiv(long number, long denom);
uldiv_t uldiv(unsigned long number, unsigned long denom);
long labs(long x);
long int max(long int a, long int b);
long int min(long int a, long int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 1 "d:/mikroc pro for arm/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 1 "c:/users/mega store/desktop/stm project1/stm project1/mic1/std_types.h"
#line 1 "d:/mikroc pro for arm/include/stdio.h"
#line 1 "d:/mikroc pro for arm/include/stdlib.h"
#line 1 "d:/mikroc pro for arm/include/string.h"
#line 47 "c:/users/mega store/desktop/stm project1/stm project1/mic1/std_types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef unsigned long long uint64;
typedef signed char sint8;
typedef signed short sint16;
typedef signed int sint32;
typedef signed long long sint64;
typedef float float32;
typedef double float64;
#line 10 "c:/users/mega store/desktop/stm project1/stm project1/mic1/gpio.h"
typedef enum{
 LOW = 0,
 HIGH
}logic_t;

typedef enum{
 OUTPUT = 0,
 INPUT
}direction_t;

typedef enum{
 PIN0 = 0,
 PIN1,
 PIN2,
 PIN3,
 PIN4,
 PIN5,
 PIN6,
 PIN7,
 PIN8,
 PIN9,
 PIN10,
 PIN11,
 PIN12,
 PIN13,
 PIN14,
 PIN15
}pin_index_t;

typedef enum{
 PORTA_INDEX = 0,
 PORTB_INDEX,
 PORTC_INDEX,
 PORTD_INDEX,
 PORTE_INDEX,
 PORTH_INDEX
}port_index_t;

typedef struct{
 uint8 port : 3;
 uint8 pin : 3;
 uint8 direction : 1;
 uint8 logic : 1;
}pin_config_t;



uint8 gpio_pin_intialize(pin_config_t *pin_config);
uint8 gpio_pin_write(pin_config_t *pin_config, logic_t logic);
#line 12 "c:/users/mega store/desktop/stm project1/stm project1/mic1/usart.h"
void usart1_begin(uint64_t baudRate);
#line 19 "c:/users/mega store/desktop/stm project1/stm project1/mic1/usart.h"
int available ();
#line 25 "c:/users/mega store/desktop/stm project1/stm project1/mic1/usart.h"
void write(int8_t ch);
#line 32 "c:/users/mega store/desktop/stm project1/stm project1/mic1/usart.h"
void writeString(int8_t* String, uint32_t Length);
#line 37 "c:/users/mega store/desktop/stm project1/stm project1/mic1/usart.h"
uint8_t read();
#line 43 "c:/users/mega store/desktop/stm project1/stm project1/mic1/usart.h"
uint8_t readBytes(uint8_t* String, uint32_t Length);
#line 49 "c:/users/mega store/desktop/stm project1/stm project1/mic1/usart.h"
void Print(char* String);
#line 55 "c:/users/mega store/desktop/stm project1/stm project1/mic1/usart.h"
void Println(char* String);
#line 3 "C:/Users/Mega Store/Desktop/STM project1/STM project1/mic1/Usart.c"
void usart1_begin(uint64_t baudRate)
{
 float USARTDIV;
 float FRACTION_temp;
 int Mantissa , Fraction ;

 RCC_AHB1ENRbits.GPIOAEN = 1;
 RCC_APB2ENRbits.USART1EN = 1;


 GPIOA_MODERbits.MODER9 = 0x2;
 GPIOA_MODERbits.MODER10 = 0x2;
 GPIOA_AFRHbits.AFRH9 = 0x07;
 GPIOA_AFRHbits.AFRH10 = 0x07;


 USART1_CR1bits.UE = 0;





 if (baudRate == 1200)
 {
 USART1_BRR = 13328;
 }
 else if (baudRate == 2400)
 {
 USART1_BRR = 6656;
 }
 else if (baudRate == 9600)
 {
 USART1_BRR = 1664;
 }
 else if (baudRate == 19200)
 {
 USART1_BRR = 832;
 }
 else if (baudRate == 38400)
 {
 USART1_BRR = 416;
 }
 else if (baudRate == 57600)
 {
 USART1_BRR = 272;
 }
 else if (baudRate == 115200)
 {
 USART1_BRR = 128;
 }
 else if (baudRate == 230400)
 {
 USART1_BRR = 64;
 }
 else if (baudRate == 460800)
 {
 USART1_BRR = 32;
 }






 USART1_CR1bits.TE = 1;
 USART1_CR1bits.RE = 1;
 USART1_CR1bits.M = 0;
 USART1_CR1bits.PCE = 0;
 USART1_CR1bits.OVER8 = 0;
 USART1_CR2bits.STOP = 0;
 USART1_CR3bits.HDSEL = 0;
 USART1_CR1bits.UE = 1;
}
int available ()
{
 return USART1_SRbits.RXNE;

}
void write(int8_t ch)
{
 while (!USART1_SRbits.TXE);
 USART1_DR = ch ;
}

void writeString(int8_t* String, uint32_t Length)
{ uint32_t Index = 0;

 for(Index = 0; Index < Length; Index++)
 {
 while (!available());
 USART1_DR = String[Index];
 }

}

uint8_t read()
{
 while (!available());
 return USART1_DR;
}
uint8_t readBytes(uint8_t* String, uint32_t Length)
{
 uint32_t Index = 0;

 for(Index = 0; Index < Length; Index++)
 {
 while (!available());
 USART1_DR = String[Index];
 return USART1_DR ;
 }
}

void Print(char* String)
{ uint32_t Index = 0;
 while (String[Index] != '\0')
 {
 while(!available());
 USART1_DR = String[Index];
 Index++;
 }
}

void Println(char* String)
{ uint32_t Index = 0;
 while (String[Index] != '\0')
 {
 while(!available());
 USART1_DR = String[Index];
 Index++;
 }

 USART1_DR = '\0';
}
