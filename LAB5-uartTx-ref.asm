STM8/  	;THIS LINE MUST BE FIRST LINE
;ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸
;³ÄÄÄ    		    Init ST8			   ÄÄÄ³			
;ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾
;ÕÍÍÍÍÍÍÍÍÍÍÍÍ¸
;³  Feature   ³	
;ÔÍÍÍÍÍÍÍÍÍÍÍÍ¾
; - 2 LED Status
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;   	MACRO  
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; LONG BTJT #01
LBTJT           MACRO   M1,M2,M3
                BTJF    M1,M2,{*+5+3}
                JP      M3
                MEND
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; LONG BTJF #02
LBTJF           MACRO   M1,M2,M3
                BTJT    M1,M2,{*+5+3}
                JP      M3
                MEND
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; LONG JREQ #03
LJREQ           MACRO   M1
                JRNE    {*+2+3}
                JP      M1
                MEND
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; LONG JRULT #04
LJRULT          MACRO   M1
                JRUGE   {*+2+3}
                JP      M1
                MEND
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; LONG JREQ #05
LJZ             MACRO   M1
                JRNE    {*+2+3}
                JP      M1
                MEND
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; LONG JRNE,JRNZ #06                                                    
LJNZ            MACRO   M1                                      
                JREQ    {*+2+3}                                 
                JP      M1                                      
                MEND       
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; LONG JRNE,JRNZ #07                                                    
LJNE            MACRO   M1                                      
                JREQ    {*+2+3}                                 
                JP      M1                                      
                MEND                                                            
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; LONG JRC #08
LJC             MACRO   M1
                JRNC    {*+2+3}
                JP      M1
                MEND      
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; LONG JRNC #09
LJNC            MACRO   M1
                JRC     {*+2+3}
                JP      M1
                MEND                      
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; LONG JRC #10
LJN             MACRO   M1
                JRC    {*+2+3}
                JP      M1
                MEND     
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;   Peripheral  :  DEFINE MCU Hardware Registers for STM8S103K3
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	WORDS		; FOLLOWING ADDRESSES ARE 16-BIT LENGTH
	SEGMENT BYTE AT 5000 'Periph'
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;	PORT A AT 0X5000
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.PA_ODR	DS.B 1		; PORT A DATA OUTPUT LATCH REGISTER
.PA_IDR	DS.B 1		; PORT A INPUT PIN VALUE REGISTER
.PA_DDR	DS.B 1		; PORT A DATA DIRECTION REGISTER
.PA_CR1	DS.B 1		; PORT A CONTROL REGISTER 1
.PA_CR2	DS.B 1		; PORT A CONTROL REGISTER 2
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;	PORT B AT 0X5005
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.PB_ODR	DS.B 1		; PORT B DATA OUTPUT LATCH REGISTER
.PB_IDR	DS.B 1		; PORT B INPUT PIN VALUE REGISTER
.PB_DDR	DS.B 1		; PORT B DATA DIRECTION REGISTER
.PB_CR1	DS.B 1		; PORT B CONTROL REGISTER 1
.PB_CR2	DS.B 1		; PORT B CONTROL REGISTER 2
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;	PORT C AT 0X500A
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.PC_ODR	DS.B 1		; PORT C DATA OUTPUT LATCH REGISTER
.PC_IDR	DS.B 1		; PORT C INPUT PIN VALUE REGISTER
.PC_DDR	DS.B 1		; PORT C DATA DIRECTION REGISTER
.PC_CR1	DS.B 1		; PORT C CONTROL REGISTER 1
.PC_CR2	DS.B 1		; PORT C CONTROL REGISTER 2
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; PORT D AT 0X500F
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.PD_ODR	DS.B 1		; PORT D DATA OUTPUT LATCH REGISTER
.PD_IDR	DS.B 1		; PORT D INPUT PIN VALUE REGISTER
.PD_DDR	DS.B 1		; PORT D DATA DIRECTION REGISTER
.PD_CR1	DS.B 1		; PORT D CONTROL REGISTER 1
.PD_CR2	DS.B 1		; PORT D CONTROL REGISTER 2
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; PORT E AT 0X5014
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.PE_ODR	DS.B 1		; PORT E DATA OUTPUT LATCH REGISTER
.PE_IDR	DS.B 1		; PORT E INPUT PIN VALUE REGISTER
.PE_DDR	DS.B 1		; PORT E DATA DIRECTION REGISTER
.PE_CR1	DS.B 1		; PORT E CONTROL REGISTER 1
.PE_CR2	DS.B 1		; PORT E CONTROL REGISTER 2
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; PORT F AT 0X5019
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.PF_ODR	DS.B 1		; PORT F DATA OUTPUT LATCH REGISTER
.PF_IDR	DS.B 1		; PORT F INPUT PIN VALUE REGISTER
.PF_DDR	DS.B 1		; PORT F DATA DIRECTION REGISTER
.PF_CR1	DS.B 1		; PORT F CONTROL REGISTER 1
.PF_CR2	DS.B 1		; PORT F CONTROL REGISTER 2
RESERVED1	DS.B 60		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; FLASH AT 0X505A
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.FLASH_CR1	DS.B 1		; FLASH CONTROL REGISTER 1
.FLASH_CR2	DS.B 1		; FLASH CONTROL REGISTER 2
.FLASH_NCR2	DS.B 1		; FLASH COMPLEMENTARY CONTROL REGISTER 2
.FLASH_FPR	DS.B 1		; FLASH PROTECTION REGISTER
.FLASH_NFPR	DS.B 1		; FLASH COMPLEMENTARY PROTECTION REGISTER
.FLASH_IAPSR	DS.B 1		; FLASH IN-APPLICATION PROGRAMMING STATUS REGISTER
RESERVED2	DS.B 2		; UNUSED
.FLASH_PUKR	DS.B 1		; FLASH PROGRAM MEMORY UNPROTECTION REGISTER
RESERVED3	DS.B 1		; UNUSED
.FLASH_DUKR	DS.B 1		; DATA EEPROM UNPROTECTION REGISTER
RESERVED4	DS.B 59		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; EXTERNAL INTERRUPT CONTROL REGISTER (ITC) AT 0X50A0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.EXTI_CR1	DS.B 1		; EXTERNAL INTERRUPT CONTROL REGISTER 1
.EXTI_CR2	DS.B 1		; EXTERNAL INTERRUPT CONTROL REGISTER 2
RESERVED5	DS.B 17		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; RESET (RST) AT 0X50B3
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.RST_SR	DS.B 1		; RESET STATUS REGISTER 1
RESERVED6	DS.B 12		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; CLOCK CONTROL (CLK) AT 0X50C0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.CLK_ICKR	DS.B 1		; INTERNAL CLOCK CONTROL REGISTER
.CLK_ECKR	DS.B 1		; EXTERNAL CLOCK CONTROL REGISTER
RESERVED7	DS.B 1		; UNUSED
.CLK_CMSR	DS.B 1		; CLOCK MASTER STATUS REGISTER
.CLK_SWR	DS.B 1		; CLOCK MASTER SWITCH REGISTER
.CLK_SWCR	DS.B 1		; CLOCK SWITCH CONTROL REGISTER
.CLK_CKDIVR	DS.B 1		; CLOCK DIVIDER REGISTER
.CLK_PCKENR1	DS.B 1		; PERIPHERAL CLOCK GATING REGISTER 1
.CLK_CSSR	DS.B 1		; CLOCK SECURITY SYSTEM REGISTER
.CLK_CCOR	DS.B 1		; CONFIGURABLE CLOCK CONTROL REGISTER
.CLK_PCKENR2	DS.B 1		; PERIPHERAL CLOCK GATING REGISTER 2
.CLK_CANCCR	DS.B 1		; CAN CLOCK CONTROL REGISTER
.CLK_HSITRIMR	DS.B 1		; HSI CLOCK CALIBRATION TRIMMING REGISTER
.CLK_SWIMCCR	DS.B 1		; SWIM CLOCK CONTROL REGISTER
RESERVED8	DS.B 3		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; WINDOW WATCHDOG (WWDG) AT 0X50D1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.WWDG_CR	DS.B 1		; WWDG CONTROL REGISTER
.WWDG_WR	DS.B 1		; WWDR WINDOW REGISTER
RESERVED9	DS.B 13		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; INDEPENDENT WATCHDOG (IWDG) AT 0X50E0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.IWDG_KR	DS.B 1		; IWDG KEY REGISTER
.IWDG_PR	DS.B 1		; IWDG PRESCALER REGISTER
.IWDG_RLR	DS.B 1		; IWDG RELOAD REGISTER
RESERVED10	DS.B 13		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; AUTO WAKE-UP (AWU) AT 0X50F0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.AWU_CSR	DS.B 1		; AWU CONTROL/STATUS REGISTER
.AWU_APR	DS.B 1		; AWU ASYNCHRONOUS PRESCALER BUFFER REGISTER
.AWU_TBR	DS.B 1		; AWU TIMEBASE SELECTION REGISTER
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; BEEPER (BEEP) AT 0X50F3
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.BEEP_CSR	DS.B 1		; BEEP CONTROL/STATUS REGISTER
RESERVED11	DS.B 268	; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; SERIAL PERIPHERAL INTERFACE (SPI) AT 0X5200
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.SPI_CR1	DS.B 1		; SPI CONTROL REGISTER 1
.SPI_CR2	DS.B 1		; SPI CONTROL REGISTER 2
.SPI_ICR	DS.B 1		; SPI INTERRUPT CONTROL REGISTER
.SPI_SR	DS.B 1		; SPI STATUS REGISTER
.SPI_DR	DS.B 1		; SPI DATA REGISTER
.SPI_CRCPR	DS.B 1		; SPI CRC POLYNOMIAL REGISTER
.SPI_RXCRCR	DS.B 1		; SPI RX CRC REGISTER
.SPI_TXCRCR	DS.B 1		; SPI TX CRC REGISTER
RESERVED12	DS.B 8		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; I2C BUS INTERFACE (I2C) AT 0X5210
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.I2C_CR1	DS.B 1		; I2C CONTROL REGISTER 1
.I2C_CR2	DS.B 1		; I2C CONTROL REGISTER 2
.I2C_FREQR	DS.B 1		; I2C FREQUENCY REGISTER
.I2C_OARL	DS.B 1		; I2C OWN ADDRESS REGISTER LOW
.I2C_OARH	DS.B 1		; I2C OWN ADDRESS REGISTER HIGH
RESERVED13	DS.B 1		; UNUSED
.I2C_DR	DS.B 1		; I2C DATA REGISTER
.I2C_SR1	DS.B 1		; I2C STATUS REGISTER 1
.I2C_SR2	DS.B 1		; I2C STATUS REGISTER 2
.I2C_SR3	DS.B 1		; I2C STATUS REGISTER 3
.I2C_ITR	DS.B 1		; I2C INTERRUPT CONTROL REGISTER
.I2C_CCRL	DS.B 1		; I2C CLOCK CONTROL REGISTER LOW
.I2C_CCRH	DS.B 1		; I2C CLOCK CONTROL REGISTER HIGH
.I2C_TRISER	DS.B 1		; I2C TRISE REGISTER
.I2C_PECR	DS.B 1		; I2C PACKET ERROR CHECKING REGISTER
RESERVED14	DS.B 17		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; UNIVERSAL SYNCH/ASYNCH RECEIVER TRANSMITTER (UART1) AT 0X5230
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.UART1_SR	DS.B 1		; UART1 STATUS REGISTER
.UART1_DR	DS.B 1		; UART1 DATA REGISTER
.UART1_BRR1	DS.B 1		; UART1 BAUD RATE REGISTER 1
.UART1_BRR2	DS.B 1		; UART1 BAUD RATE REGISTER 2
.UART1_CR1	DS.B 1		; UART1 CONTROL REGISTER 1
.UART1_CR2	DS.B 1		; UART1 CONTROL REGISTER 2
.UART1_CR3	DS.B 1		; UART1 CONTROL REGISTER 3
.UART1_CR4	DS.B 1		; UART1 CONTROL REGISTER 4
.UART1_CR5	DS.B 1		; UART1 CONTROL REGISTER 5
.UART1_GTR	DS.B 1		; UART1 GUARD TIME REGISTER
.UART1_PSCR	DS.B 1		; UART1 PRESCALER REGISTER
RESERVED15	DS.B 21		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; 16-BIT TIMER 1 (TIM1) AT 0X5250
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.TIM1_CR1	DS.B 1		; TIM1 CONTROL REGISTER 1
.TIM1_CR2	DS.B 1		; TIM1 CONTROL REGISTER 2
.TIM1_SMCR	DS.B 1		; TIM1 SLAVE MODE CONTROL REGISTER
.TIM1_ETR	DS.B 1		; TIM1 EXTERNAL TRIGGER REGISTER
.TIM1_IER	DS.B 1		; TIM1 INTERRUPT ENABLE REGISTER
.TIM1_SR1	DS.B 1		; TIM1 STATUS REGISTER 1
.TIM1_SR2	DS.B 1		; TIM1 STATUS REGISTER 2
.TIM1_EGR	DS.B 1		; TIM1 EVENT GENERATION REGISTER
.TIM1_CCMR1	DS.B 1		; TIM1 CAPTURE/COMPARE MODE REGISTER 1
.TIM1_CCMR2	DS.B 1		; TIM1 CAPTURE/COMPARE MODE REGISTER 2
.TIM1_CCMR3	DS.B 1		; TIM1 CAPTURE/COMPARE MODE REGISTER 3
.TIM1_CCMR4	DS.B 1		; TIM1 CAPTURE/COMPARE MODE REGISTER 4
.TIM1_CCER1	DS.B 1		; TIM1 CAPTURE/COMPARE ENABLE REGISTER 1
.TIM1_CCER2	DS.B 1		; TIM1 CAPTURE/COMPARE ENABLE REGISTER 2
.TIM1_CNTRH	DS.B 1		; DATA BITS HIGH
.TIM1_CNTRL	DS.B 1		; DATA BITS LOW
.TIM1_PSCRH	DS.B 1		; DATA BITS HIGH
.TIM1_PSCRL	DS.B 1		; DATA BITS LOW
.TIM1_ARRH	DS.B 1		; DATA BITS HIGH
.TIM1_ARRL	DS.B 1		; DATA BITS LOW
.TIM1_RCR	DS.B 1		; TIM1 REPETITION COUNTER REGISTER
.TIM1_CCR1H	DS.B 1		; DATA BITS HIGH
.TIM1_CCR1L	DS.B 1		; DATA BITS LOW
.TIM1_CCR2H	DS.B 1		; DATA BITS HIGH
.TIM1_CCR2L	DS.B 1		; DATA BITS LOW
.TIM1_CCR3H	DS.B 1		; DATA BITS HIGH
.TIM1_CCR3L	DS.B 1		; DATA BITS LOW
.TIM1_CCR4H	DS.B 1		; DATA BITS HIGH
.TIM1_CCR4L	DS.B 1		; DATA BITS LOW
.TIM1_BKR	DS.B 1		; TIM1 BREAK REGISTER
.TIM1_DTR	DS.B 1		; TIM1 DEAD-TIME REGISTER
.TIM1_OISR	DS.B 1		; TIM1 OUTPUT IDLE STATE REGISTER
RESERVED16	DS.B 144	; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; 16-BIT TIMER 2 (TIM2) AT 0X5300
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.TIM2_CR1	DS.B 1		; TIM2 CONTROL REGISTER 1
RESERVED17	DS.B 2		; UNUSED
.TIM2_IER	DS.B 1		; TIM2 INTERRUPT ENABLE REGISTER
.TIM2_SR1	DS.B 1		; TIM2 STATUS REGISTER 1
.TIM2_SR2	DS.B 1		; TIM2 STATUS REGISTER 2
.TIM2_EGR	DS.B 1		; TIM2 EVENT GENERATION REGISTER
.TIM2_CCMR1	DS.B 1		; TIM2 CAPTURE/COMPARE MODE REGISTER 1
.TIM2_CCMR2	DS.B 1		; TIM2 CAPTURE/COMPARE MODE REGISTER 2
.TIM2_CCMR3	DS.B 1		; TIM2 CAPTURE/COMPARE MODE REGISTER 3
.TIM2_CCER1	DS.B 1		; TIM2 CAPTURE/COMPARE ENABLE REGISTER 1
.TIM2_CCER2	DS.B 1		; TIM2 CAPTURE/COMPARE ENABLE REGISTER 2
.TIM2_CNTRH	DS.B 1		; DATA BITS HIGH
.TIM2_CNTRL	DS.B 1		; DATA BITS LOW
.TIM2_PSCR	DS.B 1		; TIM2 PRESCALER REGISTER
.TIM2_ARRH	DS.B 1		; DATA BITS HIGH
.TIM2_ARRL	DS.B 1		; DATA BITS LOW
.TIM2_CCR1H	DS.B 1		; DATA BITS HIGH
.TIM2_CCR1L	DS.B 1		; DATA BITS LOW
.TIM2_CCR2H	DS.B 1		; DATA BITS HIGH
.TIM2_CCR2L	DS.B 1		; DATA BITS LOW
.TIM2_CCR3H	DS.B 1		; DATA BITS HIGH
.TIM2_CCR3L	DS.B 1		; DATA BITS LOW
RESERVED18	DS.B 41		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; 8-BIT  TIMER 4 (TIM4) AT 0X5340
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.TIM4_CR1	DS.B 1		; TIM4 CONTROL REGISTER 1
RESERVED19	DS.B 2		; UNUSED
.TIM4_IER	DS.B 1		; TIM4 INTERRUPT ENABLE REGISTER
.TIM4_SR	DS.B 1		; TIM4 STATUS REGISTER
.TIM4_EGR	DS.B 1		; TIM4 EVENT GENERATION REGISTER
.TIM4_CNTR	DS.B 1		; TIM4 COUNTER
.TIM4_PSCR	DS.B 1		; TIM4 PRESCALER REGISTER
.TIM4_ARR	DS.B 1		; TIM4 AUTO-RELOAD REGISTER
RESERVED20	DS.B 151	; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; 10-BIT A/D CONVERTER (ADC1) AT 0X53E0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.ADC_DB0RH	DS.B 1		; DATA BUFFER REGISTER 0 HIGH
.ADC_DB0RL	DS.B 1		; DATA BUFFER REGISTER 0 LOW
.ADC_DB1RH	DS.B 1		; DATA BUFFER REGISTER 1 HIGH
.ADC_DB1RL	DS.B 1		; DATA BUFFER REGISTER 1 LOW
.ADC_DB2RH	DS.B 1		; DATA BUFFER REGISTER 2 HIGH
.ADC_DB2RL	DS.B 1		; DATA BUFFER REGISTER 2 LOW
.ADC_DB3RH	DS.B 1		; DATA BUFFER REGISTER 3 HIGH
.ADC_DB3RL	DS.B 1		; DATA BUFFER REGISTER 3 LOW
.ADC_DB4RH	DS.B 1		; DATA BUFFER REGISTER 4 HIGH
.ADC_DB4RL	DS.B 1		; DATA BUFFER REGISTER 4 LOW
.ADC_DB5RH	DS.B 1		; DATA BUFFER REGISTER 5 HIGH
.ADC_DB5RL	DS.B 1		; DATA BUFFER REGISTER 5 LOW
.ADC_DB6RH	DS.B 1		; DATA BUFFER REGISTER 6 HIGH
.ADC_DB6RL	DS.B 1		; DATA BUFFER REGISTER 6 LOW
.ADC_DB7RH	DS.B 1		; DATA BUFFER REGISTER 7 HIGH
.ADC_DB7RL	DS.B 1		; DATA BUFFER REGISTER 7 LOW
.ADC_DB8RH	DS.B 1		; DATA BUFFER REGISTER 8 HIGH
.ADC_DB8RL	DS.B 1		; DATA BUFFER REGISTER 8 LOW
.ADC_DB9RH	DS.B 1		; DATA BUFFER REGISTER 9 HIGH
.ADC_DB9RL	DS.B 1		; DATA BUFFER REGISTER 9 LOW
RESERVED21	DS.B 12		; UNUSED
.ADC_CSR	DS.B 1		; ADC CONTROL/STATUS REGISTER
.ADC_CR1	DS.B 1		; ADC CONFIGURATION REGISTER 1
.ADC_CR2	DS.B 1		; ADC CONFIGURATION REGISTER 2
.ADC_CR3	DS.B 1		; ADC CONFIGURATION REGISTER 3
.ADC_DRH	DS.B 1		; DATA BITS HIGH
.ADC_DRL	DS.B 1		; DATA BITS LOW
.ADC_TDRH	DS.B 1		; SCHMITT TRIGGER DISABLE HIGH
.ADC_TDRL	DS.B 1		; SCHMITT TRIGGER DISABLE LOW
.ADC_HTRH	DS.B 1		; HIGH THRESHOLD REGISTER HIGH
.ADC_HTRL	DS.B 1		; HIGH THRESHOLD REGISTER LOW
.ADC_LTRH	DS.B 1		; LOW THRESHOLD REGISTER HIGH
.ADC_LTRL	DS.B 1		; LOW THRESHOLD REGISTER LOW
.ADC_AWSRH	DS.B 1		; ANALOG WATCHDOG STATUS REGISTER HIGH
.ADC_AWSRL	DS.B 1		; ANALOG WATCHDOG STATUS REGISTER LOW
.ADC_AWCRH	DS.B 1		; ANALOG WATCHDOG CONTROL REGISTER HIGH
.ADC_AWCRL	DS.B 1		; ANALOG WATCHDOG CONTROL REGISTER LOW
RESERVED22	DS.B 11088	; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;  GLOBAL CONFIGURATION REGISTER (CFG) AT 0X7F60
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.CFG_GCR	DS.B 1		; CFG GLOBAL CONFIGURATION REGISTER
RESERVED23	DS.B 15		; UNUSED
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; INTERRUPT SOFTWARE PRIORITY REGISTER (ITC) AT 0X7F70
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.ITC_SPR1	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 1
.ITC_SPR2	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 2
.ITC_SPR3	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 3
.ITC_SPR4	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 4
.ITC_SPR5	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 5
.ITC_SPR6	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 6
.ITC_SPR7	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 7

