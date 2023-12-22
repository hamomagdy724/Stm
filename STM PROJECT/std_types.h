#ifndef STD_TYPES_H
#define        STD_TYPES_H

/* Section: Includes Declarations */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Section: Macros Declarations */

#define STD_HIGH                        0x01
#define STD_LOW                         0x00

#define CONFIG_ENABLE                   0x01
#define CONFIG_DISABLE                  0x00

#define STD_ON                          0x01
#define STD_OFF                         0x00

#define STD_ACTIVE                      0x01
#define STD_IDLE                        0x00

#define E_OK        (uint8)             0x01
#define E_NOT_OK    (uint8)             0x00



#define CPU_TYPE_8      8
#define CPU_TYPE_16     16
#define CPU_TYPE_32     32
#define CPU_TYPE_64     64
/********************************************/
#define CPU_TYPE (CPU_TYPE_32)
/**********************************************/
#if (CPU_TYPE == 64)
typedef unsigned char           uint8;
typedef unsigned short          uint16;
typedef unsigned int            uint32;
typedef unsigned long long      uint64;
typedef signed char             sint8;
typedef signed short            sint16;
typedef signed int              sint32;
typedef signed long long        sint64;
typedef float                   float32;
typedef double                  float64;
#elif(CPU_TYPE == 32)
typedef unsigned char           uint8;
typedef unsigned short          uint16;
typedef unsigned int            uint32;
typedef unsigned long long      uint64;
typedef signed char             sint8;
typedef signed short            sint16;
typedef signed int              sint32;
typedef signed long long        sint64;
typedef float                   float32;
typedef double                  float64;
#elif(CPU_TYPE == 16)
typedef unsigned char           uint8;
typedef unsigned short          uint16;
typedef unsigned long           uint32;
typedef unsigned long long      uint64;
typedef signed char             sint8;
typedef signed short            sint16;
typedef signed int              sint32;
typedef signed long long        sint64;
typedef float                   float32;
typedef double                  float64;
#elif(CPU_TYPE == 8)
typedef unsigned char           uint8;
typedef unsigned short          uint16;
typedef unsigned long           uint32;
typedef signed char             sint8;
typedef signed short            sint16;
typedef unsigned long           sint32;
typedef float                   float32;
typedef unit8                   Std_ReturnType;
#endif


#endif