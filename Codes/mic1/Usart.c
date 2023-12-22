#include "Usart.h"

void usart1_begin(uint64_t baudRate)
{
    //Enable clock for USART1 and GPIO Port A
    RCC_AHB1ENRbits.GPIOAEN = 1;
    RCC_APB2ENRbits.USART1EN = 1;

    //Implement GPIO pins for USART1 (PA9 as TX , PA10 as RX)
    GPIOA_MODERbits.MODER9 = 0x2;  // Alternate Fun mode for PA9
    GPIOA_MODERbits.MODER10 = 0x2; // Alternate Fun mode for PA10
    GPIOA_AFRHbits.AFRH9 = 0x07;   // set PA9 to AF7
    GPIOA_AFRHbits.AFRH10 = 0x07;  // set PA9 to AF7

    // USART1 Implementation
    USART1_CR1bits.UE = 0;     // Disable USART1

    // baudRate

    // The following values from the baud rate table in datasheet     USART1_CR1bits.OVER8 = 0 & fbclk 8MHZ

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






     USART1_CR1bits.TE = 1; // Enable Tx
     USART1_CR1bits.RE = 1; // Enable Rx
     USART1_CR1bits.M = 0;  // Set data word length to 8 bits
     USART1_CR1bits.PCE = 0; // Disable parity control
     USART1_CR1bits.OVER8 = 0; // over Sampling by 16 times. it must be 0 because the USART1_BRR value is considered this bit
     USART1_CR2bits.STOP = 0; // set 1 to stop bit.
     USART1_CR3bits.HDSEL = 0; // Half duplex not selected which means full duplex enable
     USART1_CR1bits.UE = 1;  // Enable USART1
}
int available ()
{
    return USART1_SRbits.RXNE;  // check there is data recived or not if  USART1_SRbits.RXNE = 1 then data is ready to read or write

}
void  write(int8_t ch)
{
     while (!USART1_SRbits.TXE);  // if available() == 0 then there are data recived so i will wait in while loop until data recived so Now i can Write  my data
     USART1_DR = ch ;          //write the data  -- put the data in   USART1_DR
}

void  writeString(int8_t* String, uint32_t Length)
{    uint32_t Index = 0;

     for(Index = 0; Index < Length; Index++)
     {
         while (!available());       // if available() == 0 then there are data recived so i will wait in while loop until data recived so Now i can Write  my data
         USART1_DR  = String[Index];      //write the data -- put the data in   USART1_DR
     }

}

uint8_t  read()
{
     while (!available());  // if available() == 0 then there are data recived so i will wait in while loop until data recived so Now i can read  my data
     return USART1_DR;       //  read the data  -- take the data from USART1_DR
}
uint8_t readBytes(uint8_t* String, uint32_t Length)
{
        uint32_t Index = 0;

     for(Index = 0; Index < Length; Index++)
     {
         while (!available());     // if available() == 0 then there are data recived so i will wait in while loop until data recived so Now i can read  my data
         USART1_DR  = String[Index];
         return USART1_DR ;          //  read the data  -- take the data from USART1_DR
     }
}

void Print(char* String)
{   uint32_t Index = 0;
     while (String[Index] != '\0')
     {
           while(!available());
           USART1_DR = String[Index];
           Index++;
     }
}

void Println(char* String)
{   uint32_t Index = 0;
     while (String[Index] != '\0')
     {
           while(!available());
           USART1_DR = String[Index];
           Index++;
     }

     USART1_DR = '\0';
}