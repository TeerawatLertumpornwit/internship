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
TM_2US	DS.B	1
TM_250US	DS.B	1
TM_001MS	DS.B	1
TM_005MS	DS.B	1
TM_100MS	DS.B	1
TM_01SEC	DS.B	1
TM_16SEC	DS.B	1
STAT_FLG	DS.B	1
DSP_TIME	DS.B	1
Chk_Dig		DS.B	1
num			DS.B	1
n_count			DS.B	1
n_set			DS.B	1
Tx_count		DS.B	1
Rx_count		DS.B	1
header 			DS.B	1
data_adc		DS.B	1
Rx_data_1		DS.B	1
Rx_data_2		DS.B	1
Rx_data_3		DS.B	1
Rx_Timer		DS.B	1
check_sum_keeper 	DS.B	1
;
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
Set_Pin:
		bres	PB_DDR,#0 ;set ANALOG INPUT
		bres	PB_CR1,#0
		bres	PB_CR2,#0
		
Set_header:
		mov header,#$31
				
MAIN_LP:	ld      	A,TIM4_CNTR		; check 2 us counter
		sub	A,#125			; for 125 x    2 = 250 us
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
		inc	TM_001MS		; inc 1 ms counter
		
Start_1ms:	;ÄÄ1 msÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ		 
		call Rx_Routine
		
Chk_Stak:	;ÄÄ Chk Stack ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
		ld	A,STACK_RAM		; Check Stack Overflow
		cp	A,#$AA			; if not correct loop for watch dog reset
		jrne	Chk_Stak	;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