;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;                       DEFINE MEMORY ADDRESS CONSTANT
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; RAM(stack) 1K(512) bytes 0x0000-0x03FF for STM8S103K3
RamPage0	EQU     $0000      ; RAM zero page start address (256 bytes)
RamPage1       EQU     $0100      ; RAM page #1 start address (256 bytes)
RamStack       EQU     $0200      ; RAM stack start address (512 bytes)
RamEnd         	EQU     $03FF      ; End of RAM address
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; EEPROM 640 bytes (10 pages of 64 bytes each) $4000-$427F for STM8S103K3
; 1 page = 1 block = 64 bytes
EEPStart       EQU     $4000  	   ; EEPROM start address (640 bytes)
EE_PageSize   	EQU     64 	   ; EEPROM page size (64 bytes/page)
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
EE_StartAddr1  EQU     EEPStart      			;starting address of page1
EE_StartAddr2  EQU     {EEPStart+EE_PageSize}    	;starting address of page2
EE_BlockSize1  EQU     4          			;size of eeprom block1 (bytes/block) --> included checksum
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
ILLEGAL_OP	EQU	$05	;ANY ILLEGAL OP-CODE READ FROM THE PROGRAM SPACE TRIGGERS A MCU RESET.
				;FROM AN3006 EMC GUIDELINES FOR STM8A MICROCONTROLLER				
;ÍÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
; ³ Define Constant ³
; ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾	
;ÄÚÄÄÄÄÄÄÄÄÄÄ¿ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; ³ STAT_FLG ³
; ÀÄÄÄÄÄÄÄÄÄÄÙ
NORM_FLG	equ	7
;	equ	6
;	equ	5
;	equ	4
;	equ	3
;	equ	2
;	equ	1
;	equ	0
;ÄÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; ³ General Constant ³
; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
RED_LED	equ	5
BLU_LED	equ	4

;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	BYTES			; THE FOLLOWING ADDRESSES ARE 8 BITS LONG
	SEGMENT BYTE AT 00-FF 'RAM0'
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;	DEFINE RAM PAGE 0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
TM_250US	DS.B	1
TM_1MS		DS.B	1
TM_005MS	DS.B	1
TM_100MS	DS.B	1
TM_01SEC	DS.B	1
TM_2US		DS.B	1
STAT_FLG	DS.B	1
DSP_TIME	DS.B	1
ledblink	DS.B	1
digit		DS.B	1
number1		DS.B	1
number2		DS.B	1
nub			DS.B	1
old_value 	DS.B 	1
cur_value 	DS.B 	1
state_zero 	DS.B 	1
state_one 	DS.B 	1
count_db0 	DS.B 	1
count_db1 	DS.B 	1
db_zero 	DS.B 	1
db_one	 	DS.B 	1
new_state	DS.B 	1
old_state	DS.B 	1
sw1_bit		DS.B 	1
sw2_bit		DS.B 	1
old_values 	DS.B 	1
cur_values 	DS.B 	1
state_zeros DS.B 	1
state_ones 	DS.B 	1
count_db0s 	DS.B 	1
count_db1s 	DS.B 	1
db_zeros 	DS.B 	1
db_ones	 	DS.B 	1
new_states	DS.B 	1
old_states	DS.B 	1
sw1_bits	DS.B 	1
sw2_bits	DS.B 	1
ana_value	DS.B 	1
ADON_bit	DS.B 	1
EOC			DS.B 	1
tx_count	DS.B 	1
Rx_count	DS.B 	1
Rx_buffer0	DS.B 	1
Rx_buffer1	DS.B 	1
Rx_buffer2	DS.B 	1
RX_TM		DS.B 	1
sum         DS.B 	1
nub_Tx		DS.B 	1
Tx_sum		DS.B 	1
;
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	WORDS			; THE FOLLOWING ADDRESSES ARE 16 BITS LONG
	SEGMENT BYTE AT 0100-01FF 'RAM1'
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;	DEFINE RAM PAGE 1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
DATAARRY        DS.B    64     ;RESERVED DATA ARRAY	
	
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	WORDS			; THE FOLLOWING ADDRESSES ARE 16 BITS LONG
	SEGMENT BYTE AT 0200-03FF 'STACK'
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;	RESERVE FOR RAM STACK
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
STACK_RAM	DS.B	1	;RAM FOR CHECK STACK OVER FLOW
RAM_EXEC      	DS.B    128        ;reserved RAM execute
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	WORDS			; THE FOLLOWING ADDRESSES ARE 16 BITS LONG
	SEGMENT BYTE AT 8080-9FFF 'ROM'
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;		P R O G R A M      S T A R T
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
; ³  Start from Reset  ³
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
START:	; Reset value
	; Clock control
	; HSI internal 16MHz RC oscillator --> fHSI/8 = 2MHz --> fMASTER
	; fMASTER/1 --> 2MHz/1 = 2MHz --> fCPU
	; Independent watchdog (IWDG)
	; LSI internal 128 kHz RC oscillator --> fLSI
	; fLSI/2 fixed = 64KHz --> 64KHz/4 = 16KHz(62.5us) --> fIWDG (15.9375ms period)
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
		;ÄÄ Disable Interrupt ÄÄÄÄÄÄÄÄÄÄÄ
		SIM
		;ÄÄ Init Stack Pointer ÄÄÄÄÄÄÄÄÄÄ
		ldw	X,#RamEnd
		ldw    	SP,X
		;ÄÄ Clr RAM ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
