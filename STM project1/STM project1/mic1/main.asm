_main:
;main.c,3 :: 		void main() {
SUB	SP, SP, #4
;main.c,5 :: 		uint8 ret = E_OK;
;main.c,7 :: 		uint8 flag = 0;
MOVS	R0, #0
STRB	R0, [SP, #2]
;main.c,9 :: 		led_1.port      = PORTB_INDEX;   // connect led to port B
MOVS	R1, #1
LDRB	R0, [SP, #1]
BFI	R0, R1, #0, #3
STRB	R0, [SP, #1]
;main.c,10 :: 		led_1.pin       = PIN5;           //    connect led to pin 5
MOVS	R1, #5
LDRB	R0, [SP, #1]
BFI	R0, R1, #3, #3
STRB	R0, [SP, #1]
;main.c,11 :: 		led_1.direction = OUTPUT;
LDRB	R0, [SP, #1]
BFC	R0, #6, #1
STRB	R0, [SP, #1]
;main.c,12 :: 		led_1.logic     = LOW;
LDRB	R0, [SP, #1]
BFC	R0, #7, #1
STRB	R0, [SP, #1]
;main.c,14 :: 		usart1_begin(9600); // Change baud rate as needed
MOVW	R0, #9600
MOVS	R1, #0
BL	_usart1_begin+0
;main.c,18 :: 		ret = gpio_pin_intialize(&led_1);
ADD	R0, SP, #1
BL	_gpio_pin_intialize+0
;main.c,19 :: 		while (1) {
L_main0:
;main.c,22 :: 		data_received = read();
BL	_read+0
STRB	R0, [SP, #0]
;main.c,23 :: 		if ( (data_received == 'y') && (flag == 0) ) {
CMP	R0, #121
IT	NE
BNE	L__main11
LDRB	R0, [SP, #2]
CMP	R0, #0
IT	NE
BNE	L__main10
L__main9:
;main.c,25 :: 		ret = gpio_pin_write(&led_1, HIGH);
ADD	R0, SP, #1
MOVS	R1, #1
BL	_gpio_pin_write+0
;main.c,26 :: 		flag = 1;
MOVS	R0, #1
STRB	R0, [SP, #2]
;main.c,23 :: 		if ( (data_received == 'y') && (flag == 0) ) {
L__main11:
L__main10:
;main.c,28 :: 		if ( (data_received == 'n') && (flag == 1) ) {
LDRB	R0, [SP, #0]
CMP	R0, #110
IT	NE
BNE	L__main13
LDRB	R0, [SP, #2]
CMP	R0, #1
IT	NE
BNE	L__main12
L__main8:
;main.c,30 :: 		ret = gpio_pin_write(&led_1, LOW);
ADD	R0, SP, #1
MOVS	R1, #0
BL	_gpio_pin_write+0
;main.c,31 :: 		flag = 0;
MOVS	R0, #0
STRB	R0, [SP, #2]
;main.c,28 :: 		if ( (data_received == 'n') && (flag == 1) ) {
L__main13:
L__main12:
;main.c,33 :: 		}
IT	AL
BAL	L_main0
;main.c,45 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