End_1ms:	;ÄÄ1 msÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		ld	A,TM_001MS
		sub	A,#5				; for 1 x 5 = 5 ms counter
		jruge	SVR_5ms
		jp	MAIN_LP
		
		
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;		[  5 MSEC. SERVICE ROUTINE  ÄÄ 
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
SVR_5ms:	ld	TM_001MS,A
		inc	TM_005MS		; inc 5 ms counter
		
Start_5ms:	;ÄÄ5 msÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ		 
		call ad_convert
		call display
		
End_5ms:	;ÄÄ5 msÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		ld	A,TM_005MS
		sub	A,#20				; for 5 x 20 = 100 ms counter
		jruge	SVR_100ms
		jp	MAIN_LP
		
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
;		[  100 MSEC. SERVICE ROUTINE  ] 
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
SVR_100ms:	
		ld	TM_005MS,A
		call Tx_Routine
		jp	MAIN_LP


;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ	
;			       ³  End of Main Loop  ³
;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
i_return:
	iret
	
;############################################################################
;		Tx Routine
;############################################################################	
Tx_Routine:
	mov UART1_CR2,#%00001000 ; change mode to Tx
	mov UART1_DR,#$31 ; send header
	mov Tx_count,#0  ; clear counter
	mov UART1_CR2,#%10001000 ; set interrupt Tx
	ret
		
;############################################################################
;		Tx interrupt
;############################################################################
Tx_ISR:
	ld A,Tx_count
	cp A,#0
	JREQ send_data
	cp A,#1
	JREQ send_check_sum
	; change to Rx
	mov Tx_count,#0
	bres 	UART1_SR,#6 ;clear TC ;TC = 0
	ld A,#%00100100 ; clear Tx count
	ld UART1_CR2,A ; set CR2 to change work of interrupt - Change Tx to Rx
	JP	i_return
	
send_data:	
	ld A,data_adc			
	ld UART1_DR,A ; send 2nd byte
	ld A,header
	add A,data_adc ; sum byte 1+2
	xor A,#%11111111
	ld check_sum_keeper,A
	inc Tx_count
	JP	i_return
	
send_check_sum:
	ld A,check_sum_keeper
	ld UART1_DR,A ; send 3rd byte
	inc Tx_count
	ld A,#%01001000
	ld UART1_CR2,A ; set CR2 to change work of interrupt - Tx complete
	JP	i_return
	
;############################################################################
;		Rx Routine
;############################################################################
Rx_Routine:	
	ld A,Rx_Timer
	cp A,#0
	JRNE dec_Timer ; if Rx_Timer > 0 do dec_Timer
	ret 
dec_Timer:
	dec Rx_Timer	
	ld A,Rx_Timer
	cp A,#0
	JREQ Check_header
	ret
Check_header:
	ld A,Rx_data_1
	cp A,#$31 ;check header = Rx_data_1
	JRNE Clr_Buffer 
Check_Sum_Rx:
	ld A,Rx_data_1
	add A,Rx_data_2 ;sum data 1+2
	add A,Rx_data_3 ;sum data 1+2+3
	cp A,#%11111111
	JRNE Clr_Buffer
load_data2:
	ld A,Rx_data_2
	ld num,A
Clr_Buffer:
	mov Rx_count,#0
	mov Rx_data_1,#0
	mov Rx_data_2,#0
	mov Rx_data_3,#0
	ret

;############################################################################
;		Rx interrupt
;############################################################################
Rx_ISR:		
	mov Rx_Timer,#4
	ld A,Rx_count
	cp A,#0
	JREQ load_header
	cp A,#1
	JREQ load_data
	;load_checksum:
	ld A,UART1_DR
	ld Rx_data_3,A
	JP	i_return
load_header:
	ld A,UART1_DR
	ld Rx_data_1,A
	inc Rx_count
	JP	i_return
	
load_data:
	ld A,UART1_DR
	ld Rx_data_2,A
	inc Rx_count
	JP	i_return


;############################################################################
;		ad convert
;############################################################################
ad_convert:
	ld A,n_set
	cp A,#2
	jreq convert
	mov		ADC_CR1,#%00000001 
	mov 	ADC_CR2,#%00110011
	mov 	ADC_CR3,#%00000000
	bset	ADC_TDRL, #0 ; config disable schmitt trigger
	mov n_count,#0
	inc n_set
count:	
	ld A,n_count
	cp A,#14
	jreq ad_convert
	nop
	inc n_count
	jp count
	
convert:	
	mov n_set,#0
	ld A,ADC_CSR
	and A,#%10000000
	cp A,#%10000000
	jreq load_num
	ret

load_num:
	ld A,ADC_DRH ; read digital data 
	;ld num,A
	ld data_adc,A
	ret

;############################################################################
;		display
;############################################################################
	
display:
		ld	A,Chk_Dig
		cp	A,#1
		jreq	Blink_Dig1
;--- Blink_Dig2 --- ;backward
		inc	Chk_Dig
		bset	PD_ODR,#4
		bres	PD_ODR,#2
		ld A,num
		AND A,#%00001111
		call	Disp_Dig
		ret
Blink_Dig1: ;forward
		dec	Chk_Dig
		bset	PD_ODR,#2
		bres	PD_ODR,#4
		ld A,num
		srl A
		srl A
		srl A
		srl A
		call	Disp_Dig
		ret
		
Disp_Dig:
	cp		A,#%00000000
	LJREQ 	show_0
	cp 		A,#%00000001
	LJREQ 	show_1
	cp		A,#%00000010
	LJREQ 	show_2
	cp 		A,#%00000011
	LJREQ	show_3
	cp		A,#%00000100
	LJREQ	show_4
	cp 		A,#%00000101
	LJREQ 	show_5
	cp		A,#%00000110
	LJREQ	show_6
	cp 		A,#%00000111
	LJREQ 	show_7
	cp		A,#%00001000
	LJREQ 	show_8
	cp 		A,#%00001001
	LJREQ 	show_9
	cp		A,#%00001010
	LJREQ 	show_A
	cp 		A,#%00001011
	LJREQ 	show_b
	cp		A,#%00001100
	LJREQ 	show_C
	cp 		A,#%00001101
	LJREQ 	show_d
	cp		A,#%00001110
	LJREQ 	show_E
	cp 		A,#%00001111
	LJREQ 	show_F
	ret
	

show_0:
	bres	PC_ODR,#6
	bres	PC_ODR,#3
	bres	PC_ODR,#2
	bres	PE_ODR,#5
	bres	PC_ODR,#1
	bres	PC_ODR,#7
	bset	PC_ODR,#4
	bset	PC_ODR,#5
	ret
	
show_1:
	bset	PC_ODR,#6
	bres	PC_ODR,#3
	bres	PC_ODR,#2
	bset	PE_ODR,#5
	bset	PC_ODR,#1
	bset	PC_ODR,#7
	bset	PC_ODR,#4
	bset	PC_ODR,#5
	ret
	
show_2:
	bres	PC_ODR,#6
	bres	PC_ODR,#3
	bset	PC_ODR,#2
	bres	PE_ODR,#5
	bres	PC_ODR,#1
	bset	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret
	
show_3:
	bres	PC_ODR,#6
	bres	PC_ODR,#3
	bres	PC_ODR,#2
	bres	PE_ODR,#5
	bset	PC_ODR,#1
	bset	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret	
	
show_4:
	bset	PC_ODR,#6
	bres	PC_ODR,#3
	bres	PC_ODR,#2
	bset	PE_ODR,#5
	bset	PC_ODR,#1
	bres	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret
	
show_5:
	bres	PC_ODR,#6
	bset	PC_ODR,#3
	bres	PC_ODR,#2
	bres	PE_ODR,#5
	bset	PC_ODR,#1
	bres	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret

show_6:
	bres	PC_ODR,#6
	bset	PC_ODR,#3
	bres	PC_ODR,#2
	bres	PE_ODR,#5
	bres	PC_ODR,#1
	bres	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret

show_7:
	bres	PC_ODR,#6
	bres	PC_ODR,#3
	bres	PC_ODR,#2
	bset	PE_ODR,#5
	bset	PC_ODR,#1
	bset	PC_ODR,#7
	bset	PC_ODR,#4
	bset	PC_ODR,#5
	ret	
	
show_8:
	bres	PC_ODR,#6
	bres	PC_ODR,#3
	bres	PC_ODR,#2
	bres	PE_ODR,#5
	bres	PC_ODR,#1
	bres	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret
	
show_9:
	bres	PC_ODR,#6
	bres	PC_ODR,#3
	bres	PC_ODR,#2
	bres	PE_ODR,#5
	bset	PC_ODR,#1
	bres	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret
	
show_A:
	bres	PC_ODR,#6
	bres	PC_ODR,#3
	bres	PC_ODR,#2
	bset	PE_ODR,#5
	bres	PC_ODR,#1
	bres	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret

show_b:
	bset	PC_ODR,#6
	bset	PC_ODR,#3
	bres	PC_ODR,#2
	bres	PE_ODR,#5
	bres	PC_ODR,#1
	bres	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret

show_C:
	bres	PC_ODR,#6
	bset	PC_ODR,#3
	bset	PC_ODR,#2
	bres	PE_ODR,#5
	bres	PC_ODR,#1
	bres	PC_ODR,#7
	bset	PC_ODR,#4
	bset	PC_ODR,#5
	ret

show_d:
	bset	PC_ODR,#6
	bres	PC_ODR,#3
	bres	PC_ODR,#2
	bres	PE_ODR,#5
	bres	PC_ODR,#1
	bset	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret
	
show_E:
	bres	PC_ODR,#6
	bset	PC_ODR,#3
	bset	PC_ODR,#2
	bres	PE_ODR,#5
	bres	PC_ODR,#1
	bres	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret
	
show_F:
	bres	PC_ODR,#6
	bset	PC_ODR,#3
	bset	PC_ODR,#2
	bset	PE_ODR,#5
	bres	PC_ODR,#1
	bres	PC_ODR,#7
	bres	PC_ODR,#4
	bset	PC_ODR,#5
	ret
	
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
		 		
		;ld	A,UART1_SR
		;ld	UART1_DR,A		; Clr TXE bit
		;ÄÄ ENABLE CLOCK ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
		mov	CLK_PCKENR1,#%11111111	;ENABLE CLOCK FOR ALL TIMER	
		mov	CLK_PCKENR2,#%00001000		
		;ÄÄ Config UART1 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ	
		mov 	UART1_CR1,#$00		; 9 data(MSB is Parity bit), UART enable,even Parity
		mov 	UART1_CR3,#$00		; 1 stopbit, Disable SLK
		mov 	UART1_BRR2,#$01
		mov 	UART1_BRR1,#$34		; 19200 bps / Fmaster = 16 MHz
		mov 	UART1_CR2,#%00001000		; OFF TIEN, OFF RIEN, ON TEN, OFF REN
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
		mov	PD_CR2,#%10000000	;Ù INTERRUPT for PD7	                                             
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
	DC.L {$82000000+Tx_ISR}	; IRQ17   UART1 TX COMPLETE     				0X00 804C                            
	DC.L {$82000000+Rx_ISR}	; IRQ18   UART1 RECEIVE REGISTER DATA FULL 			0X00 8050             
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
