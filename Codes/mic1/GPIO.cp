#line 1 "C:/Users/Mega Store/Desktop/STM project1/STM project1/mic1/GPIO.c"
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
#line 2 "C:/Users/Mega Store/Desktop/STM project1/STM project1/mic1/GPIO.c"
 uint8 gpio_pin_intialize(pin_config_t *pin_config){
 uint8 ret =  (uint8) 0x01 ;
 uint8 pin_1 = (pin_config->pin)*2;
 uint8 pin_2 = ( (pin_config->pin) * 2 ) + 1;
 if( 0  == pin_config){
 ret =  (uint8) 0x00 ;
 }
 else{
 RCC_AHB1ENR |= (1<<pin_config->port);
 switch(pin_config->port){
 case PORTA_INDEX:
 if(pin_config->direction == OUTPUT){
 GPIOA_MODER |= (1<<pin_1);
 GPIOA_MODER &= ~(1<<pin_2);
 }
 else if(pin_config->direction == INPUT){
 GPIOA_MODER &= ~(1<<pin_1);
 GPIOA_MODER &= ~(1<<pin_2);
 }
 else{ }
 break;
 case PORTB_INDEX:
 if(pin_config->direction == OUTPUT){
 GPIOB_MODER |= (1<<pin_1);
 GPIOB_MODER &= ~(1<<pin_2);
 }
 else if(pin_config->direction == INPUT){
 GPIOB_MODER &= ~(1<<pin_1);
 GPIOB_MODER &= ~(1<<pin_2);
 }
 else{ }
 break;
 case PORTC_INDEX:
 if(pin_config->direction == OUTPUT){
 GPIOC_MODER |= (1<<pin_1);
 GPIOC_MODER &= ~(1<<pin_2);
 }
 else if(pin_config->direction == INPUT){
 GPIOC_MODER &= ~(1<<pin_1);
 GPIOC_MODER &= ~(1<<pin_2);
 }
 else{ }
 break;
 case PORTD_INDEX:
 if(pin_config->direction == OUTPUT){
 GPIOD_MODER |= (1<<pin_1);
 GPIOD_MODER &= ~(1<<pin_2);
 }
 else if(pin_config->direction == INPUT){
 GPIOD_MODER &= ~(1<<pin_1);
 GPIOD_MODER &= ~(1<<pin_2);
 }
 else{ }
 break;
 case PORTE_INDEX:
 if(pin_config->direction == OUTPUT){
 GPIOE_MODER |= (1<<pin_1);
 GPIOE_MODER &= ~(1<<pin_2);
 }
 else if(pin_config->direction == INPUT){
 GPIOE_MODER &= ~(1<<pin_1);
 GPIOE_MODER &= ~(1<<pin_2);
 }
 else{ }
 break;
 case PORTH_INDEX:
 if(pin_config->direction == OUTPUT){
 GPIOH_MODER |= (1<<pin_1);
 GPIOH_MODER &= ~(1<<pin_2);
 }
 else if(pin_config->direction == INPUT){
 GPIOH_MODER &= ~(1<<pin_1);
 GPIOH_MODER &= ~(1<<pin_2);
 }
 else{ }
 break;
 default:
 ret =  (uint8) 0x00 ;
 break;
 }
 }
 return ret;
 }

 uint8 gpio_pin_write(pin_config_t *pin_config, logic_t logic){
 uint8 ret =  (uint8) 0x01 ;
 if( 0  == pin_config){
 ret =  (uint8) 0x00 ;
 }
 else{
 switch(pin_config->port){
 case PORTA_INDEX:
 if(logic == HIGH){
 GPIOA_ODR |= (1<<pin_config->pin);
 }
 else if(logic == LOW){
 GPIOA_ODR &= ~(1<<pin_config->pin);
 }
 else{ }
 break;
 case PORTB_INDEX:
 if(logic == HIGH){
 GPIOB_ODR |= (1<<pin_config->pin);
 }
 else if(logic == LOW){
 GPIOB_ODR &= ~(1<<pin_config->pin);
 }
 else{ }
 break;
 case PORTC_INDEX:
 if(logic == HIGH){
 GPIOC_ODR |= (1<<pin_config->pin);
 }
 else if(logic == LOW){
 GPIOC_ODR &= ~(1<<pin_config->pin);
 }
 else{ }
 break;
 case PORTD_INDEX:
 if(logic == HIGH){
 GPIOD_ODR |= (1<<pin_config->pin);
 }
 else if(logic == LOW){
 GPIOD_ODR &= ~(1<<pin_config->pin);
 }
 else{ }
 break;
 case PORTE_INDEX:
 if(logic == HIGH){
 GPIOE_ODR |= (1<<pin_config->pin);
 }
 else if(logic == LOW){
 GPIOE_ODR &= ~(1<<pin_config->pin);
 }
 else{ }
 break;
 default:
 ret =  (uint8) 0x00 ;
 break;
 }
 }
 return ret;
 }
