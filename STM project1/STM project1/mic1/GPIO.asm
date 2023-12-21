_gpio_pin_intialize:
;GPIO.c,2 :: 		uint8 gpio_pin_intialize(pin_config_t *pin_config){
; pin_config start address is: 0 (R0)
; pin_config end address is: 0 (R0)
; pin_config start address is: 0 (R0)
;GPIO.c,3 :: 		uint8 ret = E_OK;
; ret start address is: 16 (R4)
MOVS	R4, #1
;GPIO.c,4 :: 		uint8 pin_1 = (pin_config->pin)*2;
LDRB	R2, [R0, #0]
UBFX	R1, R2, #3, #3
LSLS	R1, R1, #1
; pin_1 start address is: 20 (R5)
UXTB	R5, R1
;GPIO.c,5 :: 		uint8 pin_2 = ( (pin_config->pin) * 2 ) + 1;
UBFX	R1, R2, #3, #3
LSLS	R1, R1, #1
SXTH	R1, R1
ADDS	R1, R1, #1
; pin_2 start address is: 24 (R6)
UXTB	R6, R1
;GPIO.c,6 :: 		if(NULL == pin_config){
CMP	R0, #0
IT	NE
BNE	L_gpio_pin_intialize0
; pin_config end address is: 0 (R0)
; ret end address is: 16 (R4)
; pin_1 end address is: 20 (R5)
; pin_2 end address is: 24 (R6)
;GPIO.c,7 :: 		ret = E_NOT_OK;
; ret start address is: 0 (R0)
MOVS	R0, #0
;GPIO.c,8 :: 		}
; ret end address is: 0 (R0)
IT	AL
BAL	L_gpio_pin_intialize1
L_gpio_pin_intialize0:
;GPIO.c,10 :: 		RCC_AHB1ENR |= (1<<pin_config->port);
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; ret start address is: 16 (R4)
; pin_config start address is: 0 (R0)
LDRB	R1, [R0, #0]
UBFX	R2, R1, #0, #3
MOVS	R1, #1
SXTH	R1, R1
LSL	R2, R1, R2
SXTH	R2, R2
MOVW	R1, #lo_addr(RCC_AHB1ENR+0)
MOVT	R1, #hi_addr(RCC_AHB1ENR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(RCC_AHB1ENR+0)
MOVT	R1, #hi_addr(RCC_AHB1ENR+0)
STR	R2, [R1, #0]
;GPIO.c,11 :: 		switch(pin_config->port){
MOV	R3, R0
IT	AL
BAL	L_gpio_pin_intialize2
;GPIO.c,12 :: 		case PORTA_INDEX:
L_gpio_pin_intialize4:
;GPIO.c,13 :: 		if(pin_config->direction == OUTPUT){
LDRB	R2, [R0, #0]
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	NE
BNE	L_gpio_pin_intialize5
; pin_config end address is: 0 (R0)
;GPIO.c,14 :: 		GPIOA_MODER |= (1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSL	R2, R1, R5
SXTH	R2, R2
; pin_1 end address is: 20 (R5)
MOVW	R1, #lo_addr(GPIOA_MODER+0)
MOVT	R1, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOA_MODER+0)
MOVT	R1, #hi_addr(GPIOA_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,15 :: 		GPIOA_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_MODER+0)
MOVT	R1, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOA_MODER+0)
MOVT	R1, #hi_addr(GPIOA_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,16 :: 		}
IT	AL
BAL	L_gpio_pin_intialize6
L_gpio_pin_intialize5:
;GPIO.c,17 :: 		else if(pin_config->direction == INPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
; pin_config end address is: 0 (R0)
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	EQ
BEQ	L_gpio_pin_intialize7
;GPIO.c,18 :: 		GPIOA_MODER &= ~(1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R5
SXTH	R1, R1
; pin_1 end address is: 20 (R5)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_MODER+0)
MOVT	R1, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOA_MODER+0)
MOVT	R1, #hi_addr(GPIOA_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,19 :: 		GPIOA_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOA_MODER+0)
MOVT	R1, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOA_MODER+0)
MOVT	R1, #hi_addr(GPIOA_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,20 :: 		}
IT	AL
BAL	L_gpio_pin_intialize8
L_gpio_pin_intialize7:
;GPIO.c,21 :: 		else{/* Nothing */}
L_gpio_pin_intialize8:
L_gpio_pin_intialize6:
;GPIO.c,22 :: 		break;
UXTB	R0, R4
IT	AL
BAL	L_gpio_pin_intialize3
;GPIO.c,23 :: 		case PORTB_INDEX:
L_gpio_pin_intialize9:
;GPIO.c,24 :: 		if(pin_config->direction == OUTPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	NE
BNE	L_gpio_pin_intialize10
; pin_config end address is: 0 (R0)
;GPIO.c,25 :: 		GPIOB_MODER |= (1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSL	R2, R1, R5
SXTH	R2, R2
; pin_1 end address is: 20 (R5)
MOVW	R1, #lo_addr(GPIOB_MODER+0)
MOVT	R1, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOB_MODER+0)
MOVT	R1, #hi_addr(GPIOB_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,26 :: 		GPIOB_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_MODER+0)
MOVT	R1, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOB_MODER+0)
MOVT	R1, #hi_addr(GPIOB_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,27 :: 		}
IT	AL
BAL	L_gpio_pin_intialize11
L_gpio_pin_intialize10:
;GPIO.c,28 :: 		else if(pin_config->direction == INPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
; pin_config end address is: 0 (R0)
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	EQ
BEQ	L_gpio_pin_intialize12
;GPIO.c,29 :: 		GPIOB_MODER &= ~(1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R5
SXTH	R1, R1
; pin_1 end address is: 20 (R5)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_MODER+0)
MOVT	R1, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOB_MODER+0)
MOVT	R1, #hi_addr(GPIOB_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,30 :: 		GPIOB_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOB_MODER+0)
MOVT	R1, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOB_MODER+0)
MOVT	R1, #hi_addr(GPIOB_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,31 :: 		}
IT	AL
BAL	L_gpio_pin_intialize13
L_gpio_pin_intialize12:
;GPIO.c,32 :: 		else{/* Nothing */}
L_gpio_pin_intialize13:
L_gpio_pin_intialize11:
;GPIO.c,33 :: 		break;
UXTB	R0, R4
IT	AL
BAL	L_gpio_pin_intialize3
;GPIO.c,34 :: 		case PORTC_INDEX:
L_gpio_pin_intialize14:
;GPIO.c,35 :: 		if(pin_config->direction == OUTPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	NE
BNE	L_gpio_pin_intialize15
; pin_config end address is: 0 (R0)
;GPIO.c,36 :: 		GPIOC_MODER |= (1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSL	R2, R1, R5
SXTH	R2, R2
; pin_1 end address is: 20 (R5)
MOVW	R1, #lo_addr(GPIOC_MODER+0)
MOVT	R1, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOC_MODER+0)
MOVT	R1, #hi_addr(GPIOC_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,37 :: 		GPIOC_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_MODER+0)
MOVT	R1, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOC_MODER+0)
MOVT	R1, #hi_addr(GPIOC_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,38 :: 		}
IT	AL
BAL	L_gpio_pin_intialize16
L_gpio_pin_intialize15:
;GPIO.c,39 :: 		else if(pin_config->direction == INPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
; pin_config end address is: 0 (R0)
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	EQ
BEQ	L_gpio_pin_intialize17
;GPIO.c,40 :: 		GPIOC_MODER &= ~(1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R5
SXTH	R1, R1
; pin_1 end address is: 20 (R5)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_MODER+0)
MOVT	R1, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOC_MODER+0)
MOVT	R1, #hi_addr(GPIOC_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,41 :: 		GPIOC_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOC_MODER+0)
MOVT	R1, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOC_MODER+0)
MOVT	R1, #hi_addr(GPIOC_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,42 :: 		}
IT	AL
BAL	L_gpio_pin_intialize18
L_gpio_pin_intialize17:
;GPIO.c,43 :: 		else{/* Nothing */}
L_gpio_pin_intialize18:
L_gpio_pin_intialize16:
;GPIO.c,44 :: 		break;
UXTB	R0, R4
IT	AL
BAL	L_gpio_pin_intialize3
;GPIO.c,45 :: 		case PORTD_INDEX:
L_gpio_pin_intialize19:
;GPIO.c,46 :: 		if(pin_config->direction == OUTPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	NE
BNE	L_gpio_pin_intialize20
; pin_config end address is: 0 (R0)
;GPIO.c,47 :: 		GPIOD_MODER |= (1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSL	R2, R1, R5
SXTH	R2, R2
; pin_1 end address is: 20 (R5)
MOVW	R1, #lo_addr(GPIOD_MODER+0)
MOVT	R1, #hi_addr(GPIOD_MODER+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOD_MODER+0)
MOVT	R1, #hi_addr(GPIOD_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,48 :: 		GPIOD_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOD_MODER+0)
MOVT	R1, #hi_addr(GPIOD_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOD_MODER+0)
MOVT	R1, #hi_addr(GPIOD_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,49 :: 		}
IT	AL
BAL	L_gpio_pin_intialize21
L_gpio_pin_intialize20:
;GPIO.c,50 :: 		else if(pin_config->direction == INPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
; pin_config end address is: 0 (R0)
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	EQ
BEQ	L_gpio_pin_intialize22
;GPIO.c,51 :: 		GPIOD_MODER &= ~(1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R5
SXTH	R1, R1
; pin_1 end address is: 20 (R5)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOD_MODER+0)
MOVT	R1, #hi_addr(GPIOD_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOD_MODER+0)
MOVT	R1, #hi_addr(GPIOD_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,52 :: 		GPIOD_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOD_MODER+0)
MOVT	R1, #hi_addr(GPIOD_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOD_MODER+0)
MOVT	R1, #hi_addr(GPIOD_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,53 :: 		}
IT	AL
BAL	L_gpio_pin_intialize23
L_gpio_pin_intialize22:
;GPIO.c,54 :: 		else{/* Nothing */}
L_gpio_pin_intialize23:
L_gpio_pin_intialize21:
;GPIO.c,55 :: 		break;
UXTB	R0, R4
IT	AL
BAL	L_gpio_pin_intialize3
;GPIO.c,56 :: 		case PORTE_INDEX:
L_gpio_pin_intialize24:
;GPIO.c,57 :: 		if(pin_config->direction == OUTPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	NE
BNE	L_gpio_pin_intialize25
; pin_config end address is: 0 (R0)
;GPIO.c,58 :: 		GPIOE_MODER |= (1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSL	R2, R1, R5
SXTH	R2, R2
; pin_1 end address is: 20 (R5)
MOVW	R1, #lo_addr(GPIOE_MODER+0)
MOVT	R1, #hi_addr(GPIOE_MODER+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOE_MODER+0)
MOVT	R1, #hi_addr(GPIOE_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,59 :: 		GPIOE_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_MODER+0)
MOVT	R1, #hi_addr(GPIOE_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOE_MODER+0)
MOVT	R1, #hi_addr(GPIOE_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,60 :: 		}
IT	AL
BAL	L_gpio_pin_intialize26
L_gpio_pin_intialize25:
;GPIO.c,61 :: 		else if(pin_config->direction == INPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
; pin_config end address is: 0 (R0)
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	EQ
BEQ	L_gpio_pin_intialize27
;GPIO.c,62 :: 		GPIOE_MODER &= ~(1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R5
SXTH	R1, R1
; pin_1 end address is: 20 (R5)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_MODER+0)
MOVT	R1, #hi_addr(GPIOE_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOE_MODER+0)
MOVT	R1, #hi_addr(GPIOE_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,63 :: 		GPIOE_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOE_MODER+0)
MOVT	R1, #hi_addr(GPIOE_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOE_MODER+0)
MOVT	R1, #hi_addr(GPIOE_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,64 :: 		}
IT	AL
BAL	L_gpio_pin_intialize28
L_gpio_pin_intialize27:
;GPIO.c,65 :: 		else{/* Nothing */}
L_gpio_pin_intialize28:
L_gpio_pin_intialize26:
;GPIO.c,66 :: 		break;
UXTB	R0, R4
IT	AL
BAL	L_gpio_pin_intialize3
;GPIO.c,67 :: 		case PORTH_INDEX:
L_gpio_pin_intialize29:
;GPIO.c,68 :: 		if(pin_config->direction == OUTPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	NE
BNE	L_gpio_pin_intialize30
; pin_config end address is: 0 (R0)
;GPIO.c,69 :: 		GPIOH_MODER |= (1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSL	R2, R1, R5
SXTH	R2, R2
; pin_1 end address is: 20 (R5)
MOVW	R1, #lo_addr(GPIOH_MODER+0)
MOVT	R1, #hi_addr(GPIOH_MODER+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOH_MODER+0)
MOVT	R1, #hi_addr(GPIOH_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,70 :: 		GPIOH_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOH_MODER+0)
MOVT	R1, #hi_addr(GPIOH_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOH_MODER+0)
MOVT	R1, #hi_addr(GPIOH_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,71 :: 		}
IT	AL
BAL	L_gpio_pin_intialize31
L_gpio_pin_intialize30:
;GPIO.c,72 :: 		else if(pin_config->direction == INPUT){
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; pin_config start address is: 0 (R0)
LDRB	R2, [R0, #0]
; pin_config end address is: 0 (R0)
UBFX	R1, R2, #6, #1
CMP	R1, #0
IT	EQ
BEQ	L_gpio_pin_intialize32
;GPIO.c,73 :: 		GPIOH_MODER &= ~(1<<pin_1);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R5
SXTH	R1, R1
; pin_1 end address is: 20 (R5)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOH_MODER+0)
MOVT	R1, #hi_addr(GPIOH_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOH_MODER+0)
MOVT	R1, #hi_addr(GPIOH_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,74 :: 		GPIOH_MODER &= ~(1<<pin_2);
MOVS	R1, #1
SXTH	R1, R1
LSLS	R1, R6
SXTH	R1, R1
; pin_2 end address is: 24 (R6)
MVN	R2, R1
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOH_MODER+0)
MOVT	R1, #hi_addr(GPIOH_MODER+0)
LDR	R1, [R1, #0]
AND	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOH_MODER+0)
MOVT	R1, #hi_addr(GPIOH_MODER+0)
STR	R2, [R1, #0]
;GPIO.c,75 :: 		}
IT	AL
BAL	L_gpio_pin_intialize33
L_gpio_pin_intialize32:
;GPIO.c,76 :: 		else{/* Nothing */}
L_gpio_pin_intialize33:
L_gpio_pin_intialize31:
;GPIO.c,77 :: 		break;
UXTB	R0, R4
; ret end address is: 16 (R4)
IT	AL
BAL	L_gpio_pin_intialize3
;GPIO.c,78 :: 		default:
L_gpio_pin_intialize34:
;GPIO.c,79 :: 		ret = E_NOT_OK;
; ret start address is: 0 (R0)
MOVS	R0, #0
;GPIO.c,80 :: 		break;
; ret end address is: 0 (R0)
IT	AL
BAL	L_gpio_pin_intialize3
;GPIO.c,81 :: 		}
L_gpio_pin_intialize2:
; pin_2 start address is: 24 (R6)
; pin_1 start address is: 20 (R5)
; ret start address is: 16 (R4)
; pin_config start address is: 0 (R0)
LDRB	R1, [R3, #0]
UBFX	R1, R1, #0, #3
CMP	R1, #0
IT	EQ
BEQ	L_gpio_pin_intialize4
LDRB	R1, [R3, #0]
UBFX	R1, R1, #0, #3
CMP	R1, #1
IT	EQ
BEQ	L_gpio_pin_intialize9
LDRB	R1, [R3, #0]
UBFX	R1, R1, #0, #3
CMP	R1, #2
IT	EQ
BEQ	L_gpio_pin_intialize14
LDRB	R1, [R3, #0]
UBFX	R1, R1, #0, #3
CMP	R1, #3
IT	EQ
BEQ	L_gpio_pin_intialize19
LDRB	R1, [R3, #0]
UBFX	R1, R1, #0, #3
CMP	R1, #4
IT	EQ
BEQ	L_gpio_pin_intialize24
LDRB	R1, [R3, #0]
UBFX	R1, R1, #0, #3
CMP	R1, #5
IT	EQ
BEQ	L_gpio_pin_intialize29
; pin_config end address is: 0 (R0)
; ret end address is: 16 (R4)
; pin_1 end address is: 20 (R5)
; pin_2 end address is: 24 (R6)
IT	AL
BAL	L_gpio_pin_intialize34
L_gpio_pin_intialize3:
;GPIO.c,82 :: 		}
; ret start address is: 0 (R0)
; ret end address is: 0 (R0)
L_gpio_pin_intialize1:
;GPIO.c,83 :: 		return ret;
; ret start address is: 0 (R0)
; ret end address is: 0 (R0)
;GPIO.c,84 :: 		}
L_end_gpio_pin_intialize:
BX	LR
; end of _gpio_pin_intialize
_gpio_pin_write:
;GPIO.c,86 :: 		uint8 gpio_pin_write(pin_config_t *pin_config, logic_t logic){
; logic start address is: 4 (R1)
; pin_config start address is: 0 (R0)
UXTB	R3, R1
MOV	R1, R0
; logic end address is: 4 (R1)
; pin_config end address is: 0 (R0)
; pin_config start address is: 4 (R1)
; logic start address is: 12 (R3)
;GPIO.c,87 :: 		uint8 ret = E_OK;
; ret start address is: 0 (R0)
MOVS	R0, #1
;GPIO.c,88 :: 		if(NULL == pin_config){
CMP	R1, #0
IT	NE
BNE	L_gpio_pin_write35
; pin_config end address is: 4 (R1)
; logic end address is: 12 (R3)
;GPIO.c,89 :: 		ret = E_NOT_OK;
MOVS	R0, #0
;GPIO.c,90 :: 		}
IT	AL
BAL	L_gpio_pin_write36
L_gpio_pin_write35:
;GPIO.c,92 :: 		switch(pin_config->port){
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
MOV	R4, R1
IT	AL
BAL	L_gpio_pin_write37
;GPIO.c,93 :: 		case PORTA_INDEX:
L_gpio_pin_write39:
;GPIO.c,94 :: 		if(logic == HIGH){
CMP	R3, #1
IT	NE
BNE	L_gpio_pin_write40
; logic end address is: 12 (R3)
;GPIO.c,95 :: 		GPIOA_ODR |= (1<<pin_config->pin);
LDRB	R2, [R1, #0]
; pin_config end address is: 4 (R1)
UBFX	R3, R2, #3, #3
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R3
SXTH	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODR+0)
MOVT	R2, #hi_addr(GPIOA_ODR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(GPIOA_ODR+0)
MOVT	R2, #hi_addr(GPIOA_ODR+0)
STR	R3, [R2, #0]
;GPIO.c,96 :: 		}
IT	AL
BAL	L_gpio_pin_write41
L_gpio_pin_write40:
;GPIO.c,97 :: 		else if(logic == LOW){
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
CMP	R3, #0
IT	NE
BNE	L_gpio_pin_write42
; logic end address is: 12 (R3)
;GPIO.c,98 :: 		GPIOA_ODR &= ~(1<<pin_config->pin);
LDRB	R2, [R1, #0]
; pin_config end address is: 4 (R1)
UBFX	R3, R2, #3, #3
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R3
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODR+0)
MOVT	R2, #hi_addr(GPIOA_ODR+0)
LDR	R2, [R2, #0]
AND	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(GPIOA_ODR+0)
MOVT	R2, #hi_addr(GPIOA_ODR+0)
STR	R3, [R2, #0]
;GPIO.c,99 :: 		}
IT	AL
BAL	L_gpio_pin_write43
L_gpio_pin_write42:
;GPIO.c,100 :: 		else{/* Nothing */}
L_gpio_pin_write43:
L_gpio_pin_write41:
;GPIO.c,101 :: 		break;
IT	AL
BAL	L_gpio_pin_write38
;GPIO.c,102 :: 		case PORTB_INDEX:
L_gpio_pin_write44:
;GPIO.c,103 :: 		if(logic == HIGH){
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
CMP	R3, #1
IT	NE
BNE	L_gpio_pin_write45
; logic end address is: 12 (R3)
;GPIO.c,104 :: 		GPIOB_ODR |= (1<<pin_config->pin);
LDRB	R2, [R1, #0]
; pin_config end address is: 4 (R1)
UBFX	R3, R2, #3, #3
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R3
SXTH	R3, R3
MOVW	R2, #lo_addr(GPIOB_ODR+0)
MOVT	R2, #hi_addr(GPIOB_ODR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(GPIOB_ODR+0)
MOVT	R2, #hi_addr(GPIOB_ODR+0)
STR	R3, [R2, #0]
;GPIO.c,105 :: 		}
IT	AL
BAL	L_gpio_pin_write46
L_gpio_pin_write45:
;GPIO.c,106 :: 		else if(logic == LOW){
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
CMP	R3, #0
IT	NE
BNE	L_gpio_pin_write47
; logic end address is: 12 (R3)
;GPIO.c,107 :: 		GPIOB_ODR &= ~(1<<pin_config->pin);
LDRB	R2, [R1, #0]
; pin_config end address is: 4 (R1)
UBFX	R3, R2, #3, #3
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R3
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
MOVW	R2, #lo_addr(GPIOB_ODR+0)
MOVT	R2, #hi_addr(GPIOB_ODR+0)
LDR	R2, [R2, #0]
AND	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(GPIOB_ODR+0)
MOVT	R2, #hi_addr(GPIOB_ODR+0)
STR	R3, [R2, #0]
;GPIO.c,108 :: 		}
IT	AL
BAL	L_gpio_pin_write48
L_gpio_pin_write47:
;GPIO.c,109 :: 		else{/* Nothing */}
L_gpio_pin_write48:
L_gpio_pin_write46:
;GPIO.c,110 :: 		break;
IT	AL
BAL	L_gpio_pin_write38
;GPIO.c,111 :: 		case PORTC_INDEX:
L_gpio_pin_write49:
;GPIO.c,112 :: 		if(logic == HIGH){
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
CMP	R3, #1
IT	NE
BNE	L_gpio_pin_write50
; logic end address is: 12 (R3)
;GPIO.c,113 :: 		GPIOC_ODR |= (1<<pin_config->pin);
LDRB	R2, [R1, #0]
; pin_config end address is: 4 (R1)
UBFX	R3, R2, #3, #3
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R3
SXTH	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
STR	R3, [R2, #0]
;GPIO.c,114 :: 		}
IT	AL
BAL	L_gpio_pin_write51
L_gpio_pin_write50:
;GPIO.c,115 :: 		else if(logic == LOW){
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
CMP	R3, #0
IT	NE
BNE	L_gpio_pin_write52
; logic end address is: 12 (R3)
;GPIO.c,116 :: 		GPIOC_ODR &= ~(1<<pin_config->pin);
LDRB	R2, [R1, #0]
; pin_config end address is: 4 (R1)
UBFX	R3, R2, #3, #3
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R3
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
LDR	R2, [R2, #0]
AND	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
STR	R3, [R2, #0]
;GPIO.c,117 :: 		}
IT	AL
BAL	L_gpio_pin_write53
L_gpio_pin_write52:
;GPIO.c,118 :: 		else{/* Nothing */}
L_gpio_pin_write53:
L_gpio_pin_write51:
;GPIO.c,119 :: 		break;
IT	AL
BAL	L_gpio_pin_write38
;GPIO.c,120 :: 		case PORTD_INDEX:
L_gpio_pin_write54:
;GPIO.c,121 :: 		if(logic == HIGH){
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
CMP	R3, #1
IT	NE
BNE	L_gpio_pin_write55
; logic end address is: 12 (R3)
;GPIO.c,122 :: 		GPIOD_ODR |= (1<<pin_config->pin);
LDRB	R2, [R1, #0]
; pin_config end address is: 4 (R1)
UBFX	R3, R2, #3, #3
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R3
SXTH	R3, R3
MOVW	R2, #lo_addr(GPIOD_ODR+0)
MOVT	R2, #hi_addr(GPIOD_ODR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(GPIOD_ODR+0)
MOVT	R2, #hi_addr(GPIOD_ODR+0)
STR	R3, [R2, #0]
;GPIO.c,123 :: 		}
IT	AL
BAL	L_gpio_pin_write56
L_gpio_pin_write55:
;GPIO.c,124 :: 		else if(logic == LOW){
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
CMP	R3, #0
IT	NE
BNE	L_gpio_pin_write57
; logic end address is: 12 (R3)
;GPIO.c,125 :: 		GPIOD_ODR &= ~(1<<pin_config->pin);
LDRB	R2, [R1, #0]
; pin_config end address is: 4 (R1)
UBFX	R3, R2, #3, #3
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R3
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
MOVW	R2, #lo_addr(GPIOD_ODR+0)
MOVT	R2, #hi_addr(GPIOD_ODR+0)
LDR	R2, [R2, #0]
AND	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(GPIOD_ODR+0)
MOVT	R2, #hi_addr(GPIOD_ODR+0)
STR	R3, [R2, #0]
;GPIO.c,126 :: 		}
IT	AL
BAL	L_gpio_pin_write58
L_gpio_pin_write57:
;GPIO.c,127 :: 		else{/* Nothing */}
L_gpio_pin_write58:
L_gpio_pin_write56:
;GPIO.c,128 :: 		break;
IT	AL
BAL	L_gpio_pin_write38
;GPIO.c,129 :: 		case PORTE_INDEX:
L_gpio_pin_write59:
;GPIO.c,130 :: 		if(logic == HIGH){
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
CMP	R3, #1
IT	NE
BNE	L_gpio_pin_write60
; logic end address is: 12 (R3)
;GPIO.c,131 :: 		GPIOE_ODR |= (1<<pin_config->pin);
LDRB	R2, [R1, #0]
; pin_config end address is: 4 (R1)
UBFX	R3, R2, #3, #3
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R3
SXTH	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;GPIO.c,132 :: 		}
IT	AL
BAL	L_gpio_pin_write61
L_gpio_pin_write60:
;GPIO.c,133 :: 		else if(logic == LOW){
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
CMP	R3, #0
IT	NE
BNE	L_gpio_pin_write62
; logic end address is: 12 (R3)
;GPIO.c,134 :: 		GPIOE_ODR &= ~(1<<pin_config->pin);
LDRB	R2, [R1, #0]
; pin_config end address is: 4 (R1)
UBFX	R3, R2, #3, #3
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R3
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
LDR	R2, [R2, #0]
AND	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;GPIO.c,135 :: 		}
IT	AL
BAL	L_gpio_pin_write63
L_gpio_pin_write62:
;GPIO.c,136 :: 		else{/* Nothing */}
L_gpio_pin_write63:
L_gpio_pin_write61:
;GPIO.c,137 :: 		break;
; ret end address is: 0 (R0)
IT	AL
BAL	L_gpio_pin_write38
;GPIO.c,138 :: 		default:
L_gpio_pin_write64:
;GPIO.c,139 :: 		ret = E_NOT_OK;
; ret start address is: 0 (R0)
MOVS	R0, #0
;GPIO.c,140 :: 		break;
IT	AL
BAL	L_gpio_pin_write38
;GPIO.c,141 :: 		}
L_gpio_pin_write37:
; logic start address is: 12 (R3)
; pin_config start address is: 4 (R1)
LDRB	R2, [R4, #0]
UBFX	R2, R2, #0, #3
CMP	R2, #0
IT	EQ
BEQ	L_gpio_pin_write39
LDRB	R2, [R4, #0]
UBFX	R2, R2, #0, #3
CMP	R2, #1
IT	EQ
BEQ	L_gpio_pin_write44
LDRB	R2, [R4, #0]
UBFX	R2, R2, #0, #3
CMP	R2, #2
IT	EQ
BEQ	L_gpio_pin_write49
LDRB	R2, [R4, #0]
UBFX	R2, R2, #0, #3
CMP	R2, #3
IT	EQ
BEQ	L_gpio_pin_write54
LDRB	R2, [R4, #0]
UBFX	R2, R2, #0, #3
CMP	R2, #4
IT	EQ
BEQ	L_gpio_pin_write59
; pin_config end address is: 4 (R1)
; logic end address is: 12 (R3)
; ret end address is: 0 (R0)
IT	AL
BAL	L_gpio_pin_write64
L_gpio_pin_write38:
;GPIO.c,142 :: 		}
; ret start address is: 0 (R0)
; ret end address is: 0 (R0)
L_gpio_pin_write36:
;GPIO.c,143 :: 		return ret;
; ret start address is: 0 (R0)
; ret end address is: 0 (R0)
;GPIO.c,144 :: 		}
L_end_gpio_pin_write:
BX	LR
; end of _gpio_pin_write