CLR_ARAM:     	ldw    	X,#{256+256+512-1} 	; load RAM size
LP_CLRAM: 	mov    	IWDG_KR,#$AA    	; refresh watchdog
		clr     	(RamPage0,X)    	; clear memory on each address
		decw   	X               	; decrease pointer
		jrne    LP_CLRAM        	; jump if not end
		clr     	RamPage0        	; clear 1st byte
		;ÄÄ Check Stack ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		ld	A,#$AA			; Save known value for check stack overflow
		ld	STACK_RAM,A
		;ÄÄ Init All ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		call	INIT_ALL
		;ÄÄ Wait Run ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
WAIT_STB:      ; wait for stable ( 80ms )
		; fCPU = 16MHz --> 0.0625us/cycle
		ld	A,#80          		; set outer loop for 80ms
WAIT_OLP: 	ldw    	X,#3200         	; set inner loop for 1ms	[2]cy
WAIT_ILP:    	mov     IWDG_KR,#$AA   	; refresh watchdog     		[1]cy
		decw   	X              		;				[2]cy
		jrne    WAIT_ILP       		;                      		[2]cy
		dec     A              		;                      		[1]cy
		jrne    WAIT_OLP       		;	                       	[2]cy
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		RIM
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
; ³ Start of Main Loop ³
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

