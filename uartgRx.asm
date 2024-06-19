STM8/  	;THIS LINE MUST BE FIRST LINE
;умммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╦
;Ёддд    		    Init ST8			   дддЁ			
;тмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╬
;умммммммммммм╦
;Ё  Feature   Ё	
;тмммммммммммм╬
; - 2 LED Status
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;   	MACRO  
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; LONG BTJT #01
LBTJT           MACRO   M1,M2,M3
                BTJF    M1,M2,{*+5+3}
                JP      M3
                MEND
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; LONG BTJF #02
LBTJF           MACRO   M1,M2,M3
                BTJT    M1,M2,{*+5+3
                JP      M3
                MEND
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; LONG JREQ #03
LJREQ           MACRO   M1
                JRNE    {*+2+3}
                JP      M1
                MEND
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; LONG JRULT #04
LJRULT          MACRO   M1
                JRUGE   {*+2+3}
                JP      M1
                MEND
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; LONG JREQ #05
LJZ             MACRO   M1
                JRNE    {*+2+3}
                JP      M1
                MEND
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; LONG JRNE,JRNZ #06                                                    
LJNZ            MACRO   M1                                      
                JREQ    {*+2+3}                                 
                JP      M1                                      
                MEND       
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; LONG JRNE,JRNZ #07                                                    
LJNE            MACRO   M1                                      
                JREQ    {*+2+3}                                 
                JP      M1                                      
                MEND                                                            
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; LONG JRC #08
LJC             MACRO   M1
                JRNC    {*+2+3}
                JP      M1
                MEND      
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; LONG JRNC #09
LJNC            MACRO   M1
                JRC     {*+2+3}
                JP      M1
                MEND                      
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; LONG JRC #10
LJN             MACRO   M1
                JRC    {*+2+3}
                JP      M1
                MEND     
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд

;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;   Peripheral  :  DEFINE MCU Hardware Registers for STM8S103K3
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
	WORDS		; FOLLOWING ADDRESSES ARE 16-BIT LENGTH
	SEGMENT BYTE AT 5000 'Periph'
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;	PORT A AT 0X5000
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.PA_ODR	DS.B 1		; PORT A DATA OUTPUT LATCH REGISTER
.PA_IDR	DS.B 1		; PORT A INPUT PIN VALUE REGISTER
.PA_DDR	DS.B 1		; PORT A DATA DIRECTION REGISTER
.PA_CR1	DS.B 1		; PORT A CONTROL REGISTER 1
.PA_CR2	DS.B 1		; PORT A CONTROL REGISTER 2
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;	PORT B AT 0X5005
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.PB_ODR	DS.B 1		; PORT B DATA OUTPUT LATCH REGISTER
.PB_IDR	DS.B 1		; PORT B INPUT PIN VALUE REGISTER
.PB_DDR	DS.B 1		; PORT B DATA DIRECTION REGISTER
.PB_CR1	DS.B 1		; PORT B CONTROL REGISTER 1
.PB_CR2	DS.B 1		; PORT B CONTROL REGISTER 2
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;	PORT C AT 0X500A
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.PC_ODR	DS.B 1		; PORT C DATA OUTPUT LATCH REGISTER
.PC_IDR	DS.B 1		; PORT C INPUT PIN VALUE REGISTER
.PC_DDR	DS.B 1		; PORT C DATA DIRECTION REGISTER
.PC_CR1	DS.B 1		; PORT C CONTROL REGISTER 1
.PC_CR2	DS.B 1		; PORT C CONTROL REGISTER 2
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; PORT D AT 0X500F
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.PD_ODR	DS.B 1		; PORT D DATA OUTPUT LATCH REGISTER
.PD_IDR	DS.B 1		; PORT D INPUT PIN VALUE REGISTER
.PD_DDR	DS.B 1		; PORT D DATA DIRECTION REGISTER
.PD_CR1	DS.B 1		; PORT D CONTROL REGISTER 1
.PD_CR2	DS.B 1		; PORT D CONTROL REGISTER 2
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; PORT E AT 0X5014
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.PE_ODR	DS.B 1		; PORT E DATA OUTPUT LATCH REGISTER
.PE_IDR	DS.B 1		; PORT E INPUT PIN VALUE REGISTER
.PE_DDR	DS.B 1		; PORT E DATA DIRECTION REGISTER
.PE_CR1	DS.B 1		; PORT E CONTROL REGISTER 1
.PE_CR2	DS.B 1		; PORT E CONTROL REGISTER 2
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; PORT F AT 0X5019
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.PF_ODR	DS.B 1		; PORT F DATA OUTPUT LATCH REGISTER
.PF_IDR	DS.B 1		; PORT F INPUT PIN VALUE REGISTER
.PF_DDR	DS.B 1		; PORT F DATA DIRECTION REGISTER
.PF_CR1	DS.B 1		; PORT F CONTROL REGISTER 1
.PF_CR2	DS.B 1		; PORT F CONTROL REGISTER 2
RESERVED1	DS.B 60		; UNUSED
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; FLASH AT 0X505A
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
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
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; EXTERNAL INTERRUPT CONTROL REGISTER (ITC) AT 0X50A0
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.EXTI_CR1	DS.B 1		; EXTERNAL INTERRUPT CONTROL REGISTER 1
.EXTI_CR2	DS.B 1		; EXTERNAL INTERRUPT CONTROL REGISTER 2
RESERVED5	DS.B 17		; UNUSED
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; RESET (RST) AT 0X50B3
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.RST_SR	DS.B 1		; RESET STATUS REGISTER 1
RESERVED6	DS.B 12		; UNUSED
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; CLOCK CONTROL (CLK) AT 0X50C0
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
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
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; WINDOW WATCHDOG (WWDG) AT 0X50D1
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.WWDG_CR	DS.B 1		; WWDG CONTROL REGISTER
.WWDG_WR	DS.B 1		; WWDR WINDOW REGISTER
RESERVED9	DS.B 13		; UNUSED
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; INDEPENDENT WATCHDOG (IWDG) AT 0X50E0
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.IWDG_KR	DS.B 1		; IWDG KEY REGISTER
.IWDG_PR	DS.B 1		; IWDG PRESCALER REGISTER
.IWDG_RLR	DS.B 1		; IWDG RELOAD REGISTER
RESERVED10	DS.B 13		; UNUSED
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; AUTO WAKE-UP (AWU) AT 0X50F0
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.AWU_CSR	DS.B 1		; AWU CONTROL/STATUS REGISTER
.AWU_APR	DS.B 1		; AWU ASYNCHRONOUS PRESCALER BUFFER REGISTER
.AWU_TBR	DS.B 1		; AWU TIMEBASE SELECTION REGISTER
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; BEEPER (BEEP) AT 0X50F3
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.BEEP_CSR	DS.B 1		; BEEP CONTROL/STATUS REGISTER
RESERVED11	DS.B 268	; UNUSED
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; SERIAL PERIPHERAL INTERFACE (SPI) AT 0X5200
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.SPI_CR1	DS.B 1		; SPI CONTROL REGISTER 1
.SPI_CR2	DS.B 1		; SPI CONTROL REGISTER 2
.SPI_ICR	DS.B 1		; SPI INTERRUPT CONTROL REGISTER
.SPI_SR	DS.B 1		; SPI STATUS REGISTER
.SPI_DR	DS.B 1		; SPI DATA REGISTER
.SPI_CRCPR	DS.B 1		; SPI CRC POLYNOMIAL REGISTER
.SPI_RXCRCR	DS.B 1		; SPI RX CRC REGISTER
.SPI_TXCRCR	DS.B 1		; SPI TX CRC REGISTER
RESERVED12	DS.B 8		; UNUSED
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; I2C BUS INTERFACE (I2C) AT 0X5210
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
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
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; UNIVERSAL SYNCH/ASYNCH RECEIVER TRANSMITTER (UART1) AT 0X5230
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
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
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 16-BIT TIMER 1 (TIM1) AT 0X5250
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
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
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 16-BIT TIMER 2 (TIM2) AT 0X5300
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
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
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 8-BIT  TIMER 4 (TIM4) AT 0X5340
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.TIM4_CR1	DS.B 1		; TIM4 CONTROL REGISTER 1
RESERVED19	DS.B 2		; UNUSED
.TIM4_IER	DS.B 1		; TIM4 INTERRUPT ENABLE REGISTER
.TIM4_SR	DS.B 1		; TIM4 STATUS REGISTER
.TIM4_EGR	DS.B 1		; TIM4 EVENT GENERATION REGISTER
.TIM4_CNTR	DS.B 1		; TIM4 COUNTER
.TIM4_PSCR	DS.B 1		; TIM4 PRESCALER REGISTER
.TIM4_ARR	DS.B 1		; TIM4 AUTO-RELOAD REGISTER
RESERVED20	DS.B 151	; UNUSED
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 10-BIT A/D CONVERTER (ADC1) AT 0X53E0
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
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
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;  GLOBAL CONFIGURATION REGISTER (CFG) AT 0X7F60
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.CFG_GCR	DS.B 1		; CFG GLOBAL CONFIGURATION REGISTER
RESERVED23	DS.B 15		; UNUSED
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; INTERRUPT SOFTWARE PRIORITY REGISTER (ITC) AT 0X7F70
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
.ITC_SPR1	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 1
.ITC_SPR2	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 2
.ITC_SPR3	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 3
.ITC_SPR4	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 4
.ITC_SPR5	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 5
.ITC_SPR6	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 6
.ITC_SPR7	DS.B 1		; INTERRUPT SOFTWARE PRIORITY REGISTER 7

;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;                       DEFINE MEMORY ADDRESS CONSTANT
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; RAM(stack) 1K(512) bytes 0x0000-0x03FF for STM8S103K3
RamPage0	EQU     $0000      ; RAM zero page start address (256 bytes)
RamPage1       EQU     $0100      ; RAM page #1 start address (256 bytes)
RamStack       EQU     $0200      ; RAM stack start address (512 bytes)
RamEnd         	EQU     $03FF      ; End of RAM address
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; EEPROM 640 bytes (10 pages of 64 bytes each) $4000-$427F for STM8S103K3
; 1 page = 1 block = 64 bytes
EEPStart       EQU     $4000  	   ; EEPROM start address (640 bytes)
EE_PageSize   	EQU     64 	   ; EEPROM page size (64 bytes/page)
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
EE_StartAddr1  EQU     EEPStart      			;starting address of page1
EE_StartAddr2  EQU     {EEPStart+EE_PageSize}    	;starting address of page2
EE_BlockSize1  EQU     4          			;size of eeprom block1 (bytes/block) --> included checksum
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
ILLEGAL_OP	EQU	$05	;ANY ILLEGAL OP-CODE READ FROM THE PROGRAM SPACE TRIGGERS A MCU RESET.
				;FROM AN3006 EMC GUIDELINES FOR STM8A MICROCONTROLLER				
;муммммммммммммммммм╦мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм
; Ё Define Constant Ё
; тммммммммммммммммм╬	
;дздддддддддд©ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; Ё STAT_FLG Ё
; юдддддддддды
NORM_FLG	equ	7
;	equ	6
;	equ	5
;	equ	4
;	equ	3
;	equ	2
;	equ	1
;	equ	0
;дздддддддддддддддддд©ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; Ё General Constant Ё
; юдддддддддддддддддды
RED_LED	equ	5
BLU_LED	equ	4

;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
	BYTES			; THE FOLLOWING ADDRESSES ARE 8 BITS LONG
	SEGMENT BYTE AT 00-FF 'RAM0'
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;	DEFINE RAM PAGE 0
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
TM_002US 	DS.B 	1
TM_250US	DS.B	1
TM_500US	DS.B	1
TM_1MS 		DS.B 	1
TM_005MS	DS.B	1
TM_0075MS	DS.B 	1	;ROUTINE BLINK
TM_100MS	DS.B	1
TM_01SEC	DS.B	1
STAT_FLG	DS.B	1
DSP_TIME	DS.B	1
LED 		DS.B 	1
Cnt_Dig 	DS.B 	1	;CURRENT NUMBER ON 7-SEGMENT
Cnt_Dig_Tx 	DS.B 	1 	;TRANSMITTED NUMBER
Disp_Dig	DS.B 	1	;DISPLAY DIG1,2
Chk_Dig 	DS.B 	1	;TOGGLE  DIG1,2
Cur_Val1 	DS.B 	1   ;CURRENT VALUE  SW1
Old_Val1 	DS.B 	1	;OLD 	 VALUE  SW1
Cnt_Bounce1	DS.B 	1	;COUNT 	 BOUNCE SW1
Cur_Val2 	DS.B 	1   ;CURRENT VALUE  SW2
Old_Val2 	DS.B 	1	;OLD 	 VALUE  SW2
Cnt_Bounce2	DS.B 	1	;COUNT 	 BOUNCE SW2
Cur_State1 	DS.B 	1	;CURRENT STATE  SW1
Old_State1 	DS.B 	1	;OLD 	 STATE  SW1
Cur_State2 	DS.B 	1	;CURRENT STATE  SW2
Old_State2 	DS.B 	1	;OLD 	 STATE  SW2
TxCnt	 	DS.B 	1 
TxChkSum 	DS.B 	1
RxCnt 		DS.B 	1
RxTM 		DS.B 	1
RxBuff1 	DS.B 	1
RxBuff2 	DS.B 	1
RxBuff3 	DS.B 	1
;
;
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
	WORDS			; THE FOLLOWING ADDRESSES ARE 16 BITS LONG
	SEGMENT BYTE AT 0100-01FF 'RAM1'
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;	DEFINE RAM PAGE 1
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
DATAARRY        DS.B    64     ;RESERVED DATA ARRAY	
	
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
	WORDS			; THE FOLLOWING ADDRESSES ARE 16 BITS LONG
	SEGMENT BYTE AT 0200-03FF 'STACK'
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;	RESERVE FOR RAM STACK
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
STACK_RAM	DS.B	1	;RAM FOR CHECK STACK OVER FLOW
RAM_EXEC      	DS.B    128        ;reserved RAM execute
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
	WORDS			; THE FOLLOWING ADDRESSES ARE 16 BITS LONG
	SEGMENT BYTE AT 8080-9FFF 'ROM'
;мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм
;		P R O G R A M      S T A R T
;мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм
;мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм
; Ё  Start from Reset  Ё
;мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм
START:	; Reset value
	; Clock control
	; HSI internal 16MHz RC oscillator --> fHSI/8 = 2MHz --> fMASTER
	; fMASTER/1 --> 2MHz/1 = 2MHz --> fCPU
	; Independent watchdog (IWDG)
	; LSI internal 128 kHz RC oscillator --> fLSI
	; fLSI/2 fixed = 64KHz --> 64KHz/4 = 16KHz(62.5us) --> fIWDG (15.9375ms period)
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд	
		;дд Disable Interrupt ддддддддддд
		SIM
		;дд Init Stack Pointer дддддддддд
		ldw	X,#RamEnd
		ldw    	SP,X
		;дд Clr RAM ддддддддддддддддддддд
CLR_ARAM:  ldw    	X,#{256+256+512-1} 	; load RAM size
LP_CLRAM:  mov    	IWDG_KR,#$AA    	; refresh watchdog
		clr     	(RamPage0,X)    	; clear memory on each address
		decw   	X               	; decrease pointer
		jrne    LP_CLRAM        	; jump if not end
		clr     RamPage0        	; clear 1st byte
		;дд Check Stack ддддддддддддддддд
		ld		A,#$AA			; Save known value for check stack overflow
		ld		STACK_RAM,A
		;дд Init All дддддддддддддддддддд
		call	INIT_ALL
		;дд Wait Run дддддддддддддддддддд	
WAIT_STB:      ; wait for stable ( 80ms )
		; fCPU = 16MHz --> 0.0625us/cycle
		ld	A,#80          		; set outer loop for 80ms
WAIT_OLP: 	ldw    	X,#3200         	; set inner loop for 1ms	[2]cy
WAIT_ILP:    	mov     IWDG_KR,#$AA   	; refresh watchdog     		[1]cy
		decw   	X              		;				[2]cy
		jrne    WAIT_ILP       		;                      		[2]cy
		dec     A              		;                      		[1]cy
		jrne    WAIT_OLP       		;	                       	[2]cy
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
		RIM
;мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм
; Ё Start of Main Loop Ё
;мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм
Set_Pin:
		bres 	PB_DDR,#1   ;set PB1 as INPUT
		bres 	PB_DDR,#7   ;set PB7 as INPUT
		bres 	PB_DDR,#0   ;--------------------
		bres 	PB_CR1,#0	;| set Analog INPUT |
		bres 	PB_CR2,#0 	;--------------------
		mov 	Cnt_Dig,#%11111111

MAIN_LP:	
		ld      A,TIM4_CNTR		; check 2 us counter
		sub		A,#125			; for 125 x 2 = 250 us
		jrult	MAIN_LP
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;		[  250 USEC. SERVICE ROUTINE  дд 
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
SVR_250us:	
		ld		TIM4_CNTR,A
		inc		TM_250US		; inc 250 us counter
Start_250us:	;дд250 usдддддддддддддддддддддддд
		mov		IWDG_KR,#$AA		; refresh WATCHDOG
		call	PROC_DSP		; Process Display
End_250us:	;дд250 usдддддддддддддддддддддддд
		ld		A,TM_250US
		sub		A,#2			; for 250 x 2 = 500 us counter
		jruge	SVR_500us
		jp		MAIN_LP

			
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;		[  500 USEC. SERVICE ROUTINE ]
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
SVR_500us:	ld		TM_250US,A
			inc		TM_500US		; inc 500 us counter
			inc 	TM_005MS
			inc 	TM_0075MS
			inc 	TM_100MS
			inc 	TM_1MS

Rou_001MS:
			ld 		A,TM_1MS
			sub 	A,#2
			jreq 	SVR_001MS
			
Rou_005MS:
			ld 		A,TM_005MS
			sub 	A,#10
			jreq 	SVR_5ms

Rou_0075MS:
			ld 		A,TM_0075MS
			sub 	A,#15
			jreq 	SVR_75ms

Rou_100MS:
			ld 		A,TM_100MS
			sub 	A,#200
			jreq 	SVR_100MS
			
Chk_Stak:	;дд Chk Stack ддддддддддддддддддд
			ld		A,STACK_RAM		; Check Stack Overflow
			cp		A,#$AA			; if not correct loop for watch dog reset
			jrne	Chk_Stak	
End_500us:	;дд5 msдддддддддддддддддддддддддд
			jp		MAIN_LP

;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;		[  1 MSEC. SERVICE ROUTINE ]
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд	
SVR_001MS:
			ld 		TM_1MS,A
			call 	Chk_Rx
			jp 		Rou_005MS
			
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;		[  5 MSEC. SERVICE ROUTINE ]
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
SVR_5ms:
			ld 		TM_005MS,A
			;call 	Collect_SW1
			;call 	Collect_SW2
			call 	ADC_START
			jp		Rou_0075MS
			
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;		[  7.5 MSEC. SERVICE ROUTINE ]
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
SVR_75ms:
			ld 		TM_0075MS,A
			call 	Blink_State
			jp		Rou_100MS
			
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;		[  100 MSEC. SERVICE ROUTINE ]
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
SVR_100MS:
			ld 		TM_100MS,A
			;call 	Tx_Start		;######################IF RECEIVE FIRST COMMENT THIS LINE######################
			jp 		Chk_Stak
			
;мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм
;			       Ё  End of Main Loop  Ё
;мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		#################### SWITCH #####################
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд	
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд	
;		### LOOP SWITCH1 EVERY 5 MSEC ###
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд	
Collect_SW1:
			ld 		A,PB_IDR
			srl 	A
			and 	A,#%00000001
			ld 		Cur_Val1,A

Check_Val1:
			ld 		A,Cur_Val1
			cp 		A,Old_Val1
			jreq 	Check_Valid1
			ld 		A,Cur_Val1
			ld  	Old_Val1,A
			ret
			
Check_Valid1:
			inc 	Cnt_Bounce1
			ld 		A,Cnt_Bounce1
			cp 		A,#4
			jruge 	Check_State1
			ret
			
Check_State1:
			ld 		A,Cur_Val1
			ld 		Cur_State1,A
			ld 		A,Cur_State1
			cp 		A,Old_State1
			jrne 	Check_State_Val1
			ret
			
Check_State_Val1:
			ld 		A,Cur_State1
			ld 		Old_State1,A
			ld 		A,Cur_State1
			cp 		A,#1
			jreq 	Inc_Dig
			ret
			
Inc_Dig:
			call 	Increase_Num
			ret
			
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд	
;		### LOOP SWITCH2 EVERY 5 MSEC ###
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд	
Collect_SW2:
			ld 		A,PB_IDR
			srl 	A
			srl 	A
			srl 	A
			srl 	A
			srl 	A
			srl 	A
			srl 	A
			ld 		Cur_Val2,A

Check_Val2:
			ld 		A,Cur_Val2
			cp 		A,Old_Val2
			jreq 	Check_Valid2
			ld 		A,Cur_Val2
			ld  	Old_Val2,A
			ret
			
Check_Valid2:
			inc 	Cnt_Bounce2
			ld 		A,Cnt_Bounce2
			cp 		A,#4
			jruge 	Check_State2
			ret
			
Check_State2:
			ld 		A,Cur_Val2
			ld 		Cur_State2,A
			ld 		A,Cur_State2
			cp 		A,Old_State2
			jrne 	Check_State_Val2
			ret
			
Check_State_Val2:
			ld 		A,Cur_State2
			ld 		Old_State2,A
			ld 		A,Cur_State2
			cp 		A,#1
			jreq 	Dec_Dig
			ret
			
Dec_Dig:
			call 	Decrease_Num
			ret
			
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;		### INCREASE/DECREASE NUMBER ###
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
Increase_Num:
		inc 	Cnt_Dig
		ret
		
Decrease_Num:
		dec 	Cnt_Dig
		ret
		
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		#################### 7-SEGMENT #####################
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд			
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;		### BLINK 7-SEGMENT EVERY 7.5 MSEC ###
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
Blink_State:
			ld 		A,Chk_Dig
			cp 		A,#1
			jreq 	Blink_Dig1
; 			### Blink_Dig2 ###
			inc 	Chk_Dig
			bset 	PD_ODR,#4
			bres 	PD_ODR,#2
			ld 		A,Cnt_Dig
			and 	A,#%00001111
			ld 		Disp_Dig,A
			call 	Disp_Segment
			ret

Blink_Dig1:
			dec 	Chk_Dig
			bset 	PD_ODR,#2
			bres 	PD_ODR,#4
			ld 		A,Cnt_Dig
			srl 	A
			srl 	A
			srl 	A
			srl 	A
			ld 		Disp_Dig,A
			call 	Disp_Segment
			ret

;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		### DISPLAY 7-SEGMENT ###
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
Disp_Segment:	
			ld 		A,Disp_Dig
			cp 		A,#$00
			jreq 	Disp_Number0
			
			cp 		A,#$01
			jreq 	Disp_Number1
			
			cp 		A,#$02
			jreq 	Disp_Number2
			
			cp 		A,#$03
			jreq 	Disp_Number3
			
			cp 		A,#$04
			jreq 	Disp_Number4
			
			cp 		A,#$05
			jreq 	Disp_Number5
			
			cp 		A,#$06
			jreq 	Disp_Number6
			
			cp 		A,#$07
			jreq 	Disp_Number7
			
			cp 		A,#$08
			jreq 	Disp_Number8
			
			cp 		A,#$09
			jreq 	Disp_Number9
			
			cp 		A,#$0A
			jreq 	Disp_NumberA
			
			cp 		A,#$0B
			jreq 	Disp_NumberB
			
			cp 		A,#$0C
			jreq 	Disp_NumberC
			
			cp 		A,#$0D
			jreq 	Disp_NumberD
			
			cp 		A,#$0E
			jreq 	Disp_NumberE
			
			cp 		A,#$0F
			jreq 	Disp_NumberF

Disp_Number0:
			call 	ZeroTh
			ret
Disp_Number1:
			call 	OneSt
			ret	
Disp_Number2:
			call 	TwoNd
			ret				
Disp_Number3:
			call 	ThreeTh
			ret	
Disp_Number4:
			call 	FourTh
			ret	
Disp_Number5:
			call 	FiveTh
			ret	
Disp_Number6:
			call 	SixTh
			ret
Disp_Number7:
			call 	SevenTh
			ret	
Disp_Number8:
			call 	EightTh
			ret			
Disp_Number9:
			call 	NineTh
			ret
Disp_NumberA:
			call 	ATh
			ret	
Disp_NumberB:
			call 	BTh
			ret	
Disp_NumberC:
			call 	CTh
			ret	
Disp_NumberD:
			call 	DTh
			ret
Disp_NumberE:
			call 	ETh
			ret
Disp_NumberF:
			call 	FTh
			ret				
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		### NUMBER OF 7-SEGMENT ###
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
ZeroTh: 	
		bres PC_ODR,#6	; A
		bres PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bres PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bset PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
OneSt:		
		bset PC_ODR,#6	; A
		bres PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bset PE_ODR,#5	; D
		bset PC_ODR,#1	; E
		bset PC_ODR,#7 	; F
		bset PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
TwoNd:		
		bres PC_ODR,#6	; A
		bres PC_ODR,#3	; B
		bset PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bres PC_ODR,#1	; E
		bset PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
ThreeTh: 	
		bres PC_ODR,#6	; A
		bres PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bset PC_ODR,#1	; E
		bset PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
FourTh: 	
		bset PC_ODR,#6	; A
		bres PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bset PE_ODR,#5	; D
		bset PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
FiveTh: 	
		bres PC_ODR,#6	; A
		bset PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bset PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
SixTh: 	
		bres PC_ODR,#6	; A
		bset PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bres PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
SevenTh:
		bres PC_ODR,#6	; A
		bres PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bset PE_ODR,#5	; D
		bset PC_ODR,#1	; E
		bset PC_ODR,#7 	; F
		bset PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
EightTh:
		bres PC_ODR,#6	; A
		bres PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bres PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
NineTh:
		bres PC_ODR,#6	; A
		bres PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bset PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
ATh:
		bres PC_ODR,#6	; A
		bres PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bset PE_ODR,#5	; D
		bres PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
BTh:
		bset PC_ODR,#6	; A
		bset PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bres PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
CTh:
		bres PC_ODR,#6	; A
		bset PC_ODR,#3	; B
		bset PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bres PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bset PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
DTh:
		bset PC_ODR,#6	; A
		bres PC_ODR,#3	; B
		bres PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bres PC_ODR,#1	; E
		bset PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
ETh:
		bres PC_ODR,#6	; A
		bset PC_ODR,#3	; B
		bset PC_ODR,#2	; C
		bres PE_ODR,#5	; D
		bres PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
FTh:
		bres PC_ODR,#6	; A
		bset PC_ODR,#3	; B
		bset PC_ODR,#2	; C
		bset PE_ODR,#5	; D
		bres PC_ODR,#1	; E
		bres PC_ODR,#7 	; F
		bres PC_ODR,#4 	; G
		bset PC_ODR,#5 	; DP
		ret
		
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		#################### ANALOG/DIGITAL CONVERSION #####################
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
ADC_START:
			mov 	ADC_CR1,#%00000001 ; x SPSEL1 SPSEL2 SPSEL3 x x CONT ADON
			mov 	ADC_CR2,#%00110011 ; x EXTTRIG EXTSEL(RESERVED) EXTSEL(RESERVED) ALIGN x SCAN x
			mov 	ADC_CR3,#%00000000 ; DBUF OVR x x x x x x
			bset 	ADC_TDRL,#0 ; CONFIG DISABLE SCHMITT TRIGGER
		
ADC_WAIT: 	;WAIT 28 CLK (TSTAB+TCONV)
			nop    ; 1clk
			nop    ; 2clk
			nop    ; 3clk
			nop    ; 4clk
			nop    ; 5clk
			nop    ; 6clk
			nop    ; 7clk
			nop    ; 8clk
			nop    ; 9clk
			nop    ; 10clk
			nop    ; 11clk
			nop    ; 12clk
			nop    ; 13clk
			nop    ; 14clk
			nop    ; 15clk
			nop    ; 16clk
			nop    ; 17clk
			nop    ; 18clk
			nop    ; 19clk
			nop    ; 20clk
			nop    ; 21clk
			nop    ; 22clk
			nop    ; 23clk
			nop    ; 24clk
			nop    ; 25clk
			nop    ; 26clk
			nop    ; 27clk
			nop    ; 28clk
		
ADC_CF:	 	;COLLECT EOC FLAG
			ld 		A,ADC_CSR
			and 	A,#%10000000
			cp 		A,#%10000000
			jreq	ADC_DISP
			ret
		
ADC_DISP: 	;DISPLAY DATA
			ld 		A,ADC_DRH
			ld 		Cnt_Dig_Tx,A
			ret

;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		#################### TX #####################
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		### START TX MODE ###
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд		
Tx_Start:
		mov 	UART1_CR2,#$08 	;CHANGE MODE TO TX
		mov 	UART1_DR,#$55
		clr 	TxCnt			;CLEAR CNT
		mov 	UART1_CR2,#$88 	;ENABLE TXE INTERRUPT
		ret
		
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		### TX INTERUPT SERVICE ROUTINE ###
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
Tx_ISR:	
		ld 		A,TxCnt
		cp 		A,#0
		jreq 	TxDB
		cp 		A,#1
		jreq 	TxCS
		;CHANGE MODE
		bres 	UART1_SR,#6 			;CLEAR TC 
		mov 	UART1_CR2,#%00100100   	;CHANGE MODE TO RX AND ENABLE RIEN INTERRUPT
		iret
		
TxDB:	;DATA BYTE
		inc 	TxCnt
		ld 		A,Cnt_Dig_Tx
		ld 		UART1_DR,A
		add 	A,#$55
		xor 	A,#$FF
		ld 		TxChkSum,A
		iret
		
TxCS:   ; CHECK SUM
		inc 	TxCnt
		ld 		A,TxChkSum
		ld 		UART1_DR,A
		mov 	UART1_CR2,#%01001000 	;ENABLE TC INTERRUPT
		iret
		
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		#################### RX #####################
;ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд	
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		### CHECK RECEIVE ENDED ###
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
Chk_Rx:
			ld 		A,RxTM
			cp 		A,#0
			jrne 	Dec_RxTM
			ret
			
Dec_RxTM:	;DECREMENT TIMER
			dec 	RxTM
			ld 		A,RxTM
			cp 		A,#0
			jreq  	RxCH
			ret
			
RxCH: 		;CHECK HEADER
			ld 		A,RxBuff1
			cp 		A,#$55
			jreq 	RxCS
			call 	RxCB
			ret
			
RxCS:		;CHECK SUM
			ld 		A,RxBuff3
			add 	A,RxBuff1
			add 	A,RxBuff2
			cp 		A,#$FF
			jreq 	RxLD
			call 	RxCB
			ret
			
RxLD:		;LOAD DATA
			ld 		A,RxBuff2
			ld 		Cnt_Dig,A
			call 	RxCB
			call 	Tx_Start
			ret
			
RxCB: 		;CLEAR BUFFER
			mov 	RxCnt,#0
			mov 	RxBuff1,#0
			mov 	RxBuff2,#0
			mov 	RxBuff3,#0
			ret
			
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
; 		### RX INTERUPT SERVICE ROUTINE ###
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
Rx_ISR:
		ld 		A,#4
		ld 		RxTM,A
		ld 		A,RxCnt
		cp 		A,#0
		jreq 	RxFB
		cp 		A,#1
		jreq 	RxSB
		cp 		A,#2
		jreq 	RxTB
		iret

RxFB:	;FIRST BYTE (HEADER)
		inc 	RxCnt
		ld 		A,UART1_DR
		ld 		RxBuff1,A
		iret
		
RxSB:	;SECOND BYTE (DATA)
		inc 	RxCnt
		ld 		A,UART1_DR
		ld 		RxBuff2,A
		iret
		
RxTB:	;THIRD BYTE (CHECK SUM)
		ld 		A,UART1_DR
		ld 		RxBuff3,A
		iret


;ддздддддддддд©дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд	
;  Ё INIT ALL Ё
;  юдддддддддды
INIT_ALL:	
		;дд GLOBAL CONFIGURATION дддддддд
		bset	CFG_GCR,#1		; SWD 	-> 	0: SWIM MODE ENABLE	
						;		1: SWIM MODE DISABLE			
		bres	CFG_GCR,#0		; AL	-> 	0: MAIN ATIVATION LEVEL
						;		1: INTERRUPT-ONLY ATIVATION LEVEL
		;дд INITAIL WATCH DOG ддддддддддд
		mov	IWDG_KR,#$CC		; START WATCHDOG !! MUST START WATCH DOG BEFORE ACCESS
		mov	IWDG_KR,#$55		; ACCESS KEY TO CONFIG IWDG_PR,RLR 
		mov	IWDG_PR,#%00000100	; DIVIDER/64    ->64/64= 1 KHZ = 1 MS
		mov	IWDG_RLR,#250		; COUNT FOR 250	->1*250= 250 MS
		mov	IWDG_KR,#$AA		; REFRESH WATCHDOG		
		;дд CONFIG CLOCK дддддддддддддддд
		;mov	CLK_SWCR,#$02		; Enable clock switch execution 
		;mov	CLK_SWR,#$B4		; HSE selected as master clock source
		;mov	CLK_ICKR,#$00		; High speed internal RC off 000000000
		mov	CLK_CKDIVR,#00		; Fcpu = Fmaster
;WAIT_CLK:	;ld	A,CLK_CMSR
		;cp	A,#$B4			; wait for clock switched
		;jrne	WAIT_CLK
		;bres	CLK_SWCR,#1		; Disable clock switch execution
		;дд Config UART1 дддддддддддддддд	
		mov 	UART1_CR1,#%00000000		; 9 data(MSB is Parity bit), UART enable,even Parity
		mov 	UART1_CR3,#$00		; 1 stopbit, Disable SLK
		mov 	UART1_BRR2,#$01
		mov 	UART1_BRR1,#$34		; 19200 bps / Fmaster = 16 MHz
		mov 	UART1_CR2,#%00100100		; OFF TIEN, ON RIEN, OFF TEN, ON REN 		INITIAL 00100100 NORMAL MODE 00001000
		;ld	A,UART1_SR
		;ld	UART1_DR,A		; Clr TXE bit
		;дд ENABLE CLOCK дддддддддддддддд
		mov	CLK_PCKENR1,#%10011000	;ENABLE CLOCK FOR TIMER 1,4	
		mov	CLK_PCKENR2,#%00001000		
		;дд External Interrupt дддддддддд
		mov	EXTI_CR2,#$00		;PD7 - falling edge external interrupt
		;дд TIMER 1 ддддддддддддддддддддд
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
		;дд TIMER 2 ддддддддддддддддддддд
		;mov	TIM2_CR1,#{1 SHL 2}	; UPDATE ARR ON THE FLY,INTERRUPT GENENRATE WHEN OVERFLOW	  	
		;mov	TIM2_IER,#{1 SHL 0}	; ENABLE UPDATE INTERUPT
		;mov	TIM2_CCER1,#00		; CAPTURE IS DISABLED
		;mov	TIM2_CCER2,#00					
		;mov	TIM2_PSCR,#$00		; PRESCALER = 16, STEP = 16MHz = 1/16 us
		;mov	TIM2_ARRH,#{HIGH 65000}; AUTO RELOAD EVERY 65000 US
		;mov	TIM2_ARRL,#{LOW 65000}			
		;bres	TIM2_CR1,#0		; OFF TIMER2
		;дд TIMER 4 ддддддддддддддддддддд
		mov	TIM4_PSCR,#5		; PRESCALER = 16, STEP = 16/(2^5) = 16/32 = 0.5 MHz = 2 us
		bset	TIM4_EGR,#0		; Set UG bit for Generate Update Event for update prescaler value
		mov	TIM4_ARR,#$FF		; AUTO RELOAD 
		mov    	TIM4_CR1,#%00000100	; UPDATE ARR ON THE FLY,INTERRUPT GENENRATE WHEN OVERFLOW  START TIMER 4	
		mov	TIM4_IER,#$00		; DISABLE UPDATE INTERUPT
		bset	TIM4_CR1,#0		; START TIMER 4			
		;дд Assign RAM дддддддддддддддддд			 	
		bset 	STAT_FLG,#NORM_FLG

		;дддддддддддддддддддддддддддддддд
INIT_PORT:	;дд INIT PORT A ддддддддддддддддд
		mov	PA_ODR,#%00000000	;
		mov	PA_DDR,#%11111111	; PA3-1 Output push-pull Torch
		mov	PA_CR1,#%11111111	;
		mov	PA_CR2,#%00000000	; NO INTERRUPT		
		;дд INIT PORT B ддддддддддддддддд
		mov	PB_ODR,#%00000000	; 
		mov	PB_DDR,#%11111111	; PB1,PB0 input A/D
		mov	PB_CR1,#%11111111	; 
		mov	PB_CR2,#%00000000	; 	
		;дд INIT PORT C ддддддддддддддддд
		mov	PC_ODR,#%00000000	 
		mov	PC_DDR,#%11111111	; PC1-7 Output push-pull                   
		mov	PC_CR1,#%11111111	; 
		mov	PC_CR2,#%00000000	; NO INTERRUPT                        	
		;дд INIT PORT D ддддддддддддддддд                         
		mov	PD_ODR,#%00100000    	;© PD3-0 Output push-pull                                                              
		mov	PD_DDR,#%00111111  	;Ё PD4   Output IR Transmit                                                                  
		mov	PD_CR1,#%01111111   	;Ё PD6,5 UART / PD7 Input with Interrupt for IR                                                                   
		mov	PD_CR2,#%00000000	;ы INTERRUPT for PD7	                                             
		;дд INIT PORT E ддддддддддддддддд
		mov	PE_ODR,#%11111111                          
		mov	PE_DDR,#%11111111   	; PE5 Output push-pull                      
		mov	PE_CR1,#%11111111   	;                                                                    
		mov	PE_CR2,#%00000000	; NO INTERRUPT	                                               
		;дд INIT PORT F ддддддддддддддддд
		mov	PF_ODR,#%00000000                          
		mov	PF_DDR,#%00000000     	; PF4 input for option                   
		mov	PF_CR1,#%11111111                                                                      
		mov	PF_CR2,#%00000000	; NO INTERRUPT	    
		
		ret
;дддзддддддддддддд©ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;   Ё Process DSP Ё
;   юддддддддддддды
PROC_DSP:	
		btjf	STAT_FLG,#NORM_FLG,END_PDSP
		ld	A,DSP_TIME
		cp	A,#20
		jrugt	OFF_LED
		bres 	PB_ODR,#BLU_LED
		bset 	PB_ODR,#RED_LED
		jp	END_PDSP
OFF_LED:	
		bset 	PB_ODR,#BLU_LED
		bres 	PB_ODR,#RED_LED
END_PDSP:	ret
;дддздддддддддддддд©ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;   Ё No Operation Ё
;   юдддддддддддддды
nop8:		nop
nop7:		nop
nop6:		nop
nop5:		nop
nop4:		nop
nop3:		nop
nop2:		nop
nop1:		nop
		ret
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;				[  Interrupt Service Routine  дд
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;дддзддддддддддддддд©ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;   Ё No Handle ISR Ё
;   юддддддддддддддды0
NONHANDLEDINTERRUPT:
		iret
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
        WORDS       		; FOLLOWING ADDRESSES ARE 16-BIT LENGTH
        SEGMENT BYTE AT 9FFF-9FFF 'RSTINST'    ;1 BYTES
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
RST_INST:       DC.B    ILLEGAL_OP      ;RESET INSTRUCTION
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
;				[  Interrupt Vector Table  ]
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
	WORDS			; THE FOLLOWING ADDRESSES ARE 16 BITS LONG
	SEGMENT BYTE AT 8000-807F 'VECTIT'
;дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд
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
	DC.L {$82000000+Tx_ISR}					; IRQ17   UART1 TX COMPLETE     				0X00 804C                            
	DC.L {$82000000+Rx_ISR}					; IRQ18   UART1 RECEIVE REGISTER DATA FULL 			0X00 8050             
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
