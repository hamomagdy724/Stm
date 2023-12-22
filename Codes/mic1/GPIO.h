#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "std_types.h"
#define NULL       0
#define ENABLE     1
#define DISABLE    0


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
    uint8 port      : 3;
    uint8 pin       : 3;
    uint8 direction : 1;
    uint8 logic     : 1;
}pin_config_t;



uint8 gpio_pin_intialize(pin_config_t *pin_config);
uint8 gpio_pin_write(pin_config_t *pin_config, logic_t logic);