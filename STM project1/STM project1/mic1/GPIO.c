 #include "GPIO.h"
 uint8 gpio_pin_intialize(pin_config_t *pin_config){
  uint8 ret = E_OK;
  uint8 pin_1 = (pin_config->pin)*2;
  uint8 pin_2 = ( (pin_config->pin) * 2 ) + 1;
  if(NULL == pin_config){
          ret = E_NOT_OK;
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
                         else{/* Nothing */}
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
                         else{/* Nothing */}
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
                         else{/* Nothing */}
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
                         else{/* Nothing */}
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
                         else{/* Nothing */}
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
                         else{/* Nothing */}
                         break;
                    default:
                            ret = E_NOT_OK;
                            break;
       }
  }
  return ret;
 }

 uint8 gpio_pin_write(pin_config_t *pin_config, logic_t logic){
  uint8 ret = E_OK;
  if(NULL == pin_config){
          ret = E_NOT_OK;
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
                         else{/* Nothing */}
                         break;
                    case PORTB_INDEX:
                         if(logic == HIGH){
                                  GPIOB_ODR |= (1<<pin_config->pin);
                         }
                         else if(logic == LOW){
                                  GPIOB_ODR &= ~(1<<pin_config->pin);
                         }
                         else{/* Nothing */}
                         break;
                    case PORTC_INDEX:
                         if(logic == HIGH){
                                  GPIOC_ODR |= (1<<pin_config->pin);
                         }
                         else if(logic == LOW){
                                  GPIOC_ODR &= ~(1<<pin_config->pin);
                         }
                         else{/* Nothing */}
                         break;
                    case PORTD_INDEX:
                         if(logic == HIGH){
                                  GPIOD_ODR |= (1<<pin_config->pin);
                         }
                         else if(logic == LOW){
                                  GPIOD_ODR &= ~(1<<pin_config->pin);
                         }
                         else{/* Nothing */}
                         break;
                    case PORTE_INDEX:
                         if(logic == HIGH){
                                  GPIOE_ODR |= (1<<pin_config->pin);
                         }
                         else if(logic == LOW){
                                  GPIOE_ODR &= ~(1<<pin_config->pin);
                         }
                         else{/* Nothing */}
                         break;
                    default:
                            ret = E_NOT_OK;
                            break;
       }
  }
  return ret;
 }