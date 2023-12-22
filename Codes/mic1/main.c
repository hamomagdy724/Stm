#include "main.h"

void main() {

    uint8 ret = E_OK;
    uint8 data_received;
    uint8 flag = 0;
    pin_config_t led_1;
    led_1.port      = PORTB_INDEX;   // connect led to port B
    led_1.pin       = PIN5;           //    connect led to pin 5
    led_1.direction = OUTPUT;
    led_1.logic     = LOW;
    // Initialize USART1 with a baud rate of your choice
    usart1_begin(9600); // Change baud rate as needed


    // Initialize Port B Pin 5 as output for LED
    ret = gpio_pin_intialize(&led_1);
    while (1) {

        // Receive a character from USART1
        data_received = read();
        if ( (data_received == 'y') && (flag == 0) ) {
            // If 'c' is received, turn on LED and transmit 'b'
            ret = gpio_pin_write(&led_1, HIGH);
            flag = 1;
        }
        if ( (data_received == 'n') && (flag == 1) ) {
            // If 'd' is received, turn off LED and transmit 'a'
            ret = gpio_pin_write(&led_1, LOW);
            flag = 0;
        }
    }


   /*  usart1_begin(9600); // Change baud rate as needed
      while (1) {
          write('y');
          Delay_ms(3000);
          write('n');
          Delay_ms(3000);
      }     */

      
  }