;GPIO output to input for switch
setinput: 	bres PB_DDR,#1
			bres PB_DDR,#7
			bres PB_DDR,#0		;set output to input
			bres PB_CR1,#0		;set AD ON at bit0
			bres PB_CR2,#0		;set single mode

MAIN_LP:	ld      	A,TIM4_CNTR		; check 2 us counter
		sub	A,#125			; for 125 x 2 = 250 us
		jrult	MAIN_LP

;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;		[  250 USEC. SERVICE ROUTINE  ÄÄ 
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
SVR_250us:	ld	TIM4_CNTR,A
		inc	TM_250US		; inc 250 us counter
Start_250us:	;ÄÄ250 usÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		mov	IWDG_KR,#$AA		; refresh WATCHDOG
		call	PROC_DSP		; Process Display
End_250us:	;ÄÄ250 usÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		ld	A,TM_250US
		sub	A,#4			; for 250 x 4 = 1 ms counter
		jruge	SVR_1ms
		jp	MAIN_LP
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;		[  1 MSEC. SERVICE ROUTINE  ÄÄ 
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ		
SVR_1ms:	ld	TM_250US,A
			inc	TM_1MS		; inc 1 ms counter
Start_1ms:	;ÄÄ1MSECÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

			call START_RECIEVE

End_1ms:	;ÄÄ1MSECÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
			ld	A,TM_1MS
			sub	A,#5			; for 1 x 5 = 5 ms counter
			jruge	SVR_5ms
			jp	MAIN_LP		

;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;		[  5 MSEC. SERVICE ROUTINE  ÄÄ 
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
SVR_5ms:	ld	TM_1MS,A
		inc	TM_005MS		; inc 5 ms counter
Start_5ms:	;ÄÄ5 msÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
			call add_digit1
			call set_ADC
Chk_Stak:	;ÄÄ Chk Stack ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
		ld	A,STACK_RAM		; Check Stack Overflow
		cp	A,#$AA			; if not correct loop for watch dog reset
		jrne	Chk_Stak	
		;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		
End_5ms:	;ÄÄ5 msÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		ld	A,TM_005MS
		sub	A,#20				; for 5 x 20 = 100 ms counter
		jruge	SVR_100ms
		jp	MAIN_LP
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
;		[  100 MSEC. SERVICE ROUTINE  ] 
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
SVR_100ms:	ld	TM_005MS,A
			call START_TRANSMIT
			jp MAIN_LP
			
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ	
;			       ³  End of Main Loop  ³
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;#################################7-Segment;################################3		
add_digit1: 
	  ld A,digit
	  cp A,#1
	  jreq add_digit2
	  inc digit
	  bres PD_ODR,#4
	  bset PD_ODR,#2
	  ld A,nub
	  srl A
	  srl A
	  srl A 
	  srl A
	  ld number1,A
	  call check_number1
	  ret
	  
add_digit2: 
	  dec digit
	  bres PD_ODR,#2
	  bset PD_ODR,#4
	  ld A,nub
	  AND A,#%00001111
	  ld number1,A
	  call check_number1
	  ret
	  
	  
;############################switch 1##############################;
rec_sw1:	ld A,PB_IDR
			srl A
			AND A,#00000001
			ld cur_value,A
			
check_value:  	ld A,cur_value
				cp A,#00000001
				jreq count_one_db
				cp A,#00000000
				jreq count_zero_db
				
count_zero_db:	inc db_zero
				clr	db_one
				jp def_zero_st
				
count_one_db:	inc db_one
				clr db_zero
				jp def_one_st
				
def_zero_st:	ld A,db_zero
				cp A,#4
				jruge zero_state
				jp end_sw1
				
def_one_st:		ld A,db_one
				cp A,#4
				jruge one_state
				jp end_sw1		
				
zero_state: 	mov db_zero,#4
				ld A,#0
				ld new_state,A 
				jp comp_old_new
			
one_state: 		mov db_zero,#4
				ld A,#1
				ld new_state,A
				jp comp_old_new


comp_old_new: 	ld A,old_state
				cp A,new_state
				jrne check_newst_one 
				jp end_sw1
				
check_newst_one: ld A,new_state
				 ld old_state,A
				 ld A,new_state
				 cp A,#1
				 jreq press_nub
				 jp end_sw1
				 
press_nub:		
				inc nub
end_sw1:
				ret
;##########################################swich 2#######################################################################;				
rec_sw2: 	ld A,PB_IDR
			srl A
			srl A
			srl A
			srl A
			srl A
			srl A
			srl A
			AND A,#00000001
			ld cur_values,A

check_values:  	ld A,cur_values
				cp A,#00000001
				jreq count_one_dbs
				cp A,#00000000
				jreq count_zero_dbs
				
count_zero_dbs:	inc db_zeros
				clr	db_ones
				jp def_zero_sts
				
count_one_dbs:	inc db_ones
				clr db_zeros
				jp def_one_sts
				
def_zero_sts:	ld A,db_zeros
				cp A,#4
				jruge zero_states
				jp end_sw2
				
def_one_sts:	ld A,db_ones
				cp A,#4
				jruge one_states
				jp end_sw2		
				
zero_states: 	mov db_zero,#4
				ld A,#0
				ld new_states,A 
				jp comp_old_news
			
one_states: 	mov db_zeros,#4
				ld A,#1
				ld new_states,A
				jp comp_old_news


comp_old_news: 	ld A,old_states
				cp A,new_states
				jrne check_newst_ones 
				jp end_sw2
				
check_newst_ones: ld A,new_states
				 ld old_states,A
				 ld A,new_states
				 cp A,#1
				 jreq press_nubs
				 jp end_sw2
				 
press_nubs:		
				dec nub
end_sw2:
				ret
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ	
;			                                                        CHECK NUMBER SEVEN SEGMENT
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ				
check_number1: ld A,number1
			  cp A,#0			  
			  jreq pre1_number0
			  
			  cp A,#1
			  jreq pre1_number1
			  
			  cp A,#2
			  jreq pre1_number2
			  
			  cp A,#3
			  jreq pre1_number3
			  
			  cp A,#4
			  jreq pre1_number4
			  
			  cp A,#5
			  jreq pre1_number5
			  
			  cp A,#6
			  jreq pre1_number6
			  
			  cp A,#7
			  jreq pre1_number7
			  
			  cp A,#8
			  jreq pre1_number8
			  
			  cp A,#9
			  jreq pre1_number9
			  
			  cp A,#10
			  jreq pre1_number10
			  
			  cp A,#11
			  jreq pre1_number11
			  
			  cp A,#12
			  jreq pre1_number12
			  
			  cp A,#13
			  jreq pre1_number13
			  
			  cp A,#14
			  jreq pre1_number14
			  
			  cp A,#15
			  jreq pre1_number15
			  
pre1_number0: 
			call 	numberzero1
			ret
			 
pre1_number1: 
			call 	numberone1
			ret
			 
pre1_number2: 
			call 	numbertwo1
			ret
			 
pre1_number3: 
			call 	numberthree1
			ret				 
			 
pre1_number4: 
			call 	numberfour1
			ret				 
			 
pre1_number5: 
			call 	numberfive1
			ret				 
			 
pre1_number6: 
			call 	numbersix1
			ret				 
			 
pre1_number7: 
			call 	numberseven1
			ret				 
			 
pre1_number8: 
			call 	numbereight1
			ret
			 
pre1_number9: 
			call 	numbernine1
			ret		 
			 
pre1_number10: 
			call 	numberten1
			ret			 
			 
pre1_number11: 
			call 	numbereleven1
			ret			 
			 
pre1_number12: 
			call 	numbertwelve1
			ret				 
			 
pre1_number13: 
			call 	numberthirteen1
			ret

pre1_number14: 
			call 	numberfourteen1
			ret

pre1_number15: 
			call 	numberfifteen1
			ret	
			  
numberzero1: 
			mov 	PC_ODR,#%00110000
			bres 	PE_ODR,#5
		    ret	
			
numberone1: 
			mov 	PC_ODR,#%11110011 
		    bset 	PE_ODR,#5
		    ret
		   
numbertwo1: 
			mov 	PC_ODR,#%10100100 
		    bres 	PE_ODR,#5
		    ret
		   
numberthree1: 
			mov 	PC_ODR,#%10100010
			bres 	PE_ODR,#5
	        ret
			 
numberfour1: 
			mov 	PC_ODR,#%01100010
			bset 	PE_ODR,#5
            ret
			 
numberfive1: 
			mov 	PC_ODR,#%00101010
			bres 	PE_ODR,#5
			ret
			 
numbersix1: 
			mov 	PC_ODR,#%00101000
		    bres 	PE_ODR,#5
		    ret
			
numberseven1: 
			mov PC_ODR,#%10110011
			bset PE_ODR,#5
			ret
			 
numbereight1: 
			mov 	PC_ODR,#%00100000
			bres 	PE_ODR,#5
			ret
			  
numbernine1: 
			mov 	PC_ODR,#%00100010
			bres 	PE_ODR,#5
			ret
			 
numberten1: 
			mov 	PC_ODR,#%00100001
		    bset 	PE_ODR,#5
		    ret
			
numbereleven1: 
			mov 	PC_ODR,#%01101000
			bres 	PE_ODR,#5
			ret
			   
numbertwelve1: 
			mov 	PC_ODR,#%00111100
			bres 	PE_ODR,#5
			ret
			  
numberthirteen1: 
			mov 	PC_ODR,#%11100000
			bres 	PE_ODR,#5
			ret
				 
numberfourteen1: 
			mov 	PC_ODR,#%00101100
			bres 	PE_ODR,#5
			ret
				 
numberfifteen1:
			mov 	PC_ODR,#%00101100
			bset 	PE_ODR,#5
			ret
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ	
;			                                                                  ³  Code for ADC  ³
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;GPIO output to input for ADC;
set_ADC:
				bset ADC_TDRL,#0	;SCHMITT TRIGGER DISABLE LOW
				bset ADC_CR1,#0		;set ADON
				bres ADC_CR1,#1		;reset bit1 to single-mode
				mov  ADC_CR2,#%00110011
				mov  ADC_CR3,#%00000000
;-------------------------------------------------------ADC operation--------------------------------------------------------------------;
time_conversion:
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop		;waste 14 clk
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop
				nop		;waste 14 clk

				
collect_flag:
				ld A, ADC_CSR
				srl A
				srl A
				srl A
				srl A
				srl A
				srl A
				srl A
				AND A,#%00000001
				ld EOC, A
compare_eoc:
				ld A, EOC
				cp A,#1
				jreq disp_ADC
				ret
				
disp_ADC: 		ld A, ADC_DRH
				ld nub_Tx, A
				ret
				
				
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ	
;			                                                                UART1_Tx
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
START_TRANSMIT:
				mov UART1_CR2,#%00001000
				ld A,#$55
				ld UART1_DR,A
				clr tx_count
				mov UART1_CR2,#%10001000 ;TXE
				ret

;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ	
;			                                                                UART1_Rx
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
START_RECIEVE:
				ld A,RX_TM
				cp A,#0
				jrne PRE_CHECK
				ret
				
PRE_CHECK:
				dec RX_TM
				ld A,RX_TM
				cp A,#0
				jreq CHECK_HEADER
				ret 
				
CHECK_HEADER:
				ld A,Rx_buffer0
				cp A,#$55
				jreq CHSUM_RECIEVE
				call CLEAR_BUFFER
				ret
				
CHSUM_RECIEVE:
				ld A,Rx_buffer2
				ADD A,#$55
				ADD A,Rx_buffer1
				cp A,#$FF
				jreq DATA_RECIEVE
				call CLEAR_BUFFER
				ret
				
DATA_RECIEVE:
				ld A,Rx_buffer1
				ld nub,A
				call CLEAR_BUFFER
				ret
				
CLEAR_BUFFER:
				clr Rx_count
				clr Rx_buffer0
				clr Rx_buffer1
				clr Rx_buffer2
				ret
										  
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ	
;			                                                                UART1_INTERREUPT
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

;#TRANSMISSION#;				
TX_ISR:
				ld A,tx_count
				cp A,#0
				jreq TRANS_DATA
				cp A,#1
				jreq TRANS_CHSUM
				bres UART1_SR,#6
				mov UART1_CR2,#%00100100 ;OPEN RIEN AND RECIEVER ENABLE
				iret
				
TRANS_CHSUM:
				inc tx_count
;				ld A,UART1_SR
				ld A,Tx_sum
				ld UART1_DR,A
				mov UART1_CR2,#%01001000 ;OPEN TC
				iret
				
TRANS_DATA:
				inc tx_count
;				ld A,UART1_SR
				ld A,nub_Tx
				ld UART1_DR,A
				ADD A,#$55
				XOR A,#$FF	
				ld Tx_sum,A
				iret
				
				
;#RECIEVER#;	

RX_ISR: 	
				ld A,#4
				ld RX_TM,A
				ld A,Rx_count
				cp A,#0
				jreq Rx_count0
				cp A,#1
				jreq Rx_count1
				cp A,#2
				jreq Rx_count2
				iret
Rx_count0:		
				ld A,UART1_DR
				ld Rx_buffer0,A
				inc Rx_count
				iret
				
Rx_count1:
				ld A,UART1_DR
				ld Rx_buffer1,A
				inc Rx_count
				iret

Rx_count2:
				ld A,UART1_DR
				ld Rx_buffer2,A
				iret
				
				

;ÄÄÚÄÄÄÄÄÄÄÄÄÄ¿ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
;  ³ INIT ALL ³
;  ÀÄÄÄÄÄÄÄÄÄÄÙ
INIT_ALL:	
		;ÄÄ GLOBAL CONFIGURATION ÄÄÄÄÄÄÄÄ
		bset	CFG_GCR,#1		; SWD 	-> 	0: SWIM MODE ENABLE	
						;		1: SWIM MODE DISABLE			
		bres	CFG_GCR,#0		; AL	-> 	0: MAIN ATIVATION LEVEL
						;		1: INTERRUPT-ONLY ATIVATION LEVEL
		;ÄÄ INITAIL WATCH DOG ÄÄÄÄÄÄÄÄÄÄÄ
		mov	IWDG_KR,#$CC		; START WATCHDOG !! MUST START WATCH DOG BEFORE ACCESS
		mov	IWDG_KR,#$55		; ACCESS KEY TO CONFIG IWDG_PR,RLR 
		mov	IWDG_PR,#%00000100	; DIVIDER/64    ->64/64= 1 KHZ = 1 MS
		mov	IWDG_RLR,#250		; COUNT FOR 250	->1*250= 250 MS
		mov	IWDG_KR,#$AA		; REFRESH WATCHDOG		
		;ÄÄ CONFIG CLOCK ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		;mov	CLK_SWCR,#$02		; Enable clock switch execution
		;mov	CLK_SWR,#$B4		; HSE selected as master clock source
		;mov	CLK_ICKR,#$00		; High speed internal RC off
		mov	CLK_CKDIVR,#00		; Fcpu = Fmaster
;WAIT_CLK:	;ld	A,CLK_CMSR   
		;cp	A,#$B4			; wait for clock switched
		;jrne	WAIT_CLK
		;bres	CLK_SWCR,#1		; Disable clock switch execution
		;ÄÄ Config UART1 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
		mov 	UART1_CR1,#%00000000		; 9 data(MSB is Parity bit), UART enable,even Parity
		mov 	UART1_CR3,#$00		; 1 stopbit, Disable SLK
		mov 	UART1_BRR2,#$01
		mov 	UART1_BRR1,#$34		; 19200 bps / Fmaster = 16 MHz
		mov 	UART1_CR2,#%00001000		; OFF TIEN, ON RIEN, OFF TEN, ON REN 		
		;ld	A,UART1_SR
		;ld	UART1_DR,A		; Clr TXE bit
		;ÄÄ ENABLE CLOCK ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
		mov	CLK_PCKENR1,#%10011000	;ENABLE CLOCK FOR TIMER 1,4	
		mov	CLK_PCKENR2,#%00001000		
		;ÄÄ External Interrupt ÄÄÄÄÄÄÄÄÄÄ
		mov	EXTI_CR2,#$00		;PD7 - falling edge external interrupt
		;ÄÄ TIMER 1 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		mov	TIM1_CR1,#{1 SHL 2}	; UPDATE ARR ON THE FLY,INTERRUPT GENENRATE WHEN OVERFLOW	  	
		mov	TIM1_IER,#{1 SHL 0}	; ENABLE UPDATE INTERUPT
		mov	TIM1_CCER1,#00		; CAPTURE IS DISABLED
		mov	TIM1_CCER2,#00				
		mov	TIM1_PSCRH,#00
		mov	TIM1_PSCRL,#15		; PRESCALER = 15+1, STEP = 16MHz/16 = 1 us
		bset	TIM1_EGR,#0		; Set UG bit for Generate Update Event for update prescaler value
		mov	TIM1_ARRH,#{HIGH 15000}; AUTO RELOAD EVERY 15000 US
		mov	TIM1_ARRL,#{LOW 15000}	
		mov	TIM1_RCR,#00
		mov	TIM1_SR1,#00		; clr tim1 interrupt overflow flag
		bres	TIM1_CR1,#0		; OFF TIMER1
		mov	TIM1_CNTRH,#00		; IR_time=TIM1_GetCounter();	TIM1_SetCounter(0x00); 
		mov	TIM1_CNTRL,#00		
		;ÄÄ TIMER 2 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		;mov	TIM2_CR1,#{1 SHL 2}	; UPDATE ARR ON THE FLY,INTERRUPT GENENRATE WHEN OVERFLOW	  	
		;mov	TIM2_IER,#{1 SHL 0}	; ENABLE UPDATE INTERUPT
		;mov	TIM2_CCER1,#00		; CAPTURE IS DISABLED
		;mov	TIM2_CCER2,#00					
		;mov	TIM2_PSCR,#$00		; PRESCALER = 16, STEP = 16MHz = 1/16 us
		;mov	TIM2_ARRH,#{HIGH 65000}; AUTO RELOAD EVERY 65000 US
		;mov	TIM2_ARRL,#{LOW 65000}			
		;bres	TIM2_CR1,#0		; OFF TIMER2
		;ÄÄ TIMER 4 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		mov	TIM4_PSCR,#5		; PRESCALER = 16, STEP = 16/(2^5) = 16/32 = 0.5 MHz = 2 us
		bset	TIM4_EGR,#0		; Set UG bit for Generate Update Event for update prescaler value
		mov	TIM4_ARR,#$FF		; AUTO RELOAD 
		mov    	TIM4_CR1,#%00000100	; UPDATE ARR ON THE FLY,INTERRUPT GENENRATE WHEN OVERFLOW  START TIMER 4	
		mov	TIM4_IER,#$00		; DISABLE UPDATE INTERUPT
		bset	TIM4_CR1,#0		; START TIMER 4			
		;ÄÄ Assign RAM ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ			 	
		bset 	STAT_FLG,#NORM_FLG

		;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
INIT_PORT:	;ÄÄ INIT PORT A ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		mov	PA_ODR,#%00000000	;
		mov	PA_DDR,#%11111111	; PA3-1 Output push-pull Torch
		mov	PA_CR1,#%11111111	;
		mov	PA_CR2,#%00000000	; NO INTERRUPT		
		;ÄÄ INIT PORT B ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		mov	PB_ODR,#%00000000	; 
		mov	PB_DDR,#%11111111	; PB1,PB0 input A/D
		mov	PB_CR1,#%11111111	; 
		mov	PB_CR2,#%00000000	; 	
		;ÄÄ INIT PORT C ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		mov	PC_ODR,#%00000000	 
		mov	PC_DDR,#%11111111	; PC1-7 Output push-pull                   
		mov	PC_CR1,#%11111111	; 
		mov	PC_CR2,#%00000000	; NO INTERRUPT                        	
		;ÄÄ INIT PORT D ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ                                           
		mov	PD_ODR,#%00100000    	;¿ PD3-0 Output push-pull                                                              
		mov	PD_DDR,#%00111111  	;³ PD4   Output IR Transmit                                                                  
		mov	PD_CR1,#%01111111   	;³ PD6,5 UART / PD7 Input with Interrupt for IR                                                                   
		mov	PD_CR2,#%00000000	;Ù INTERRUPT for PD7	                                             
		;ÄÄ INIT PORT E ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		mov	PE_ODR,#%11111111                          
		mov	PE_DDR,#%11111111   	; PE5 Output push-pull                      
		mov	PE_CR1,#%11111111   	;                                                                    
		mov	PE_CR2,#%00000000	; NO INTERRUPT	                                               
		;ÄÄ INIT PORT F ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		mov	PF_ODR,#%00000000                          
		mov	PF_DDR,#%00000000     	; PF4 input for option                   
		mov	PF_CR1,#%11111111                                                                      
		mov	PF_CR2,#%00000000	; NO INTERRUPT	    
		
		ret
;ÄÄÄÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;   ³ Process DSP ³
;   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
PROC_DSP:	btjf	STAT_FLG,#NORM_FLG,END_PDSP
		ld	A,DSP_TIME
		cp	A,#20
		jrugt	OFF_LED
		bres 	PB_ODR,#BLU_LED
		bset 	PB_ODR,#RED_LED
		jp	END_PDSP
OFF_LED:	bset 	PB_ODR,#BLU_LED
		bres 	PB_ODR,#RED_LED
END_PDSP:	ret
;ÄÄÄÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;   ³ No Operation ³
;   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
nop8:		nop
nop7:		nop
nop6:		nop
nop5:		nop
nop4:		nop
nop3:		nop
nop2:		nop
nop1:		nop
		ret
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;				[  Interrupt Service Routine  ÄÄ
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;ÄÄÄÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;   ³ No Handle ISR ³
;   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
NONHANDLEDINTERRUPT:
		iret
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        WORDS       		; FOLLOWING ADDRESSES ARE 16-BIT LENGTH
        SEGMENT BYTE AT 9FFF-9FFF 'RSTINST'    ;1 BYTES
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
RST_INST:       DC.B    ILLEGAL_OP      ;RESET INSTRUCTION
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;				[  Interrupt Vector Table  ]
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	WORDS			; THE FOLLOWING ADDRESSES ARE 16 BITS LONG
	SEGMENT BYTE AT 8000-807F 'VECTIT'
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	DC.L {$82000000+START}		; RESET								0X00 8000
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; TRAP								0X00 8004
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ0 	  TLI EXTERNAL TOP LEVEL INTERRUPT 			0X00 8008             
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ1 	  AWU AUTO WAKE UP FROM HALT 				0X00 800C                 
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ2 	  CLK CLOCK CONTROLLER 					0X00 8010                         
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ3 	  EXTI0 PORT A EXTERNAL INTERRUPTS  			0X00 8014         
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ4    EXTI1 PORT B EXTERNAL INTERRUPTS			0X00 8018         
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ5    EXTI2 PORT C EXTERNAL INTERRUPTS			0X00 801C         
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ6    EXTI3 PORT D EXTERNAL INTERRUPTS			0X00 8020         
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ7    EXTI4 PORT E EXTERNAL INTERRUPTS			0X00 8024         
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ8    CAN CAN RX INTERRUPT					0X00 8028                     
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ9    CAN CAN TX/ER/SC INTERRUPT				0X00 802C                   
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ10   SPI END OF TRANSFER					0X00 8030                      
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ11   TIM1 UPDATE /OVERFLOW/UNDERFLOW/TRIGGER/BREAK 	0X00 8034
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ12   TIM1 CAPTURE/COMPARE  				0X00 8038                         
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ13   TIM2 UPDATE /OVERFLOW 				0X00 803C                        
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ14   TIM2 CAPTURE/COMPARE  				0X00 8040                         
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ15   TIM3 UPDATE /OVERFLOW 				0X00 8044                        
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ16   TIM3 CAPTURE/COMPARE  				0X00 8048                         
	DC.L {$82000000+TX_ISR}	; IRQ17   UART1 TX COMPLETE     				0X00 804C                            
	DC.L {$82000000+RX_ISR}	; IRQ18   UART1 RECEIVE REGISTER DATA FULL 			0X00 8050             
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ19   I2C I2C INTERRUPT 					0X00 8054                        
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ20   UART2/3 TX COMPLETE					0X00 8058                          
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ21   UART2/3 RECEIVE REGISTER DATA FULL 			0X00 805C           
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ22   ADC END OF CONVERSION					0X00 8060                        
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ23   TIM4 UPDATE/OVERFLOW					0X00 8064                         
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ24   FLASH EOP/WR_PG_DIS					0X00 8068             
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ25 					           
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ26 					                        
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ27 					                         
	DC.L {$82000000+NONHANDLEDINTERRUPT}	; IRQ28 					              

	END
