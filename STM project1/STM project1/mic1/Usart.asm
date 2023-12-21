_usart1_begin:
;Usart.c,3 :: 		void usart1_begin(uint64_t baudRate)
; baudRate start address is: 0 (R0)
; baudRate end address is: 0 (R0)
; baudRate start address is: 0 (R0)
;Usart.c,9 :: 		RCC_AHB1ENRbits.GPIOAEN = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(RCC_AHB1ENRbits+0)
MOVT	R2, #hi_addr(RCC_AHB1ENRbits+0)
_SX	[R2, ByteOffset(RCC_AHB1ENRbits+0)]
;Usart.c,10 :: 		RCC_APB2ENRbits.USART1EN = 1;
MOVW	R2, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R2, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R2, ByteOffset(RCC_APB2ENRbits+0)]
;Usart.c,13 :: 		GPIOA_MODERbits.MODER9 = 0x2;  // Alternate Fun mode for PA9
MOVS	R4, #2
MOVW	R3, #lo_addr(GPIOA_MODERbits+0)
MOVT	R3, #hi_addr(GPIOA_MODERbits+0)
LDR	R2, [R3, #0]
BFI	R2, R4, #18, #2
STR	R2, [R3, #0]
;Usart.c,14 :: 		GPIOA_MODERbits.MODER10 = 0x2; // Alternate Fun mode for PA10
MOVS	R4, #2
MOVW	R3, #lo_addr(GPIOA_MODERbits+0)
MOVT	R3, #hi_addr(GPIOA_MODERbits+0)
LDR	R2, [R3, #0]
BFI	R2, R4, #20, #2
STR	R2, [R3, #0]
;Usart.c,15 :: 		GPIOA_AFRHbits.AFRH9 = 0x07;   // set PA9 to AF7
MOVS	R4, #7
MOVW	R3, #lo_addr(GPIOA_AFRHbits+0)
MOVT	R3, #hi_addr(GPIOA_AFRHbits+0)
LDRB	R2, [R3, #0]
BFI	R2, R4, #4, #4
STRB	R2, [R3, #0]
;Usart.c,16 :: 		GPIOA_AFRHbits.AFRH10 = 0x07;  // set PA9 to AF7
MOVS	R4, #7
MOVW	R3, #lo_addr(GPIOA_AFRHbits+0)
MOVT	R3, #hi_addr(GPIOA_AFRHbits+0)
LDRH	R2, [R3, #0]
BFI	R2, R4, #8, #4
STRH	R2, [R3, #0]
;Usart.c,19 :: 		USART1_CR1bits.UE = 0;     // Disable USART1
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(USART1_CR1bits+0)
MOVT	R2, #hi_addr(USART1_CR1bits+0)
_SX	[R2, ByteOffset(USART1_CR1bits+0)]
;Usart.c,25 :: 		if (baudRate == 1200)
EORS	R2, R0, #1200
BNE	L__usart1_begin40
EORS	R2, R1, #0
L__usart1_begin40:
IT	NE
BNE	L_usart1_begin0
; baudRate end address is: 0 (R0)
;Usart.c,27 :: 		USART1_BRR = 13328;
MOVW	R3, #13328
MOVW	R2, #lo_addr(USART1_BRR+0)
MOVT	R2, #hi_addr(USART1_BRR+0)
STR	R3, [R2, #0]
;Usart.c,28 :: 		}
IT	AL
BAL	L_usart1_begin1
L_usart1_begin0:
;Usart.c,29 :: 		else if (baudRate == 2400)
; baudRate start address is: 0 (R0)
EORS	R2, R0, #2400
BNE	L__usart1_begin41
EORS	R2, R1, #0
L__usart1_begin41:
IT	NE
BNE	L_usart1_begin2
; baudRate end address is: 0 (R0)
;Usart.c,31 :: 		USART1_BRR = 6656;
MOVW	R3, #6656
MOVW	R2, #lo_addr(USART1_BRR+0)
MOVT	R2, #hi_addr(USART1_BRR+0)
STR	R3, [R2, #0]
;Usart.c,32 :: 		}
IT	AL
BAL	L_usart1_begin3
L_usart1_begin2:
;Usart.c,33 :: 		else if (baudRate == 9600)
; baudRate start address is: 0 (R0)
EORS	R2, R0, #9600
BNE	L__usart1_begin42
EORS	R2, R1, #0
L__usart1_begin42:
IT	NE
BNE	L_usart1_begin4
; baudRate end address is: 0 (R0)
;Usart.c,35 :: 		USART1_BRR = 1664;
MOVW	R3, #1664
MOVW	R2, #lo_addr(USART1_BRR+0)
MOVT	R2, #hi_addr(USART1_BRR+0)
STR	R3, [R2, #0]
;Usart.c,36 :: 		}
IT	AL
BAL	L_usart1_begin5
L_usart1_begin4:
;Usart.c,37 :: 		else if (baudRate == 19200)
; baudRate start address is: 0 (R0)
EORS	R2, R0, #19200
BNE	L__usart1_begin43
EORS	R2, R1, #0
L__usart1_begin43:
IT	NE
BNE	L_usart1_begin6
; baudRate end address is: 0 (R0)
;Usart.c,39 :: 		USART1_BRR = 832;
MOVW	R3, #832
MOVW	R2, #lo_addr(USART1_BRR+0)
MOVT	R2, #hi_addr(USART1_BRR+0)
STR	R3, [R2, #0]
;Usart.c,40 :: 		}
IT	AL
BAL	L_usart1_begin7
L_usart1_begin6:
;Usart.c,41 :: 		else if (baudRate == 38400)
; baudRate start address is: 0 (R0)
EORS	R2, R0, #38400
BNE	L__usart1_begin44
EORS	R2, R1, #0
L__usart1_begin44:
IT	NE
BNE	L_usart1_begin8
; baudRate end address is: 0 (R0)
;Usart.c,43 :: 		USART1_BRR = 416;
MOVW	R3, #416
MOVW	R2, #lo_addr(USART1_BRR+0)
MOVT	R2, #hi_addr(USART1_BRR+0)
STR	R3, [R2, #0]
;Usart.c,44 :: 		}
IT	AL
BAL	L_usart1_begin9
L_usart1_begin8:
;Usart.c,45 :: 		else if (baudRate == 57600)
; baudRate start address is: 0 (R0)
EORS	R2, R0, #57600
BNE	L__usart1_begin45
EORS	R2, R1, #0
L__usart1_begin45:
IT	NE
BNE	L_usart1_begin10
; baudRate end address is: 0 (R0)
;Usart.c,47 :: 		USART1_BRR = 272;
MOVW	R3, #272
MOVW	R2, #lo_addr(USART1_BRR+0)
MOVT	R2, #hi_addr(USART1_BRR+0)
STR	R3, [R2, #0]
;Usart.c,48 :: 		}
IT	AL
BAL	L_usart1_begin11
L_usart1_begin10:
;Usart.c,49 :: 		else if (baudRate == 115200)
; baudRate start address is: 0 (R0)
EORS	R2, R0, #115200
BNE	L__usart1_begin46
EORS	R2, R1, #0
L__usart1_begin46:
IT	NE
BNE	L_usart1_begin12
; baudRate end address is: 0 (R0)
;Usart.c,51 :: 		USART1_BRR = 128;
MOVS	R3, #128
MOVW	R2, #lo_addr(USART1_BRR+0)
MOVT	R2, #hi_addr(USART1_BRR+0)
STR	R3, [R2, #0]
;Usart.c,52 :: 		}
IT	AL
BAL	L_usart1_begin13
L_usart1_begin12:
;Usart.c,53 :: 		else if (baudRate == 230400)
; baudRate start address is: 0 (R0)
EORS	R2, R0, #230400
BNE	L__usart1_begin47
EORS	R2, R1, #0
L__usart1_begin47:
IT	NE
BNE	L_usart1_begin14
; baudRate end address is: 0 (R0)
;Usart.c,55 :: 		USART1_BRR = 64;
MOVS	R3, #64
MOVW	R2, #lo_addr(USART1_BRR+0)
MOVT	R2, #hi_addr(USART1_BRR+0)
STR	R3, [R2, #0]
;Usart.c,56 :: 		}
IT	AL
BAL	L_usart1_begin15
L_usart1_begin14:
;Usart.c,57 :: 		else if (baudRate == 460800)
; baudRate start address is: 0 (R0)
EORS	R2, R0, #460800
BNE	L__usart1_begin48
EORS	R2, R1, #0
L__usart1_begin48:
IT	NE
BNE	L_usart1_begin16
; baudRate end address is: 0 (R0)
;Usart.c,59 :: 		USART1_BRR = 32;
MOVS	R3, #32
MOVW	R2, #lo_addr(USART1_BRR+0)
MOVT	R2, #hi_addr(USART1_BRR+0)
STR	R3, [R2, #0]
;Usart.c,60 :: 		}
L_usart1_begin16:
L_usart1_begin15:
L_usart1_begin13:
L_usart1_begin11:
L_usart1_begin9:
L_usart1_begin7:
L_usart1_begin5:
L_usart1_begin3:
L_usart1_begin1:
;Usart.c,67 :: 		USART1_CR1bits.TE = 1; // Enable Tx
MOVS	R6, #1
SXTB	R6, R6
MOVW	R2, #lo_addr(USART1_CR1bits+0)
MOVT	R2, #hi_addr(USART1_CR1bits+0)
_SX	[R2, ByteOffset(USART1_CR1bits+0)]
;Usart.c,68 :: 		USART1_CR1bits.RE = 1; // Enable Rx
MOVW	R2, #lo_addr(USART1_CR1bits+0)
MOVT	R2, #hi_addr(USART1_CR1bits+0)
_SX	[R2, ByteOffset(USART1_CR1bits+0)]
;Usart.c,69 :: 		USART1_CR1bits.M = 0;  // Set data word length to 8 bits
MOVS	R5, #0
SXTB	R5, R5
MOVW	R2, #lo_addr(USART1_CR1bits+0)
MOVT	R2, #hi_addr(USART1_CR1bits+0)
_SX	[R2, ByteOffset(USART1_CR1bits+0)]
;Usart.c,70 :: 		USART1_CR1bits.PCE = 0; // Disable parity control
MOVW	R2, #lo_addr(USART1_CR1bits+0)
MOVT	R2, #hi_addr(USART1_CR1bits+0)
_SX	[R2, ByteOffset(USART1_CR1bits+0)]
;Usart.c,71 :: 		USART1_CR1bits.OVER8 = 0; // over Sampling by 16 times. it must be 0 because the USART1_BRR value is considered this bit
MOVW	R2, #lo_addr(USART1_CR1bits+0)
MOVT	R2, #hi_addr(USART1_CR1bits+0)
_SX	[R2, ByteOffset(USART1_CR1bits+0)]
;Usart.c,72 :: 		USART1_CR2bits.STOP = 0; // set 1 to stop bit.
MOVS	R4, #0
MOVW	R3, #lo_addr(USART1_CR2bits+0)
MOVT	R3, #hi_addr(USART1_CR2bits+0)
LDRH	R2, [R3, #0]
BFI	R2, R4, #12, #2
STRH	R2, [R3, #0]
;Usart.c,73 :: 		USART1_CR3bits.HDSEL = 0; // Half duplex not selected which means full duplex enable
MOVW	R2, #lo_addr(USART1_CR3bits+0)
MOVT	R2, #hi_addr(USART1_CR3bits+0)
_SX	[R2, ByteOffset(USART1_CR3bits+0)]
;Usart.c,74 :: 		USART1_CR1bits.UE = 1;  // Enable USART1
MOVW	R2, #lo_addr(USART1_CR1bits+0)
MOVT	R2, #hi_addr(USART1_CR1bits+0)
_SX	[R2, ByteOffset(USART1_CR1bits+0)]
;Usart.c,75 :: 		}
L_end_usart1_begin:
BX	LR
; end of _usart1_begin
_available:
;Usart.c,76 :: 		int available ()
;Usart.c,78 :: 		return USART1_SRbits.RXNE;  // check there is data recived or not if  USART1_SRbits.RXNE = 1 then data is ready to read or write
MOVW	R0, #lo_addr(USART1_SRbits+0)
MOVT	R0, #hi_addr(USART1_SRbits+0)
_LX	[R0, ByteOffset(USART1_SRbits+0)]
;Usart.c,80 :: 		}
L_end_available:
BX	LR
; end of _available
_write:
;Usart.c,81 :: 		void  write(int8_t ch)
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;Usart.c,83 :: 		while (!USART1_SRbits.TXE);  // if available() == 0 then there are data recived so i will wait in while loop until data recived so Now i can Write  my data
L_write17:
; ch start address is: 0 (R0)
MOVW	R1, #lo_addr(USART1_SRbits+0)
MOVT	R1, #hi_addr(USART1_SRbits+0)
_LX	[R1, ByteOffset(USART1_SRbits+0)]
CMP	R1, #0
IT	NE
BNE	L_write18
IT	AL
BAL	L_write17
L_write18:
;Usart.c,84 :: 		USART1_DR = ch ;          //write the data  -- put the data in   USART1_DR
MOVW	R1, #lo_addr(USART1_DR+0)
MOVT	R1, #hi_addr(USART1_DR+0)
STR	R0, [R1, #0]
; ch end address is: 0 (R0)
;Usart.c,85 :: 		}
L_end_write:
BX	LR
; end of _write
_writeString:
;Usart.c,87 :: 		void  writeString(int8_t* String, uint32_t Length)
; Length start address is: 4 (R1)
; String start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R2, R1
MOV	R1, R0
; Length end address is: 4 (R1)
; String end address is: 0 (R0)
; String start address is: 4 (R1)
; Length start address is: 8 (R2)
;Usart.c,88 :: 		{    uint32_t Index = 0;
;Usart.c,90 :: 		for(Index = 0; Index < Length; Index++)
; Index start address is: 0 (R0)
MOVS	R0, #0
; Length end address is: 8 (R2)
; String end address is: 4 (R1)
; Index end address is: 0 (R0)
MOV	R4, R2
L_writeString19:
; Index start address is: 0 (R0)
; Length start address is: 16 (R4)
; String start address is: 4 (R1)
CMP	R0, R4
IT	CS
BCS	L_writeString20
; String end address is: 4 (R1)
; Length end address is: 16 (R4)
; Index end address is: 0 (R0)
MOV	R5, R0
;Usart.c,92 :: 		while (!available());       // if available() == 0 then there are data recived so i will wait in while loop until data recived so Now i can Write  my data
L_writeString22:
; String start address is: 4 (R1)
; Length start address is: 16 (R4)
; Index start address is: 20 (R5)
BL	_available+0
CMP	R0, #0
IT	NE
BNE	L_writeString23
IT	AL
BAL	L_writeString22
L_writeString23:
;Usart.c,93 :: 		USART1_DR  = String[Index];      //write the data -- put the data in   USART1_DR
ADDS	R2, R1, R5
LDRSB	R3, [R2, #0]
MOVW	R2, #lo_addr(USART1_DR+0)
MOVT	R2, #hi_addr(USART1_DR+0)
STR	R3, [R2, #0]
;Usart.c,90 :: 		for(Index = 0; Index < Length; Index++)
ADDS	R2, R5, #1
; Index end address is: 20 (R5)
; Index start address is: 0 (R0)
MOV	R0, R2
;Usart.c,94 :: 		}
; String end address is: 4 (R1)
; Length end address is: 16 (R4)
; Index end address is: 0 (R0)
IT	AL
BAL	L_writeString19
L_writeString20:
;Usart.c,96 :: 		}
L_end_writeString:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _writeString
_read:
;Usart.c,98 :: 		uint8_t  read()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Usart.c,100 :: 		while (!available());  // if available() == 0 then there are data recived so i will wait in while loop until data recived so Now i can read  my data
L_read24:
BL	_available+0
CMP	R0, #0
IT	NE
BNE	L_read25
IT	AL
BAL	L_read24
L_read25:
;Usart.c,101 :: 		return USART1_DR;       //  read the data  -- take the data from USART1_DR
MOVW	R0, #lo_addr(USART1_DR+0)
MOVT	R0, #hi_addr(USART1_DR+0)
LDR	R0, [R0, #0]
;Usart.c,102 :: 		}
L_end_read:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _read
_readBytes:
;Usart.c,103 :: 		uint8_t readBytes(uint8_t* String, uint32_t Length)
; Length start address is: 4 (R1)
; String start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Length end address is: 4 (R1)
; String end address is: 0 (R0)
; String start address is: 0 (R0)
; Length start address is: 4 (R1)
;Usart.c,105 :: 		uint32_t Index = 0;
;Usart.c,107 :: 		for(Index = 0; Index < Length; Index++)
; Index start address is: 12 (R3)
MOVS	R3, #0
CMP	R1, #0
IT	LS
BLS	L_readBytes27
; String end address is: 0 (R0)
; Length end address is: 4 (R1)
; Index end address is: 12 (R3)
MOV	R1, R3
MOV	R3, R0
;Usart.c,109 :: 		while (!available());     // if available() == 0 then there are data recived so i will wait in while loop until data recived so Now i can read  my data
L_readBytes29:
; Index start address is: 4 (R1)
; String start address is: 12 (R3)
BL	_available+0
CMP	R0, #0
IT	NE
BNE	L_readBytes30
IT	AL
BAL	L_readBytes29
L_readBytes30:
;Usart.c,110 :: 		USART1_DR  = String[Index];
ADDS	R2, R3, R1
; Index end address is: 4 (R1)
; String end address is: 12 (R3)
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(USART1_DR+0)
MOVT	R2, #hi_addr(USART1_DR+0)
STR	R3, [R2, #0]
;Usart.c,111 :: 		return USART1_DR ;          //  read the data  -- take the data from USART1_DR
MOVW	R2, #lo_addr(USART1_DR+0)
MOVT	R2, #hi_addr(USART1_DR+0)
LDR	R0, [R2, #0]
IT	AL
BAL	L_end_readBytes
;Usart.c,112 :: 		}
L_readBytes27:
;Usart.c,113 :: 		}
L_end_readBytes:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _readBytes
_Print:
;Usart.c,115 :: 		void Print(char* String)
; String start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R1, R0
; String end address is: 0 (R0)
; String start address is: 4 (R1)
;Usart.c,116 :: 		{   uint32_t Index = 0;
; Index start address is: 0 (R0)
MOV	R0, #0
; String end address is: 4 (R1)
; Index end address is: 0 (R0)
MOV	R2, R1
;Usart.c,117 :: 		while (String[Index] != '\0')
L_Print31:
; Index start address is: 0 (R0)
; String start address is: 8 (R2)
ADDS	R1, R2, R0
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_Print32
; String end address is: 8 (R2)
; Index end address is: 0 (R0)
MOV	R4, R0
MOV	R3, R2
;Usart.c,119 :: 		while(!available());
L_Print33:
; String start address is: 12 (R3)
; Index start address is: 16 (R4)
BL	_available+0
CMP	R0, #0
IT	NE
BNE	L_Print34
IT	AL
BAL	L_Print33
L_Print34:
;Usart.c,120 :: 		USART1_DR = String[Index];
ADDS	R1, R3, R4
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(USART1_DR+0)
MOVT	R1, #hi_addr(USART1_DR+0)
STR	R2, [R1, #0]
;Usart.c,121 :: 		Index++;
ADDS	R1, R4, #1
; Index end address is: 16 (R4)
; Index start address is: 0 (R0)
MOV	R0, R1
;Usart.c,122 :: 		}
MOV	R2, R3
; String end address is: 12 (R3)
; Index end address is: 0 (R0)
IT	AL
BAL	L_Print31
L_Print32:
;Usart.c,123 :: 		}
L_end_Print:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Print
_Println:
;Usart.c,125 :: 		void Println(char* String)
; String start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R1, R0
; String end address is: 0 (R0)
; String start address is: 4 (R1)
;Usart.c,126 :: 		{   uint32_t Index = 0;
; Index start address is: 0 (R0)
MOV	R0, #0
; String end address is: 4 (R1)
; Index end address is: 0 (R0)
MOV	R2, R1
;Usart.c,127 :: 		while (String[Index] != '\0')
L_Println35:
; Index start address is: 0 (R0)
; String start address is: 8 (R2)
ADDS	R1, R2, R0
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_Println36
; String end address is: 8 (R2)
; Index end address is: 0 (R0)
MOV	R4, R0
MOV	R3, R2
;Usart.c,129 :: 		while(!available());
L_Println37:
; String start address is: 12 (R3)
; Index start address is: 16 (R4)
BL	_available+0
CMP	R0, #0
IT	NE
BNE	L_Println38
IT	AL
BAL	L_Println37
L_Println38:
;Usart.c,130 :: 		USART1_DR = String[Index];
ADDS	R1, R3, R4
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(USART1_DR+0)
MOVT	R1, #hi_addr(USART1_DR+0)
STR	R2, [R1, #0]
;Usart.c,131 :: 		Index++;
ADDS	R1, R4, #1
; Index end address is: 16 (R4)
; Index start address is: 0 (R0)
MOV	R0, R1
;Usart.c,132 :: 		}
MOV	R2, R3
; String end address is: 12 (R3)
; Index end address is: 0 (R0)
IT	AL
BAL	L_Println35
L_Println36:
;Usart.c,134 :: 		USART1_DR = '\0';
MOVS	R2, #0
MOVW	R1, #lo_addr(USART1_DR+0)
MOVT	R1, #hi_addr(USART1_DR+0)
STR	R2, [R1, #0]
;Usart.c,135 :: 		}
L_end_Println:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Println
