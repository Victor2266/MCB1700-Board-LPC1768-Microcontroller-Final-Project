#line 1 "GLCD_SPI_LPC1700.c"
 
 
 
 
 
 
 
 
 
 


#line 1 ".\\USBAudio\\lpc17xx.h"























 









 



 

 
typedef enum IRQn
{
 
  NonMaskableInt_IRQn           = -14,       
  MemoryManagement_IRQn         = -12,       
  BusFault_IRQn                 = -11,       
  UsageFault_IRQn               = -10,       
  SVCall_IRQn                   = -5,        
  DebugMonitor_IRQn             = -4,        
  PendSV_IRQn                   = -2,        
  SysTick_IRQn                  = -1,        

 
  WDT_IRQn                      = 0,         
  TIMER0_IRQn                   = 1,         
  TIMER1_IRQn                   = 2,         
  TIMER2_IRQn                   = 3,         
  TIMER3_IRQn                   = 4,         
  UART0_IRQn                    = 5,         
  UART1_IRQn                    = 6,         
  UART2_IRQn                    = 7,         
  UART3_IRQn                    = 8,         
  PWM1_IRQn                     = 9,         
  I2C0_IRQn                     = 10,        
  I2C1_IRQn                     = 11,        
  I2C2_IRQn                     = 12,        
  SPI_IRQn                      = 13,        
  SSP0_IRQn                     = 14,        
  SSP1_IRQn                     = 15,        
  PLL0_IRQn                     = 16,        
  RTC_IRQn                      = 17,        
  EINT0_IRQn                    = 18,        
  EINT1_IRQn                    = 19,        
  EINT2_IRQn                    = 20,        
  EINT3_IRQn                    = 21,        
  ADC_IRQn                      = 22,        
  BOD_IRQn                      = 23,        
  USB_IRQn                      = 24,        
  CAN_IRQn                      = 25,        
  DMA_IRQn                      = 26,        
  I2S_IRQn                      = 27,        
  ENET_IRQn                     = 28,        
  RIT_IRQn                      = 29,        
  MCPWM_IRQn                    = 30,        
  QEI_IRQn                      = 31,        
  PLL1_IRQn                     = 32,        
  USBActivity_IRQn              = 33,        
  CANActivity_IRQn              = 34         
} IRQn_Type;






 

 





#line 1 ".\\USBAudio\\core_cm3.h"



















 




















































 

 
 
 
 
 
 
 
 


#line 1 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 86 ".\\USBAudio\\core_cm3.h"

















 

#line 112 ".\\USBAudio\\core_cm3.h"





 


 





 






 
typedef struct
{
  volatile uint32_t ISER[8];                       
       uint32_t RESERVED0[24];
  volatile uint32_t ICER[8];                       
       uint32_t RSERVED1[24];
  volatile uint32_t ISPR[8];                       
       uint32_t RESERVED2[24];
  volatile uint32_t ICPR[8];                       
       uint32_t RESERVED3[24];
  volatile uint32_t IABR[8];                       
       uint32_t RESERVED4[56];
  volatile uint8_t  IP[240];                       
       uint32_t RESERVED5[644];
  volatile  uint32_t STIR;                          
}  NVIC_Type;


 
typedef struct
{
  volatile const  uint32_t CPUID;                         
  volatile uint32_t ICSR;                          
  volatile uint32_t VTOR;                          
  volatile uint32_t AIRCR;                         
  volatile uint32_t SCR;                           
  volatile uint32_t CCR;                           
  volatile uint8_t  SHP[12];                       
  volatile uint32_t SHCSR;                         
  volatile uint32_t CFSR;                          
  volatile uint32_t HFSR;                          
  volatile uint32_t DFSR;                          
  volatile uint32_t MMFAR;                         
  volatile uint32_t BFAR;                          
  volatile uint32_t AFSR;                          
  volatile const  uint32_t PFR[2];                        
  volatile const  uint32_t DFR;                           
  volatile const  uint32_t ADR;                           
  volatile const  uint32_t MMFR[4];                       
  volatile const  uint32_t ISAR[5];                       
} SCB_Type;


 
typedef struct
{
  volatile uint32_t CTRL;                          
  volatile uint32_t LOAD;                          
  volatile uint32_t VAL;                           
  volatile const  uint32_t CALIB;                         
} SysTick_Type;


 
typedef struct
{
  volatile  union  
  {
    volatile  uint8_t    u8;                        
    volatile  uint16_t   u16;                       
    volatile  uint32_t   u32;                       
  }  PORT [32];                                
       uint32_t RESERVED0[864];
  volatile uint32_t TER;                           
       uint32_t RESERVED1[15];
  volatile uint32_t TPR;                           
       uint32_t RESERVED2[15];
  volatile uint32_t TCR;                           
       uint32_t RESERVED3[29];
  volatile uint32_t IWR;                           
  volatile uint32_t IRR;                           
  volatile uint32_t IMCR;                          
       uint32_t RESERVED4[43];
  volatile uint32_t LAR;                           
  volatile uint32_t LSR;                           
       uint32_t RESERVED5[6];
  volatile const  uint32_t PID4;                          
  volatile const  uint32_t PID5;
  volatile const  uint32_t PID6;
  volatile const  uint32_t PID7;
  volatile const  uint32_t PID0;
  volatile const  uint32_t PID1;
  volatile const  uint32_t PID2;
  volatile const  uint32_t PID3;
  volatile const  uint32_t CID0;
  volatile const  uint32_t CID1;
  volatile const  uint32_t CID2;
  volatile const  uint32_t CID3;
} ITM_Type;


 
typedef struct
{
       uint32_t RESERVED0;
  volatile const  uint32_t ICTR;                          



       uint32_t RESERVED1;

} InterruptType_Type;


 

typedef struct
{
  volatile const  uint32_t TYPE;                          
  volatile uint32_t CTRL;                          
  volatile uint32_t RNR;                           
  volatile uint32_t RBAR;                          
  volatile uint32_t RASR;                          
  volatile uint32_t RBAR_A1;                       
  volatile uint32_t RASR_A1;                       
  volatile uint32_t RBAR_A2;                       
  volatile uint32_t RASR_A2;                       
  volatile uint32_t RBAR_A3;                       
  volatile uint32_t RASR_A3;                       
} MPU_Type;



 
typedef struct
{
  volatile uint32_t DHCSR;                         
  volatile  uint32_t DCRSR;                         
  volatile uint32_t DCRDR;                         
  volatile uint32_t DEMCR;                         
} CoreDebug_Type;


 
#line 274 ".\\USBAudio\\core_cm3.h"

#line 281 ".\\USBAudio\\core_cm3.h"










 






#line 311 ".\\USBAudio\\core_cm3.h"


 


 




#line 336 ".\\USBAudio\\core_cm3.h"


 
 
 
 









 
extern uint32_t __get_PSP(void);









 
extern void __set_PSP(uint32_t topOfProcStack);









 
extern uint32_t __get_MSP(void);









 
extern void __set_MSP(uint32_t topOfMainStack);








 
extern uint32_t __REV16(uint16_t value);








 
extern int32_t __REVSH(int16_t value);


#line 502 ".\\USBAudio\\core_cm3.h"









 









 
static __inline uint32_t  __get_BASEPRI(void)
{
  register uint32_t __regBasePri         __asm("basepri");
  return(__regBasePri);
}








 
static __inline void __set_BASEPRI(uint32_t basePri)
{
  register uint32_t __regBasePri         __asm("basepri");
  __regBasePri = (basePri & 0x1ff);
}









 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}








 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}








 
static __inline uint32_t __get_FAULTMASK(void)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  return(__regFaultMask);
}








 
static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  __regFaultMask = (faultMask & 1);
}








 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}








 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}





#line 1044 ".\\USBAudio\\core_cm3.h"



 













 
static __inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);                          
  
  reg_value  = ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR;                                                     
  reg_value &= ~((0xFFFFU << 16) | (0x0F << 8));                               
  reg_value  = ((reg_value | (0x5FA << 16) | (PriorityGroupTmp << 8)));   
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR = reg_value;
}









 
static __inline uint32_t NVIC_GetPriorityGrouping(void)
{
  return ((((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR >> 8) & 0x07);                                           
}









 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}









 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
  return((uint32_t)((((NVIC_Type *) ((0xE000E000) + 0x0100))->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}













 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - 5)) & 0xff); }  
  else {
    ((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[(uint32_t)(IRQn)] = ((priority << (8 - 5)) & 0xff);    }         
}















 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - 5)));  }  
  else {
    return((uint32_t)(((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[(uint32_t)(IRQn)]           >> (8 - 5)));  }  
}
















 
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);                          
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 5) ? 5 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 5) < 7) ? 0 : PriorityGroupTmp - 7 + 5;
 
  return (
           ((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
           ((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
         );
}

















 
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);                          
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 5) ? 5 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 5) < 7) ? 0 : PriorityGroupTmp - 7 + 5;
  
  *pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
  *pSubPriority     = (Priority                   ) & ((1 << (SubPriorityBits    )) - 1);
}



 



 














 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{ 
  if (ticks > ((1<<24) -1))  return (1);                                              

  ((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD  =  (ticks & ((1<<24) -1)) - 1;                                       
  NVIC_SetPriority (SysTick_IRQn, (1<<5) - 1);                             
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->VAL   =  (0x00);                                                               
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL = (1 << 2) | (1<<0) | (1<<1);  
  return (0);                                                                             
}







 








 
static __inline void NVIC_SystemReset(void)
{
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR  = ((0x5FA << 16) | (((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR & (0x700)) | (1<<2));  
  __dsb(0);                                                                                            
  while(1);                                                                             
}


 











 
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (ch == '\n') ITM_SendChar('\r');
  
  if ((((CoreDebug_Type *) (0xE000EDF0))->DEMCR & (1 << 24))  &&
      (((ITM_Type *) (0xE0000000))->TCR & 1)                  &&
      (((ITM_Type *) (0xE0000000))->TER & (1UL << 0))  ) 
  {
    while (((ITM_Type *) (0xE0000000))->PORT[0].u32 == 0);
    ((ITM_Type *) (0xE0000000))->PORT[0].u8 = (uint8_t) ch;
  }  
  return (ch);
}







 
#line 105 ".\\USBAudio\\lpc17xx.h"
#line 1 ".\\USBAudio\\system_LPC17xx.h"
 





















 









#line 34 ".\\USBAudio\\system_LPC17xx.h"



 

extern uint32_t SystemFrequency;      










 
extern void SystemInit (void);









 
extern void SystemCoreClockUpdate (void);







 

#line 106 ".\\USBAudio\\lpc17xx.h"


 
 
 


#pragma anon_unions


 
 
typedef struct
{
  volatile uint32_t FLASHCFG;                    
       uint32_t RESERVED0[31];
  volatile uint32_t PLL0CON;                     
  volatile uint32_t PLL0CFG;                     
  volatile const  uint32_t PLL0STAT;                    
  volatile  uint32_t PLL0FEED;                    
       uint32_t RESERVED1[4];
  volatile uint32_t PLL1CON;                     
  volatile uint32_t PLL1CFG;                     
  volatile const  uint32_t PLL1STAT;                    
  volatile  uint32_t PLL1FEED;                    
       uint32_t RESERVED2[4];
  volatile uint32_t PCON;                        
  volatile uint32_t PCONP;                       
       uint32_t RESERVED3[15];
  volatile uint32_t CCLKCFG;                     
  volatile uint32_t USBCLKCFG;                   
  volatile uint32_t CLKSRCSEL;                   
  volatile uint32_t CANSLEEPCLR;                 
  volatile uint32_t CANWAKEFLAGS;                
       uint32_t RESERVED4[10];
  volatile uint32_t EXTINT;                      
       uint32_t RESERVED5[1];
  volatile uint32_t EXTMODE;                     
  volatile uint32_t EXTPOLAR;                    
       uint32_t RESERVED6[12];
  volatile uint32_t RSID;                        
       uint32_t RESERVED7[7];
  volatile uint32_t SCS;                         
  volatile uint32_t IRCTRIM;                 
  volatile uint32_t PCLKSEL0;                    
  volatile uint32_t PCLKSEL1;                    
       uint32_t RESERVED8[4];
  volatile uint32_t USBIntSt;                    
  volatile uint32_t DMAREQSEL;                   
  volatile uint32_t CLKOUTCFG;                   

 } LPC_SC_TypeDef;

 
 
typedef struct
{
  volatile uint32_t PINSEL0;				  
  volatile uint32_t PINSEL1;				  
  volatile uint32_t PINSEL2;				  
  volatile uint32_t PINSEL3;				  
  volatile uint32_t PINSEL4;				  
  volatile uint32_t PINSEL5;				  
  volatile uint32_t PINSEL6;				  
  volatile uint32_t PINSEL7;				  
  volatile uint32_t PINSEL8;				  
  volatile uint32_t PINSEL9;				  
  volatile uint32_t PINSEL10;				  
       uint32_t RESERVED0[5];
  volatile uint32_t PINMODE0;				  
  volatile uint32_t PINMODE1;				  
  volatile uint32_t PINMODE2;				  
  volatile uint32_t PINMODE3;				  
  volatile uint32_t PINMODE4;				  
  volatile uint32_t PINMODE5;				  
  volatile uint32_t PINMODE6;				  
  volatile uint32_t PINMODE7;				  
  volatile uint32_t PINMODE8;				  
  volatile uint32_t PINMODE9;				  
  volatile uint32_t PINMODE_OD0;			  
  volatile uint32_t PINMODE_OD1;			  
  volatile uint32_t PINMODE_OD2;			  
  volatile uint32_t PINMODE_OD3;			  
  volatile uint32_t PINMODE_OD4;			  
  volatile uint32_t I2CPADCFG;				  
} LPC_PINCON_TypeDef;

 
 
typedef struct
{
  union {
    volatile uint32_t FIODIR;				  
    struct {
      volatile uint16_t FIODIRL;
      volatile uint16_t FIODIRH;
    };
    struct {
      volatile uint8_t  FIODIR0;
      volatile uint8_t  FIODIR1;
      volatile uint8_t  FIODIR2;
      volatile uint8_t  FIODIR3;
    };
  };
  uint32_t RESERVED0[3];
  union {
    volatile uint32_t FIOMASK;				  
    struct {
      volatile uint16_t FIOMASKL;
      volatile uint16_t FIOMASKH;
    };
    struct {
      volatile uint8_t  FIOMASK0;
      volatile uint8_t  FIOMASK1;
      volatile uint8_t  FIOMASK2;
      volatile uint8_t  FIOMASK3;
    };
  };
  union {
    volatile uint32_t FIOPIN;				  
    struct {
      volatile uint16_t FIOPINL;
      volatile uint16_t FIOPINH;
    };
    struct {
      volatile uint8_t  FIOPIN0;
      volatile uint8_t  FIOPIN1;
      volatile uint8_t  FIOPIN2;
      volatile uint8_t  FIOPIN3;
    };
  };
  union {
    volatile uint32_t FIOSET;				  
    struct {
      volatile uint16_t FIOSETL;
      volatile uint16_t FIOSETH;
    };
    struct {
      volatile uint8_t  FIOSET0;
      volatile uint8_t  FIOSET1;
      volatile uint8_t  FIOSET2;
      volatile uint8_t  FIOSET3;
    };
  };
  union {
    volatile  uint32_t FIOCLR;				  
    struct {
      volatile  uint16_t FIOCLRL;
      volatile  uint16_t FIOCLRH;
    };
    struct {
      volatile  uint8_t  FIOCLR0;
      volatile  uint8_t  FIOCLR1;
      volatile  uint8_t  FIOCLR2;
      volatile  uint8_t  FIOCLR3;
    };
  };
} LPC_GPIO_TypeDef;

 
typedef struct
{
  volatile const  uint32_t IntStatus;                   
  volatile const  uint32_t IO0IntStatR;                 
  volatile const  uint32_t IO0IntStatF;                 
  volatile  uint32_t IO0IntClr;                   
  volatile uint32_t IO0IntEnR;                   
  volatile uint32_t IO0IntEnF;                   
       uint32_t RESERVED0[3];
  volatile const  uint32_t IO2IntStatR;                 
  volatile const  uint32_t IO2IntStatF;                 
  volatile  uint32_t IO2IntClr;                   
  volatile uint32_t IO2IntEnR;                   
  volatile uint32_t IO2IntEnF;                   
} LPC_GPIOINT_TypeDef;

 
 
typedef struct
{
  volatile uint32_t IR;                          
  volatile uint32_t TCR;                         
  volatile uint32_t TC;                          
  volatile uint32_t PR;                          
  volatile uint32_t PC;                          
  volatile uint32_t MCR;                         
  volatile uint32_t MR0;                         
  volatile uint32_t MR1;                         
  volatile uint32_t MR2;                         
  volatile uint32_t MR3;                         
  volatile uint32_t CCR;                         
  volatile const  uint32_t CR0;                         
  volatile const  uint32_t CR1;                         
       uint32_t RESERVED0[2];
  volatile uint32_t EMR;                         
       uint32_t RESERVED1[12];
  volatile uint32_t CTCR;                        
} LPC_TIM_TypeDef;

 
 
typedef struct
{
  volatile uint32_t IR;                          
  volatile uint32_t TCR;                         
  volatile uint32_t TC;                          
  volatile uint32_t PR;                          
  volatile uint32_t PC;                          
  volatile uint32_t MCR;                         
  volatile uint32_t MR0;                         
  volatile uint32_t MR1;                         
  volatile uint32_t MR2;                         
  volatile uint32_t MR3;                         
  volatile uint32_t CCR;                         
  volatile const  uint32_t CR0;                         
  volatile const  uint32_t CR1;                         
  volatile const  uint32_t CR2;                         
  volatile const  uint32_t CR3;                         
       uint32_t RESERVED0;
  volatile uint32_t MR4;                         
  volatile uint32_t MR5;                         
  volatile uint32_t MR6;                         
  volatile uint32_t PCR;                         
  volatile uint32_t LER;                         
       uint32_t RESERVED1[7];
  volatile uint32_t CTCR;                        
} LPC_PWM_TypeDef;

 
 
typedef struct
{
  union {
  volatile const  uint32_t RBR;                    
  volatile  uint32_t THR;                    
  volatile uint32_t DLL;                    
  };
  union {
  volatile uint32_t DLM;                    
  volatile uint32_t IER;                    
  };
  union {
  volatile const  uint32_t IIR;                    
  volatile  uint32_t FCR;                    
  };
  volatile uint32_t LCR;                    
       uint32_t RESERVED0;
  volatile const  uint32_t LSR;                    
       uint32_t RESERVED1;
  volatile uint32_t SCR;                    
  volatile uint32_t ACR;                    
  volatile uint32_t ICR;                    
  volatile uint32_t FDR;                    
       uint32_t RESERVED2;
  volatile uint32_t TER;                    
} LPC_UART_TypeDef;

 
typedef struct
{
  union {
  volatile const  uint32_t  RBR;                    
  volatile  uint32_t  THR;                    
  volatile uint32_t  DLL;                    
  };
  union {
  volatile uint32_t  DLM;                    
  volatile uint32_t  IER;                    
  };
  union {
  volatile const  uint32_t  IIR;                    
  volatile  uint32_t  FCR;                    
  };
  volatile uint32_t  LCR;                    
  volatile uint32_t  MCR;                    
  volatile const  uint32_t  LSR;                    
  volatile const  uint32_t  MSR;                    
  volatile uint32_t  SCR;                    
  volatile uint32_t  ACR;                    
       uint32_t  RESERVED0;
  volatile uint32_t  FDR;                    
       uint32_t  RESERVED1;
  volatile uint32_t  TER;                    
       uint32_t  RESERVED2[6];
  volatile uint32_t  RS485CTRL;              
  volatile uint32_t  ADRMATCH;               
  volatile uint32_t  RS485DLY;               
} LPC_UART1_TypeDef;

 
 
typedef struct
{
  volatile uint32_t SPCR;                        
  volatile const  uint32_t SPSR;                        
  volatile uint32_t SPDR;                        
  volatile uint32_t SPCCR;                       
       uint32_t RESERVED0[3];
  volatile uint32_t SPINT;                       
} LPC_SPI_TypeDef;

 
 
typedef struct
{
  volatile uint32_t CR0;                         
  volatile uint32_t CR1;                         
  volatile uint32_t DR;                          
  volatile const  uint32_t SR;                          
  volatile uint32_t CPSR;                        
  volatile uint32_t IMSC;                        
  volatile uint32_t RIS;                         
  volatile uint32_t MIS;                         
  volatile uint32_t ICR;                         
  volatile uint32_t DMACR;                       
} LPC_SSP_TypeDef;

 
 
typedef struct
{
  volatile uint32_t CONSET;                      
  volatile const  uint32_t STAT;                        
  volatile uint32_t DAT;                         
  volatile uint32_t ADR0;                        
  volatile uint32_t SCLH;                        
  volatile uint32_t SCLL;                        
  volatile  uint32_t CONCLR;                      
  volatile uint32_t MMCTRL;                      
  volatile uint32_t ADR1;                        
  volatile uint32_t ADR2;                        
  volatile uint32_t ADR3;                        
  volatile const  uint32_t DATA_BUFFER;                 
  volatile uint32_t MASK0;                       
  volatile uint32_t MASK1;                       
  volatile uint32_t MASK2;                       
  volatile uint32_t MASK3;                       
} LPC_I2C_TypeDef;

 
 
typedef struct
{
  volatile uint32_t DAO;                         
  volatile uint32_t DAI;                         
  volatile  uint32_t TXFIFO;                      
  volatile const  uint32_t RXFIFO;                      
  volatile const  uint32_t STATE;                       
  volatile uint32_t DMA1;                        
  volatile uint32_t DMA2;                        
  volatile uint32_t IRQ;                         
  volatile uint32_t TXRATE;                      
  volatile uint32_t RXRATE;                      
  volatile uint32_t TXBITRATE;                   
  volatile uint32_t RXBITRATE;                   
  volatile uint32_t TXMODE;                      
  volatile uint32_t RXMODE;                      
} LPC_I2S_TypeDef;

 
 
typedef struct
{
  volatile uint32_t RICOMPVAL;
  volatile uint32_t RIMASK;
  volatile uint32_t RICTRL;
  volatile uint32_t RICOUNTER;
} LPC_RIT_TypeDef;

 
 
typedef struct
{
  volatile uint32_t ILR;                         
       uint32_t RESERVED0;				    
  volatile uint32_t CCR;                         
  volatile uint32_t CIIR;                        
  volatile uint32_t AMR;                         
  volatile const  uint32_t CTIME0;                      
  volatile const  uint32_t CTIME1;                      
  volatile const  uint32_t CTIME2;                      
  volatile uint32_t SEC;                         
  volatile uint32_t MIN;                         
  volatile uint32_t HOUR;                        
  volatile uint32_t DOM;                         
  volatile uint32_t DOW;                         
  volatile uint32_t DOY;                         
  volatile uint32_t MONTH;                       
  volatile uint32_t YEAR;                        
  volatile uint32_t CALIBRATION;                 
  volatile uint32_t GPREG0;                      
  volatile uint32_t GPREG1;                      
  volatile uint32_t GPREG2;                      
  volatile uint32_t GPREG3;                      
  volatile uint32_t GPREG4;                      
  volatile uint32_t RTC_AUXEN;                   
  volatile uint32_t RTC_AUX;                     
  volatile uint32_t ALSEC;                       
  volatile uint32_t ALMIN;                       
  volatile uint32_t ALHOUR;                      
  volatile uint32_t ALDOM;                       
  volatile uint32_t ALDOW;                       
  volatile uint32_t ALDOY;                       
  volatile uint32_t ALMON;                       
  volatile uint32_t ALYEAR;                      
} LPC_RTC_TypeDef;

 
 
typedef struct
{
  volatile uint32_t MOD;                         
  volatile uint32_t TC;                          
  volatile  uint32_t FEED;                        
  volatile const  uint32_t TV;                          
  volatile uint32_t WDCLKSEL;
} LPC_WDT_TypeDef;

 
 
typedef struct
{
  volatile uint32_t CR;                          
  volatile uint32_t GDR;                         
       uint32_t RESERVED0;
  volatile uint32_t INTEN;                       
  volatile const  uint32_t DR[8];                       
  volatile const  uint32_t STAT;                        
  volatile uint32_t ADTRM;                       
	volatile uint32_t ADCR;
  volatile uint32_t ADGDR;
  volatile uint32_t ADINTEN;
  volatile const  uint32_t ADDR0;
  volatile const  uint32_t ADDR1;
  volatile const  uint32_t ADDR2;
  volatile const  uint32_t ADDR3;
  volatile const  uint32_t ADDR4;
  volatile const  uint32_t ADDR5;
  volatile const  uint32_t ADDR6;
  volatile const  uint32_t ADDR7;
  volatile const  uint32_t ADSTAT;
} LPC_ADC_TypeDef;

 
 
typedef struct
{
  volatile uint32_t CR;                          
  volatile uint32_t CTRL;                        
  volatile uint32_t CNTVAL;                      
	 volatile uint32_t DACR;
  volatile uint32_t DACCTRL;
  volatile uint16_t DACCNTVAL;
} LPC_DAC_TypeDef;


 
 
typedef struct
{
  volatile const  uint32_t CON;                         
  volatile  uint32_t CON_SET;                     
  volatile  uint32_t CON_CLR;                     
  volatile const  uint32_t CAPCON;                      
  volatile  uint32_t CAPCON_SET;                  
  volatile  uint32_t CAPCON_CLR;                  
  volatile uint32_t TC0;                         
  volatile uint32_t TC1;                         
  volatile uint32_t TC2;                         
  volatile uint32_t LIM0;                        
  volatile uint32_t LIM1;                        
  volatile uint32_t LIM2;                        
  volatile uint32_t MAT0;                        
  volatile uint32_t MAT1;                        
  volatile uint32_t MAT2;                        
  volatile uint32_t DT;                          
  volatile uint32_t CP;                          
  volatile uint32_t CAP0;                        
  volatile uint32_t CAP1;                        
  volatile uint32_t CAP2;                        
  volatile const  uint32_t INTEN;                       
  volatile  uint32_t INTEN_SET;                   
  volatile  uint32_t INTEN_CLR;                   
  volatile const  uint32_t CNTCON;                      
  volatile  uint32_t CNTCON_SET;                  
  volatile  uint32_t CNTCON_CLR;                  
  volatile const  uint32_t INTF;                        
  volatile  uint32_t INTF_SET;                    
  volatile  uint32_t INTF_CLR;                    
  volatile  uint32_t CAP_CLR;                     
} LPC_MCPWM_TypeDef;

 
 
typedef struct
{
  volatile  uint32_t CON;                         
  volatile const  uint32_t STAT;                        
  volatile uint32_t CONF;                        
  volatile const  uint32_t POS;                         
  volatile uint32_t MAXPOS;                      
  volatile uint32_t CMPOS0;                      
  volatile uint32_t CMPOS1;                      
  volatile uint32_t CMPOS2;                      
  volatile const  uint32_t INXCNT;                      
  volatile uint32_t INXCMP0;                     
  volatile uint32_t LOAD;                        
  volatile const  uint32_t TIME;                        
  volatile const  uint32_t VEL;                         
  volatile const  uint32_t CAP;                         
  volatile uint32_t VELCOMP;                     
  volatile uint32_t FILTER;
       uint32_t RESERVED0[998];
  volatile  uint32_t IEC;                         
  volatile  uint32_t IES;                         
  volatile const  uint32_t INTSTAT;                     
  volatile const  uint32_t IE;                          
  volatile  uint32_t CLR;                         
  volatile  uint32_t SET;                         
} LPC_QEI_TypeDef;

 
 
typedef struct
{
  volatile uint32_t mask[512];                   
} LPC_CANAF_RAM_TypeDef;

 
typedef struct                           
{
  volatile uint32_t AFMR;                        
  volatile uint32_t SFF_sa;                      
  volatile uint32_t SFF_GRP_sa;                  
  volatile uint32_t EFF_sa;                      
  volatile uint32_t EFF_GRP_sa;                  
  volatile uint32_t ENDofTable;                  
  volatile const  uint32_t LUTerrAd;                    
  volatile const  uint32_t LUTerr;                      
  volatile uint32_t FCANIE;                      
  volatile uint32_t FCANIC0;                     
  volatile uint32_t FCANIC1;                     
} LPC_CANAF_TypeDef;

 
typedef struct                           
{
  volatile const  uint32_t TxSR;                        
  volatile const  uint32_t RxSR;                        
  volatile const  uint32_t MSR;                         
} LPC_CANCR_TypeDef;

 
typedef struct                               
{
  volatile uint32_t MOD;                         
  volatile  uint32_t CMR;                         
  volatile uint32_t GSR;                         
  volatile const  uint32_t ICR;                         
  volatile uint32_t IER;                         
  volatile uint32_t BTR;                         
  volatile uint32_t EWL;                         
  volatile const  uint32_t SR;                          
  volatile uint32_t RFS;                         
  volatile uint32_t RID;                         
  volatile uint32_t RDA;                         
  volatile uint32_t RDB;                         
  volatile uint32_t TFI1;                        
  volatile uint32_t TID1;                        
  volatile uint32_t TDA1;                        
  volatile uint32_t TDB1;                        
  volatile uint32_t TFI2;                        
  volatile uint32_t TID2;                        
  volatile uint32_t TDA2;                        
  volatile uint32_t TDB2;                        
  volatile uint32_t TFI3;                        
  volatile uint32_t TID3;                        
  volatile uint32_t TDA3;                        
  volatile uint32_t TDB3;                        
} LPC_CAN_TypeDef;

 
 
typedef struct                               
{
  volatile const  uint32_t IntStat;                     
  volatile const  uint32_t IntTCStat;                   
  volatile  uint32_t IntTCClear;                  
  volatile const  uint32_t IntErrStat;                  
  volatile  uint32_t IntErrClr;                   
  volatile const  uint32_t RawIntTCStat;                
  volatile const  uint32_t RawIntErrStat;               
  volatile const  uint32_t EnbldChns;                   
  volatile uint32_t SoftBReq;                    
  volatile uint32_t SoftSReq;                    
  volatile uint32_t SoftLBReq;                   
  volatile uint32_t SoftLSReq;                   
  volatile uint32_t Config;                      
  volatile uint32_t Sync;                        
} LPC_GPDMA_TypeDef;

 
typedef struct                               
{
  volatile uint32_t CSrcAddr;                    
  volatile uint32_t CDestAddr;                   
  volatile uint32_t CLLI;                        
  volatile uint32_t CControl;                    
  volatile uint32_t CConfig;                     
} LPC_GPDMACH_TypeDef;

 
 
typedef struct
{
  volatile const  uint32_t Revision;                  
  volatile uint32_t Control;                   
  volatile uint32_t CommandStatus;             
  volatile uint32_t InterruptStatus;           
  volatile uint32_t InterruptEnable;           
  volatile uint32_t InterruptDisable;          
  volatile uint32_t HCCA;                      
  volatile const  uint32_t PeriodCurrentED;           
  volatile uint32_t ControlHeadED;             
  volatile uint32_t ControlCurrentED;          
  volatile uint32_t BulkHeadED;                
  volatile uint32_t BulkCurrentED;             
  volatile const  uint32_t DoneHead;                  
  volatile uint32_t FmInterval;                
  volatile const  uint32_t FmRemaining;               
  volatile const  uint32_t FmNumber;                  
  volatile uint32_t PeriodicStart;             
  volatile uint32_t LSTreshold;                
  volatile uint32_t RhDescriptorA;             
  volatile uint32_t RhDescriptorB;             
  volatile uint32_t RhStatus;                  
  volatile uint32_t RhPortStatus1;             
  volatile uint32_t RhPortStatus2;             
       uint32_t RESERVED0[40];
  volatile const  uint32_t Module_ID;                 
                                           
  volatile const  uint32_t IntSt;                     
  volatile uint32_t IntEn;                     
  volatile  uint32_t IntSet;                    
  volatile  uint32_t IntClr;                    
  volatile uint32_t StCtrl;                    
  volatile uint32_t Tmr;                       
       uint32_t RESERVED1[58];
                                           
  volatile const  uint32_t DevIntSt;                  
  volatile uint32_t DevIntEn;                  
  volatile  uint32_t DevIntClr;                 
  volatile  uint32_t DevIntSet;                 
                                           
  volatile  uint32_t CmdCode;                   
  volatile const  uint32_t CmdData;                   
                                           
  volatile const  uint32_t RxData;                    
  volatile  uint32_t TxData;                    
  volatile const  uint32_t RxPLen;                    
  volatile  uint32_t TxPLen;                    
  volatile uint32_t Ctrl;                      
  volatile  uint32_t DevIntPri;                 
                                           
  volatile const  uint32_t EpIntSt;                   
  volatile uint32_t EpIntEn;                   
  volatile  uint32_t EpIntClr;                  
  volatile  uint32_t EpIntSet;                  
  volatile  uint32_t EpIntPri;                  
                                           
  volatile uint32_t ReEp;                      
  volatile  uint32_t EpInd;                     
  volatile uint32_t MaxPSize;                  
                                           
  volatile const  uint32_t DMARSt;                    
  volatile  uint32_t DMARClr;                   
  volatile  uint32_t DMARSet;                   
       uint32_t RESERVED2[9];
  volatile uint32_t UDCAH;                     
  volatile const  uint32_t EpDMASt;                   
  volatile  uint32_t EpDMAEn;                   
  volatile  uint32_t EpDMADis;                  
  volatile const  uint32_t DMAIntSt;                  
  volatile uint32_t DMAIntEn;                  
       uint32_t RESERVED3[2];
  volatile const  uint32_t EoTIntSt;                  
  volatile  uint32_t EoTIntClr;                 
  volatile  uint32_t EoTIntSet;                 
  volatile const  uint32_t NDDRIntSt;                 
  volatile  uint32_t NDDRIntClr;                
  volatile  uint32_t NDDRIntSet;                
  volatile const  uint32_t SysErrIntSt;               
  volatile  uint32_t SysErrIntClr;              
  volatile  uint32_t SysErrIntSet;              
       uint32_t RESERVED4[15];
                                           
  union {
  volatile const  uint32_t I2C_RX;                    
  volatile  uint32_t I2C_TX;                    
  };
  volatile const  uint32_t I2C_STS;                   
  volatile uint32_t I2C_CTL;                   
  volatile uint32_t I2C_CLKHI;                 
  volatile  uint32_t I2C_CLKLO;                 
       uint32_t RESERVED5[824];
                                           
  union {
  volatile uint32_t USBClkCtrl;                
  volatile uint32_t OTGClkCtrl;                
  };
  union {
  volatile const  uint32_t USBClkSt;                  
  volatile const  uint32_t OTGClkSt;                  
  };
} LPC_USB_TypeDef;

 
 
typedef struct
{
  volatile uint32_t MAC1;                        
  volatile uint32_t MAC2;                        
  volatile uint32_t IPGT;                        
  volatile uint32_t IPGR;                        
  volatile uint32_t CLRT;                        
  volatile uint32_t MAXF;                        
  volatile uint32_t SUPP;                        
  volatile uint32_t TEST;                        
  volatile uint32_t MCFG;                        
  volatile uint32_t MCMD;                        
  volatile uint32_t MADR;                        
  volatile  uint32_t MWTD;                        
  volatile const  uint32_t MRDD;                        
  volatile const  uint32_t MIND;                        
       uint32_t RESERVED0[2];
  volatile uint32_t SA0;                         
  volatile uint32_t SA1;                         
  volatile uint32_t SA2;                         
       uint32_t RESERVED1[45];
  volatile uint32_t Command;                     
  volatile const  uint32_t Status;                      
  volatile uint32_t RxDescriptor;                
  volatile uint32_t RxStatus;                    
  volatile uint32_t RxDescriptorNumber;          
  volatile const  uint32_t RxProduceIndex;              
  volatile uint32_t RxConsumeIndex;              
  volatile uint32_t TxDescriptor;                
  volatile uint32_t TxStatus;                    
  volatile uint32_t TxDescriptorNumber;          
  volatile uint32_t TxProduceIndex;              
  volatile const  uint32_t TxConsumeIndex;              
       uint32_t RESERVED2[10];
  volatile const  uint32_t TSV0;                        
  volatile const  uint32_t TSV1;                        
  volatile const  uint32_t RSV;                         
       uint32_t RESERVED3[3];
  volatile uint32_t FlowControlCounter;          
  volatile const  uint32_t FlowControlStatus;           
       uint32_t RESERVED4[34];
  volatile uint32_t RxFilterCtrl;                
  volatile const  uint32_t RxFilterWoLStatus;           
  volatile  uint32_t RxFilterWoLClear;            
       uint32_t RESERVED5;
  volatile uint32_t HashFilterL;                 
  volatile uint32_t HashFilterH;                 
       uint32_t RESERVED6[882];
  volatile const  uint32_t IntStatus;                   
  volatile uint32_t IntEnable;                   
  volatile  uint32_t IntClear;                    
  volatile  uint32_t IntSet;                      
       uint32_t RESERVED7;
  volatile uint32_t PowerDown;                   
} LPC_EMAC_TypeDef;


#pragma no_anon_unions



 
 
 
 
#line 903 ".\\USBAudio\\lpc17xx.h"

 
#line 924 ".\\USBAudio\\lpc17xx.h"

 
#line 938 ".\\USBAudio\\lpc17xx.h"

 
#line 951 ".\\USBAudio\\lpc17xx.h"

 







 
 
 
#line 1010 ".\\USBAudio\\lpc17xx.h"



 

#line 14 "GLCD_SPI_LPC1700.c"
#line 1 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"
 
 
 




 
 



 






   














  


 








#line 54 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"


  



    typedef unsigned int size_t;    
#line 70 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"






    



    typedef unsigned short wchar_t;  
#line 91 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"

typedef struct div_t { int quot, rem; } div_t;
    
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
    

typedef struct lldiv_t { long long quot, rem; } lldiv_t;
    


#line 112 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"
   



 

   




 
#line 131 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"
   


 
extern __declspec(__nothrow) int __aeabi_MB_CUR_MAX(void);

   




 

   




 




extern __declspec(__nothrow) double atof(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int atoi(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) long int atol(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) long long atoll(const char *  ) __attribute__((__nonnull__(1)));
   



 


extern __declspec(__nothrow) double strtod(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

















 

extern __declspec(__nothrow) float strtof(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) long double strtold(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

 

extern __declspec(__nothrow) long int strtol(const char * __restrict  ,
                        char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



























 
extern __declspec(__nothrow) unsigned long int strtoul(const char * __restrict  ,
                                       char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   


























 

 
extern __declspec(__nothrow) long long strtoll(const char * __restrict  ,
                                  char ** __restrict  , int  )
                          __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) unsigned long long strtoull(const char * __restrict  ,
                                            char ** __restrict  , int  )
                                   __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) int rand(void);
   







 
extern __declspec(__nothrow) void srand(unsigned int  );
   






 

struct _rand_state { int __x[57]; };
extern __declspec(__nothrow) int _rand_r(struct _rand_state *);
extern __declspec(__nothrow) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __declspec(__nothrow) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __declspec(__nothrow) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);
   


 

extern __declspec(__nothrow) void *calloc(size_t  , size_t  );
   



 
extern __declspec(__nothrow) void free(void *  );
   





 
extern __declspec(__nothrow) void *malloc(size_t  );
   



 
extern __declspec(__nothrow) void *realloc(void *  , size_t  );
   













 

extern __declspec(__nothrow) int posix_memalign(void **  , size_t  , size_t  );
   









 

typedef int (*__heapprt)(void *, char const *, ...);
extern __declspec(__nothrow) void __heapstats(int (*  )(void *  ,
                                           char const *  , ...),
                        void *  ) __attribute__((__nonnull__(1)));
   










 
extern __declspec(__nothrow) int __heapvalid(int (*  )(void *  ,
                                           char const *  , ...),
                       void *  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) __declspec(__noreturn) void abort(void);
   







 

extern __declspec(__nothrow) int atexit(void (*  )(void)) __attribute__((__nonnull__(1)));
   




 
#line 436 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern __declspec(__nothrow) __declspec(__noreturn) void exit(int  );
   












 

extern __declspec(__nothrow) __declspec(__noreturn) void _Exit(int  );
   







      

extern __declspec(__nothrow) char *getenv(const char *  ) __attribute__((__nonnull__(1)));
   









 

extern __declspec(__nothrow) int  system(const char *  );
   









 

extern  void *bsearch(const void *  , const void *  ,
              size_t  , size_t  ,
              int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
   












 
#line 524 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern  void qsort(void *  , size_t  , size_t  ,
           int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
   









 

#line 553 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"

extern __declspec(__nothrow) __attribute__((const)) int abs(int  );
   



 

extern __declspec(__nothrow) __attribute__((const)) div_t div(int  , int  );
   









 
extern __declspec(__nothrow) __attribute__((const)) long int labs(long int  );
   



 




extern __declspec(__nothrow) __attribute__((const)) ldiv_t ldiv(long int  , long int  );
   











 







extern __declspec(__nothrow) __attribute__((const)) long long llabs(long long  );
   



 




extern __declspec(__nothrow) __attribute__((const)) lldiv_t lldiv(long long  , long long  );
   











 
#line 634 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"




 
typedef struct __sdiv32by16 { int quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned int quot, rem; } __udiv32by16;
    
typedef struct __sdiv64by32 { int rem, quot; } __sdiv64by32;

__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv32by16 __rt_sdiv32by16(
     int  ,
     short int  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __udiv32by16 __rt_udiv32by16(
     unsigned int  ,
     unsigned short  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv64by32 __rt_sdiv64by32(
     int  , unsigned int  ,
     int  );
   

 




 
extern __declspec(__nothrow) unsigned int __fp_status(unsigned int  , unsigned int  );
   







 























 
extern __declspec(__nothrow) int mblen(const char *  , size_t  );
   












 
extern __declspec(__nothrow) int mbtowc(wchar_t * __restrict  ,
                   const char * __restrict  , size_t  );
   















 
extern __declspec(__nothrow) int wctomb(char *  , wchar_t  );
   













 





 
extern __declspec(__nothrow) size_t mbstowcs(wchar_t * __restrict  ,
                      const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 
extern __declspec(__nothrow) size_t wcstombs(char * __restrict  ,
                      const wchar_t * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 

extern __declspec(__nothrow) void __use_realtime_heap(void);
extern __declspec(__nothrow) void __use_realtime_division(void);
extern __declspec(__nothrow) void __use_two_region_memory(void);
extern __declspec(__nothrow) void __use_no_heap(void);
extern __declspec(__nothrow) void __use_no_heap_region(void);

extern __declspec(__nothrow) char const *__C_library_version_string(void);
extern __declspec(__nothrow) int __C_library_version_number(void);











#line 892 "F:\\Recent Downlaods\\Keli_V5\\Arm\\ARMCC\\Bin\\..\\include\\stdlib.h"





 
#line 15 "GLCD_SPI_LPC1700.c"
#line 1 "GLCD.h"
 
 
 
 
 
 
 
 
 












 
                            
 
#line 41 "GLCD.h"


#line 49 "GLCD.h"

extern void GLCD_Init           (void);
extern void GLCD_WindowMax      (void);
extern void GLCD_PutPixel       (unsigned int x, unsigned int y);
extern void GLCD_SetTextColor   (unsigned short color);
extern void GLCD_SetBackColor   (unsigned short color);
extern void GLCD_Clear          (unsigned short color);
extern void GLCD_DrawChar       (unsigned int x,  unsigned int y, unsigned int cw, unsigned int ch, unsigned char *c);
extern void GLCD_DisplayChar    (unsigned int ln, unsigned int col, unsigned char fi, unsigned char  c);
extern void GLCD_DisplayString  (unsigned int ln, unsigned int col, unsigned char fi, unsigned char *s);
extern void GLCD_ClearLn        (unsigned int ln, unsigned char fi);
extern void GLCD_Bargraph       (unsigned int x,  unsigned int y, unsigned int w, unsigned int h, unsigned int val);
extern void GLCD_ScrollVertical (unsigned int dy);


extern int  GLCD_Bitmap(int x, int y, unsigned int w, unsigned int h, const unsigned char *bitmap);
extern int 	GLCD_BitmapCutout(int x, int y, unsigned int w, unsigned int h, const unsigned char *bitmap, unsigned short alpha_color);
extern int  GLCD_Bitmap_Region(int x, int y, unsigned int w, unsigned int h, const unsigned char *bitmap, int rx, int ry, unsigned int rw, unsigned int rh);
extern void GLCD_PutPixelc (int x, int y, unsigned short color);

extern int GLCD_DrawBox(int x, int y, unsigned int w, unsigned int h, unsigned short color);
extern int GLCD_FillBox(int x, int y, unsigned int w, unsigned int h, unsigned short color);

extern void GLCD_DrawLine(int x1, int y1, int x2, int y2, unsigned short color);

extern void plotCirclePoints(int xc, int yc, int x, int y, unsigned short color);
extern void GLCD_DrawCircle(int xc, int yc, int radius, unsigned short color);

extern void drawHorizontalLine(int x1, int x2, int y, unsigned short color);
extern void GLCD_DrawFilledCircle(int xc, int yc, int radius, unsigned short color);

extern void transition_screen(unsigned short color, int pattern, int delay_ms);

extern void GLCD_DrawCharCutout       (unsigned int x,  unsigned int y, unsigned int cw, unsigned int ch, unsigned char *c, unsigned short color);
extern void GLCD_DisplayCharCutout    (unsigned int ln, unsigned int col, unsigned char fi, unsigned char  c, unsigned short color);
extern void GLCD_DisplayStringCutout  (unsigned int ln, unsigned int col, unsigned char fi, unsigned char *s, unsigned short color);

extern void GLCD_WrCmd          (unsigned char cmd);
extern void GLCD_WrReg          (unsigned char reg, unsigned short val); 

#line 16 "GLCD_SPI_LPC1700.c"
#line 1 "Font_6x8_h.h"













 




const unsigned char Font_6x8_h[] = {
   
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   
  0x04, 0x04, 0x04, 0x04, 0x04, 0x00, 0x04, 0x00,
   
  0x0A, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00,
   
  0x0A, 0x0A, 0x1F, 0x0A, 0x1F, 0x0A, 0x0A, 0x00,
   
  0x04, 0x1E, 0x05, 0x0E, 0x14, 0x0F, 0x04, 0x00,
   
  0x03, 0x13, 0x08, 0x04, 0x02, 0x19, 0x18, 0x00,
   
  0x02, 0x05, 0x05, 0x02, 0x15, 0x09, 0x16, 0x00,
   
  0x0C, 0x0C, 0x04, 0x02, 0x00, 0x00, 0x00, 0x00,
   
  0x08, 0x04, 0x02, 0x02, 0x02, 0x04, 0x08, 0x00,
   
  0x02, 0x04, 0x08, 0x08, 0x08, 0x04, 0x02, 0x00,
   
  0x00, 0x04, 0x15, 0x0E, 0x0E, 0x15, 0x04, 0x00,
   
  0x00, 0x04, 0x04, 0x1F, 0x04, 0x04, 0x00, 0x00,
   
  0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x04, 0x02,
   
  0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00,
   
  0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00,
   
  0x00, 0x10, 0x08, 0x04, 0x02, 0x01, 0x00, 0x00,
   
  0x0E, 0x11, 0x13, 0x15, 0x19, 0x11, 0x0E, 0x00,
   
  0x04, 0x06, 0x04, 0x04, 0x04, 0x04, 0x0E, 0x00,
   
  0x0E, 0x11, 0x10, 0x0E, 0x01, 0x01, 0x1F, 0x00,
   
  0x1F, 0x10, 0x08, 0x0C, 0x10, 0x11, 0x0E, 0x00,
   
  0x08, 0x0C, 0x0A, 0x09, 0x1F, 0x08, 0x08, 0x00,
   
  0x1F, 0x01, 0x0F, 0x10, 0x10, 0x11, 0x0E, 0x00,
   
  0x1C, 0x02, 0x01, 0x0F, 0x11, 0x11, 0x0E, 0x00,
   
  0x1F, 0x10, 0x10, 0x08, 0x04, 0x02, 0x01, 0x00,
   
  0x0E, 0x11, 0x11, 0x0E, 0x11, 0x11, 0x0E, 0x00,
   
  0x0E, 0x11, 0x11, 0x1E, 0x10, 0x08, 0x07, 0x00,
   
  0x00, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00,
   
  0x00, 0x00, 0x04, 0x00, 0x04, 0x04, 0x02, 0x00,
   
  0x10, 0x08, 0x04, 0x02, 0x04, 0x08, 0x10, 0x00,
   
  0x00, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x00, 0x00,
   
  0x02, 0x04, 0x08, 0x10, 0x08, 0x04, 0x02, 0x00,
   
  0x0E, 0x11, 0x10, 0x0C, 0x04, 0x00, 0x04, 0x00,
   
  0x0E, 0x11, 0x15, 0x1D, 0x0D, 0x01, 0x1E, 0x00,
   
  0x04, 0x0A, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x00,
   
  0x0F, 0x11, 0x11, 0x0F, 0x11, 0x11, 0x0F, 0x00,
   
  0x0E, 0x11, 0x01, 0x01, 0x01, 0x11, 0x0E, 0x00,
   
  0x0F, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0F, 0x00,
   
  0x1F, 0x01, 0x01, 0x0F, 0x01, 0x01, 0x1F, 0x00,
   
  0x1F, 0x01, 0x01, 0x0F, 0x01, 0x01, 0x01, 0x00,
   
  0x1E, 0x11, 0x01, 0x01, 0x19, 0x11, 0x1E, 0x00,
   
  0x11, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11, 0x00,
   
  0x0E, 0x04, 0x04, 0x04, 0x04, 0x04, 0x0E, 0x00,
   
  0x1C, 0x08, 0x08, 0x08, 0x08, 0x09, 0x06, 0x00,
   
  0x11, 0x09, 0x05, 0x03, 0x05, 0x09, 0x11, 0x00,
   
  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x1F, 0x00,
   
  0x11, 0x1B, 0x15, 0x15, 0x15, 0x11, 0x11, 0x00,
   
  0x11, 0x11, 0x13, 0x15, 0x19, 0x11, 0x11, 0x00,
   
  0x0E, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E, 0x00,
   
  0x0F, 0x11, 0x11, 0x0F, 0x01, 0x01, 0x01, 0x00,
   
  0x0E, 0x11, 0x11, 0x11, 0x15, 0x09, 0x16, 0x00,
   
  0x0F, 0x11, 0x11, 0x0F, 0x05, 0x09, 0x11, 0x00,
   
  0x0E, 0x11, 0x01, 0x0E, 0x10, 0x11, 0x0E, 0x00,
   
  0x1F, 0x15, 0x04, 0x04, 0x04, 0x04, 0x04, 0x00,
   
  0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E, 0x00,
   
  0x11, 0x11, 0x11, 0x11, 0x11, 0x0A, 0x04, 0x00,
   
  0x11, 0x11, 0x11, 0x15, 0x15, 0x15, 0x0A, 0x00,
   
  0x11, 0x11, 0x0A, 0x04, 0x0A, 0x11, 0x11, 0x00,
   
  0x11, 0x11, 0x0A, 0x04, 0x04, 0x04, 0x04, 0x00,
   
  0x1F, 0x10, 0x08, 0x0E, 0x02, 0x01, 0x1F, 0x00,
   
  0x1E, 0x02, 0x02, 0x02, 0x02, 0x02, 0x1E, 0x00,
   
  0x00, 0x01, 0x02, 0x04, 0x08, 0x10, 0x00, 0x00,
   
  0x1E, 0x10, 0x10, 0x10, 0x10, 0x10, 0x1E, 0x00,
   
  0x04, 0x0A, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00,
   
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00,
   
  0x06, 0x06, 0x04, 0x08, 0x00, 0x00, 0x00, 0x00,
   
  0x00, 0x00, 0x06, 0x08, 0x0E, 0x09, 0x1E, 0x00,
   
  0x01, 0x01, 0x0D, 0x13, 0x11, 0x13, 0x0D, 0x00,
   
  0x00, 0x00, 0x0E, 0x11, 0x01, 0x11, 0x0E, 0x00,
   
  0x10, 0x10, 0x16, 0x19, 0x11, 0x19, 0x16, 0x00,
   
  0x00, 0x00, 0x0E, 0x11, 0x1F, 0x01, 0x0E, 0x00,
   
  0x08, 0x14, 0x04, 0x0E, 0x04, 0x04, 0x04, 0x00,
   
  0x00, 0x00, 0x0E, 0x19, 0x19, 0x16, 0x10, 0x0E,
   
  0x01, 0x01, 0x0D, 0x13, 0x11, 0x11, 0x11, 0x00,
   
  0x04, 0x00, 0x06, 0x04, 0x04, 0x04, 0x0E, 0x00,
   
  0x08, 0x00, 0x08, 0x08, 0x08, 0x09, 0x06, 0x00,
   
  0x01, 0x01, 0x09, 0x05, 0x03, 0x05, 0x09, 0x00,
   
  0x06, 0x04, 0x04, 0x04, 0x04, 0x04, 0x0E, 0x00,
   
  0x00, 0x00, 0x0B, 0x15, 0x15, 0x15, 0x15, 0x00,
   
  0x00, 0x00, 0x0D, 0x13, 0x11, 0x11, 0x11, 0x00,
   
  0x00, 0x00, 0x0E, 0x11, 0x11, 0x11, 0x0E, 0x00,
   
  0x00, 0x00, 0x0D, 0x13, 0x13, 0x0D, 0x01, 0x01,
   
  0x00, 0x00, 0x16, 0x19, 0x19, 0x16, 0x10, 0x10,
   
  0x00, 0x00, 0x0D, 0x13, 0x01, 0x01, 0x01, 0x00,
   
  0x00, 0x00, 0x1E, 0x01, 0x0E, 0x10, 0x0F, 0x00,
   
  0x04, 0x04, 0x1F, 0x04, 0x04, 0x14, 0x08, 0x00,
   
  0x00, 0x00, 0x11, 0x11, 0x11, 0x19, 0x16, 0x00,
   
  0x00, 0x00, 0x11, 0x11, 0x11, 0x0A, 0x04, 0x00,
   
  0x00, 0x00, 0x11, 0x11, 0x15, 0x15, 0x0A, 0x00,
   
  0x00, 0x00, 0x11, 0x0A, 0x04, 0x0A, 0x11, 0x00,
   
  0x00, 0x00, 0x11, 0x11, 0x1E, 0x10, 0x11, 0x0E,
   
  0x00, 0x00, 0x1F, 0x08, 0x04, 0x02, 0x1F, 0x00,
   
  0x08, 0x04, 0x04, 0x02, 0x04, 0x04, 0x08, 0x00,
   
  0x04, 0x04, 0x04, 0x00, 0x04, 0x04, 0x04, 0x00,
   
  0x02, 0x04, 0x04, 0x08, 0x04, 0x04, 0x02, 0x00,
   
  0x02, 0x15, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00,
   
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

   
   
  0x00, 0x00, 0x0C, 0x12, 0x12, 0x0C, 0x00, 0x00,
   
  0x00, 0x00, 0x0C, 0x1E, 0x1E, 0x0C, 0x00, 0x00,
   
  0x00, 0x00, 0x1E, 0x12, 0x12, 0x1E, 0x00, 0x00,
   
  0x00, 0x00, 0x1E, 0x1E, 0x1E, 0x1E, 0x00, 0x00,
   
  0x00, 0x00, 0x0C, 0x0C, 0x12, 0x1E, 0x00, 0x00,
   
  0x00, 0x00, 0x0C, 0x0C, 0x1E, 0x1E, 0x00, 0x00,
   
  0x00, 0x00, 0x1E, 0x12, 0x0C, 0x0C, 0x00, 0x00,
   
  0x00, 0x00, 0x1E, 0x1E, 0x0C, 0x0C, 0x00, 0x00,
   
  0x00, 0x00, 0x18, 0x16, 0x16, 0x18, 0x00, 0x00,
   
  0x00, 0x00, 0x18, 0x1E, 0x1E, 0x18, 0x00, 0x00,
   
  0x00, 0x00, 0x06, 0x1A, 0x1A, 0x06, 0x00, 0x00,
   
  0x00, 0x00, 0x06, 0x1E, 0x1E, 0x06, 0x00, 0x00,
   
  0x00, 0x00, 0x0C, 0x12, 0x12, 0x0C, 0x00, 0x00,
   
  0x00, 0x00, 0x0C, 0x1E, 0x1E, 0x0C, 0x00, 0x00,
   
  0x00, 0x00, 0x1E, 0x12, 0x12, 0x1E, 0x00, 0x00,
   
  0x00, 0x00, 0x1E, 0x1E, 0x1E, 0x1E, 0x00, 0x00,
};

#line 17 "GLCD_SPI_LPC1700.c"
#line 1 "Font_16x24_h.h"













 




const unsigned short Font_16x24_h[] = {
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0000, 0x0000,
  0x0180, 0x0180, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x00CC, 0x00CC, 0x00CC, 0x00CC, 0x00CC, 0x00CC,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0C60, 0x0C60,
  0x0C60, 0x0630, 0x0630, 0x1FFE, 0x1FFE, 0x0630, 0x0738, 0x0318,
  0x1FFE, 0x1FFE, 0x0318, 0x0318, 0x018C, 0x018C, 0x018C, 0x0000,
   
  0x0000, 0x0080, 0x03E0, 0x0FF8, 0x0E9C, 0x1C8C, 0x188C, 0x008C,
  0x0098, 0x01F8, 0x07E0, 0x0E80, 0x1C80, 0x188C, 0x188C, 0x189C,
  0x0CB8, 0x0FF0, 0x03E0, 0x0080, 0x0080, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x180E, 0x0C1B, 0x0C11, 0x0611, 0x0611,
  0x0311, 0x0311, 0x019B, 0x018E, 0x38C0, 0x6CC0, 0x4460, 0x4460,
  0x4430, 0x4430, 0x4418, 0x6C18, 0x380C, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x01E0, 0x03F0, 0x0738, 0x0618, 0x0618, 0x0330, 0x01F0,
  0x00F0, 0x00F8, 0x319C, 0x330E, 0x1E06, 0x1C06, 0x1C06, 0x3F06,
  0x73FC, 0x21F0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x000C, 0x000C, 0x000C, 0x000C, 0x000C, 0x000C,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0200, 0x0300, 0x0180, 0x00C0, 0x00C0, 0x0060, 0x0060,
  0x0030, 0x0030, 0x0030, 0x0030, 0x0030, 0x0030, 0x0030, 0x0030,
  0x0060, 0x0060, 0x00C0, 0x00C0, 0x0180, 0x0300, 0x0200, 0x0000,
   
  0x0000, 0x0020, 0x0060, 0x00C0, 0x0180, 0x0180, 0x0300, 0x0300,
  0x0600, 0x0600, 0x0600, 0x0600, 0x0600, 0x0600, 0x0600, 0x0600,
  0x0300, 0x0300, 0x0180, 0x0180, 0x00C0, 0x0060, 0x0020, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x00C0, 0x00C0,
  0x06D8, 0x07F8, 0x01E0, 0x0330, 0x0738, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0180, 0x3FFC, 0x3FFC, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0180, 0x0180, 0x0100, 0x0100, 0x0080, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x07E0, 0x07E0, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x00C0, 0x00C0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0C00, 0x0C00, 0x0600, 0x0600, 0x0600, 0x0300, 0x0300,
  0x0300, 0x0380, 0x0180, 0x0180, 0x0180, 0x00C0, 0x00C0, 0x00C0,
  0x0060, 0x0060, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x03E0, 0x07F0, 0x0E38, 0x0C18, 0x180C, 0x180C, 0x180C,
  0x180C, 0x180C, 0x180C, 0x180C, 0x180C, 0x180C, 0x0C18, 0x0E38,
  0x07F0, 0x03E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0100, 0x0180, 0x01C0, 0x01F0, 0x0198, 0x0188, 0x0180,
  0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x03E0, 0x0FF8, 0x0C18, 0x180C, 0x180C, 0x1800, 0x1800,
  0x0C00, 0x0600, 0x0300, 0x0180, 0x00C0, 0x0060, 0x0030, 0x0018,
  0x1FFC, 0x1FFC, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x01E0, 0x07F8, 0x0E18, 0x0C0C, 0x0C0C, 0x0C00, 0x0600,
  0x03C0, 0x07C0, 0x0C00, 0x1800, 0x1800, 0x180C, 0x180C, 0x0C18,
  0x07F8, 0x03E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0C00, 0x0E00, 0x0F00, 0x0F00, 0x0D80, 0x0CC0, 0x0C60,
  0x0C60, 0x0C30, 0x0C18, 0x0C0C, 0x3FFC, 0x3FFC, 0x0C00, 0x0C00,
  0x0C00, 0x0C00, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0FF8, 0x0FF8, 0x0018, 0x0018, 0x000C, 0x03EC, 0x07FC,
  0x0E1C, 0x1C00, 0x1800, 0x1800, 0x1800, 0x180C, 0x0C1C, 0x0E18,
  0x07F8, 0x03E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x07C0, 0x0FF0, 0x1C38, 0x1818, 0x0018, 0x000C, 0x03CC,
  0x0FEC, 0x0E3C, 0x1C1C, 0x180C, 0x180C, 0x180C, 0x1C18, 0x0E38,
  0x07F0, 0x03E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x1FFC, 0x1FFC, 0x0C00, 0x0600, 0x0600, 0x0300, 0x0380,
  0x0180, 0x01C0, 0x00C0, 0x00E0, 0x0060, 0x0060, 0x0070, 0x0030,
  0x0030, 0x0030, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x03E0, 0x07F0, 0x0E38, 0x0C18, 0x0C18, 0x0C18, 0x0638,
  0x07F0, 0x07F0, 0x0C18, 0x180C, 0x180C, 0x180C, 0x180C, 0x0C38,
  0x0FF8, 0x03E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x03E0, 0x07F0, 0x0E38, 0x0C1C, 0x180C, 0x180C, 0x180C,
  0x1C1C, 0x1E38, 0x1BF8, 0x19E0, 0x1800, 0x0C00, 0x0C00, 0x0E1C,
  0x07F8, 0x01F0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0180, 0x0180,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0180, 0x0180, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0180, 0x0180,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0180, 0x0180, 0x0100, 0x0100, 0x0080, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x1000, 0x1C00, 0x0F80, 0x03E0, 0x00F8, 0x0018, 0x00F8, 0x03E0,
  0x0F80, 0x1C00, 0x1000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x1FF8, 0x0000, 0x0000, 0x0000, 0x1FF8, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0008, 0x0038, 0x01F0, 0x07C0, 0x1F00, 0x1800, 0x1F00, 0x07C0,
  0x01F0, 0x0038, 0x0008, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x03E0, 0x0FF8, 0x0C18, 0x180C, 0x180C, 0x1800, 0x0C00,
  0x0600, 0x0300, 0x0180, 0x00C0, 0x00C0, 0x00C0, 0x0000, 0x0000,
  0x00C0, 0x00C0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x07E0, 0x1818, 0x2004, 0x29C2, 0x4A22, 0x4411,
  0x4409, 0x4409, 0x4409, 0x2209, 0x1311, 0x0CE2, 0x4002, 0x2004,
  0x1818, 0x07E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0380, 0x0380, 0x06C0, 0x06C0, 0x06C0, 0x0C60, 0x0C60,
  0x1830, 0x1830, 0x1830, 0x3FF8, 0x3FF8, 0x701C, 0x600C, 0x600C,
  0xC006, 0xC006, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x03FC, 0x0FFC, 0x0C0C, 0x180C, 0x180C, 0x180C, 0x0C0C,
  0x07FC, 0x0FFC, 0x180C, 0x300C, 0x300C, 0x300C, 0x300C, 0x180C,
  0x1FFC, 0x07FC, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x07C0, 0x1FF0, 0x3838, 0x301C, 0x700C, 0x6006, 0x0006,
  0x0006, 0x0006, 0x0006, 0x0006, 0x0006, 0x6006, 0x700C, 0x301C,
  0x1FF0, 0x07E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x03FE, 0x0FFE, 0x0E06, 0x1806, 0x1806, 0x3006, 0x3006,
  0x3006, 0x3006, 0x3006, 0x3006, 0x3006, 0x1806, 0x1806, 0x0E06,
  0x0FFE, 0x03FE, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x3FFC, 0x3FFC, 0x000C, 0x000C, 0x000C, 0x000C, 0x000C,
  0x1FFC, 0x1FFC, 0x000C, 0x000C, 0x000C, 0x000C, 0x000C, 0x000C,
  0x3FFC, 0x3FFC, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x3FF8, 0x3FF8, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018,
  0x1FF8, 0x1FF8, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018,
  0x0018, 0x0018, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0FE0, 0x3FF8, 0x783C, 0x600E, 0xE006, 0xC007, 0x0003,
  0x0003, 0xFE03, 0xFE03, 0xC003, 0xC007, 0xC006, 0xC00E, 0xF03C,
  0x3FF8, 0x0FE0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x300C, 0x300C, 0x300C, 0x300C, 0x300C, 0x300C, 0x300C,
  0x3FFC, 0x3FFC, 0x300C, 0x300C, 0x300C, 0x300C, 0x300C, 0x300C,
  0x300C, 0x300C, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0600, 0x0600, 0x0600, 0x0600, 0x0600, 0x0600, 0x0600,
  0x0600, 0x0600, 0x0600, 0x0600, 0x0600, 0x0618, 0x0618, 0x0738,
  0x03F0, 0x01E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x3006, 0x1806, 0x0C06, 0x0606, 0x0306, 0x0186, 0x00C6,
  0x0066, 0x0076, 0x00DE, 0x018E, 0x0306, 0x0606, 0x0C06, 0x1806,
  0x3006, 0x6006, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018,
  0x0018, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018,
  0x1FF8, 0x1FF8, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0xE00E, 0xF01E, 0xF01E, 0xF01E, 0xD836, 0xD836, 0xD836,
  0xD836, 0xCC66, 0xCC66, 0xCC66, 0xC6C6, 0xC6C6, 0xC6C6, 0xC6C6,
  0xC386, 0xC386, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x300C, 0x301C, 0x303C, 0x303C, 0x306C, 0x306C, 0x30CC,
  0x30CC, 0x318C, 0x330C, 0x330C, 0x360C, 0x360C, 0x3C0C, 0x3C0C,
  0x380C, 0x300C, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x07E0, 0x1FF8, 0x381C, 0x700E, 0x6006, 0xC003, 0xC003,
  0xC003, 0xC003, 0xC003, 0xC003, 0xC003, 0x6006, 0x700E, 0x381C,
  0x1FF8, 0x07E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0FFC, 0x1FFC, 0x380C, 0x300C, 0x300C, 0x300C, 0x300C,
  0x180C, 0x1FFC, 0x07FC, 0x000C, 0x000C, 0x000C, 0x000C, 0x000C,
  0x000C, 0x000C, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x07E0, 0x1FF8, 0x381C, 0x700E, 0x6006, 0xE003, 0xC003,
  0xC003, 0xC003, 0xC003, 0xC003, 0xE007, 0x6306, 0x3F0E, 0x3C1C,
  0x3FF8, 0xF7E0, 0xC000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0FFE, 0x1FFE, 0x3806, 0x3006, 0x3006, 0x3006, 0x3806,
  0x1FFE, 0x07FE, 0x0306, 0x0606, 0x0C06, 0x1806, 0x1806, 0x3006,
  0x3006, 0x6006, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x03E0, 0x0FF8, 0x0C1C, 0x180C, 0x180C, 0x000C, 0x001C,
  0x03F8, 0x0FE0, 0x1E00, 0x3800, 0x3006, 0x3006, 0x300E, 0x1C1C,
  0x0FF8, 0x07E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x7FFE, 0x7FFE, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x300C, 0x300C, 0x300C, 0x300C, 0x300C, 0x300C, 0x300C,
  0x300C, 0x300C, 0x300C, 0x300C, 0x300C, 0x300C, 0x300C, 0x1818,
  0x1FF8, 0x07E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x6003, 0x3006, 0x3006, 0x3006, 0x180C, 0x180C, 0x180C,
  0x0C18, 0x0C18, 0x0E38, 0x0630, 0x0630, 0x0770, 0x0360, 0x0360,
  0x01C0, 0x01C0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x6003, 0x61C3, 0x61C3, 0x61C3, 0x3366, 0x3366, 0x3366,
  0x3366, 0x3366, 0x3366, 0x1B6C, 0x1B6C, 0x1B6C, 0x1A2C, 0x1E3C,
  0x0E38, 0x0E38, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0xE00F, 0x700C, 0x3018, 0x1830, 0x0C70, 0x0E60, 0x07C0,
  0x0380, 0x0380, 0x03C0, 0x06E0, 0x0C70, 0x1C30, 0x1818, 0x300C,
  0x600E, 0xE007, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0xC003, 0x6006, 0x300C, 0x381C, 0x1838, 0x0C30, 0x0660,
  0x07E0, 0x03C0, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x7FFC, 0x7FFC, 0x6000, 0x3000, 0x1800, 0x0C00, 0x0600,
  0x0300, 0x0180, 0x00C0, 0x0060, 0x0030, 0x0018, 0x000C, 0x0006,
  0x7FFE, 0x7FFE, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x03E0, 0x03E0, 0x0060, 0x0060, 0x0060, 0x0060, 0x0060,
  0x0060, 0x0060, 0x0060, 0x0060, 0x0060, 0x0060, 0x0060, 0x0060,
  0x0060, 0x0060, 0x0060, 0x0060, 0x0060, 0x03E0, 0x03E0, 0x0000,
   
  0x0000, 0x0030, 0x0030, 0x0060, 0x0060, 0x0060, 0x00C0, 0x00C0,
  0x00C0, 0x01C0, 0x0180, 0x0180, 0x0180, 0x0300, 0x0300, 0x0300,
  0x0600, 0x0600, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x03E0, 0x03E0, 0x0300, 0x0300, 0x0300, 0x0300, 0x0300,
  0x0300, 0x0300, 0x0300, 0x0300, 0x0300, 0x0300, 0x0300, 0x0300,
  0x0300, 0x0300, 0x0300, 0x0300, 0x0300, 0x03E0, 0x03E0, 0x0000,
   
  0x0000, 0x0000, 0x01C0, 0x01C0, 0x0360, 0x0360, 0x0360, 0x0630,
  0x0630, 0x0C18, 0x0C18, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0xFFFF, 0xFFFF, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x000C, 0x000C, 0x000C, 0x000C, 0x000C, 0x000C, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x03F0, 0x07F8,
  0x0C1C, 0x0C0C, 0x0F00, 0x0FF0, 0x0CF8, 0x0C0C, 0x0C0C, 0x0F1C,
  0x0FF8, 0x18F0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018, 0x03D8, 0x0FF8,
  0x0C38, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x0C38,
  0x0FF8, 0x03D8, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x03C0, 0x07F0,
  0x0E30, 0x0C18, 0x0018, 0x0018, 0x0018, 0x0018, 0x0C18, 0x0E30,
  0x07F0, 0x03C0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x1800, 0x1800, 0x1800, 0x1800, 0x1800, 0x1BC0, 0x1FF0,
  0x1C30, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1C30,
  0x1FF0, 0x1BC0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x03C0, 0x0FF0,
  0x0C30, 0x1818, 0x1FF8, 0x1FF8, 0x0018, 0x0018, 0x1838, 0x1C30,
  0x0FF0, 0x07C0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0F80, 0x0FC0, 0x00C0, 0x00C0, 0x00C0, 0x07F0, 0x07F0,
  0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0,
  0x00C0, 0x00C0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0DE0, 0x0FF8,
  0x0E18, 0x0C0C, 0x0C0C, 0x0C0C, 0x0C0C, 0x0C0C, 0x0C0C, 0x0E18,
  0x0FF8, 0x0DE0, 0x0C00, 0x0C0C, 0x061C, 0x07F8, 0x01F0, 0x0000,
   
  0x0000, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018, 0x07D8, 0x0FF8,
  0x1C38, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818,
  0x1818, 0x1818, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x00C0, 0x00C0, 0x0000, 0x0000, 0x0000, 0x00C0, 0x00C0,
  0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0,
  0x00C0, 0x00C0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x00C0, 0x00C0, 0x0000, 0x0000, 0x0000, 0x00C0, 0x00C0,
  0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0,
  0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00F8, 0x0078, 0x0000,
   
  0x0000, 0x000C, 0x000C, 0x000C, 0x000C, 0x000C, 0x0C0C, 0x060C,
  0x030C, 0x018C, 0x00CC, 0x006C, 0x00FC, 0x019C, 0x038C, 0x030C,
  0x060C, 0x0C0C, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0,
  0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0,
  0x00C0, 0x00C0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x3C7C, 0x7EFF,
  0xE3C7, 0xC183, 0xC183, 0xC183, 0xC183, 0xC183, 0xC183, 0xC183,
  0xC183, 0xC183, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0798, 0x0FF8,
  0x1C38, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818,
  0x1818, 0x1818, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x03C0, 0x0FF0,
  0x0C30, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x0C30,
  0x0FF0, 0x03C0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x03D8, 0x0FF8,
  0x0C38, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x0C38,
  0x0FF8, 0x03D8, 0x0018, 0x0018, 0x0018, 0x0018, 0x0018, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x1BC0, 0x1FF0,
  0x1C30, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1C30,
  0x1FF0, 0x1BC0, 0x1800, 0x1800, 0x1800, 0x1800, 0x1800, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x07B0, 0x03F0,
  0x0070, 0x0030, 0x0030, 0x0030, 0x0030, 0x0030, 0x0030, 0x0030,
  0x0030, 0x0030, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x03E0, 0x03F0,
  0x0E38, 0x0C18, 0x0038, 0x03F0, 0x07C0, 0x0C00, 0x0C18, 0x0E38,
  0x07F0, 0x03E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0080, 0x00C0, 0x00C0, 0x00C0, 0x07F0, 0x07F0,
  0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0,
  0x07C0, 0x0780, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x1818, 0x1818,
  0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1C38,
  0x1FF0, 0x19E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x180C, 0x0C18,
  0x0C18, 0x0C18, 0x0630, 0x0630, 0x0630, 0x0360, 0x0360, 0x0360,
  0x01C0, 0x01C0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x41C1, 0x41C1,
  0x61C3, 0x6363, 0x6363, 0x6363, 0x3636, 0x3636, 0x3636, 0x1C1C,
  0x1C1C, 0x1C1C, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x381C, 0x1C38,
  0x0C30, 0x0660, 0x03C0, 0x03C0, 0x03C0, 0x03C0, 0x0660, 0x0C30,
  0x1C38, 0x381C, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x3018, 0x1830,
  0x1830, 0x1870, 0x0C60, 0x0C60, 0x0CE0, 0x06C0, 0x06C0, 0x0380,
  0x0380, 0x0380, 0x0180, 0x0180, 0x01C0, 0x00F0, 0x0070, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x1FFC, 0x1FFC,
  0x0C00, 0x0600, 0x0300, 0x0180, 0x00C0, 0x0060, 0x0030, 0x0018,
  0x1FFC, 0x1FFC, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0300, 0x0180, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x00C0,
  0x00C0, 0x0060, 0x0060, 0x0030, 0x0060, 0x0040, 0x00C0, 0x00C0,
  0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x0180, 0x0300, 0x0000, 0x0000,
   
  0x0000, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0180, 0x0000,
   
  0x0000, 0x0060, 0x00C0, 0x01C0, 0x0180, 0x0180, 0x0180, 0x0180,
  0x0180, 0x0300, 0x0300, 0x0600, 0x0300, 0x0100, 0x0180, 0x0180,
  0x0180, 0x0180, 0x0180, 0x0180, 0x00C0, 0x0060, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x10F0, 0x1FF8, 0x0F08, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,

   
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x03C0, 0x0C30, 0x1008,
  0x2004, 0x2004, 0x4002, 0x4002, 0x4002, 0x4002, 0x4002, 0x2004,
  0x2004, 0x1008, 0x0C30, 0x03C0, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x03C0, 0x0FF0, 0x1FF8,
  0x3FFC, 0x3FFC, 0x7FFE, 0x7FFE, 0x7FFE, 0x7FFE, 0x7FFE, 0x3FFC,
  0x3FFC, 0x1FF8, 0x0FF0, 0x03C0, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x07E0,
  0x0FF0, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x1818, 0x0FF0,
  0x07E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x07E0,
  0x0FF0, 0x1FF8, 0x1FF8, 0x1FF8, 0x1FF8, 0x1FF8, 0x1FF8, 0x0FF0,
  0x07E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0180, 0x03C0, 0x0660, 0x0C30,
  0x1818, 0x1818, 0x1FF8, 0x1FF8, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0180, 0x03C0, 0x07E0, 0x0FF0,
  0x1FF8, 0x1FF8, 0x1FF8, 0x1FF8, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x1FF8, 0x1FF8, 0x1818, 0x1818,
  0x0C30, 0x0660, 0x03C0, 0x0180, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x1FF8, 0x1FF8, 0x1FF8, 0x1FF8,
  0x0FF0, 0x07E0, 0x03C0, 0x0180, 0x0000, 0x0000, 0x0000, 0x0000,
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x01E0,
  0x01F0, 0x0198, 0x018C, 0x0186, 0x0186, 0x018C, 0x0198, 0x01F0,
  0x01E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x01E0,
  0x01F0, 0x01F8, 0x01FC, 0x01FE, 0x01FE, 0x01FC, 0x01F8, 0x01F0,
  0x01E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0780,
  0x0F80, 0x1980, 0x3180, 0x6180, 0x6180, 0x3180, 0x1980, 0x0F80,
  0x0780, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0780,
  0x0F80, 0x1F80, 0x3F80, 0x7F80, 0x7F80, 0x3F80, 0x1F80, 0x0F80,
  0x0780, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
   
  0x0000, 0x01C0, 0x0220, 0x0220, 0x0140, 0x0630, 0x0808, 0x0808,
  0x0808, 0x0808, 0x0808, 0x0808, 0x0808, 0x0220, 0x0220, 0x0220,
  0x0220, 0x0220, 0x0220, 0x0220, 0x0220, 0x0220, 0x0220, 0x0000,
   
  0x0000, 0x01C0, 0x03E0, 0x03E0, 0x01C0, 0x07F0, 0x0DD8, 0x0DD8,
  0x0DD8, 0x0DD8, 0x0DD8, 0x0DD8, 0x0DD8, 0x0360, 0x0360, 0x0360,
  0x0360, 0x0360, 0x0360, 0x0360, 0x0360, 0x0360, 0x0360, 0x0000,
   
  0x0000, 0x01C0, 0x0220, 0x0220, 0x0140, 0x0630, 0x0808, 0x0808,
  0x0808, 0x1004, 0x2002, 0x2002, 0x0140, 0x0220, 0x0220, 0x0410,
  0x0808, 0x0808, 0x1004, 0x1004, 0x2004, 0x4004, 0x0000, 0x0000,
   
  0x0000, 0x01C0, 0x03E0, 0x03E0, 0x01C0, 0x07F0, 0x0DD8, 0x0DD8,
  0x0DD8, 0x19CC, 0x31C6, 0x61C2, 0x01C0, 0x0360, 0x0360, 0x0670,
  0x0C38, 0x0C18, 0x180C, 0x180C, 0x300C, 0x600C, 0x0000, 0x0000,
};

#line 18 "GLCD_SPI_LPC1700.c"

 




 









 








 




 


 


 

#line 65 "GLCD_SPI_LPC1700.c"

 

 

















 
 

 
static volatile unsigned short Color[2] = {0xFFFF, 0x0000};
static unsigned char Himax;

 





 

static void delay (int cnt) {
  cnt <<= 18;
  while (cnt--);
}







 
static unsigned char spi_tran_man (unsigned char byte, unsigned int mode) {
  unsigned char val = 0;
  int i;

  if (mode == 0x01) { ((0x01 == 0x01) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR |= (1 << 9)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR &= ~(1 << 9))); }
  else             { ((0x00 == 0x01) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR |= (1 << 9)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR &= ~(1 << 9)));  }

  for (i = 7; i >= 0; i--) {
    ((0) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 7)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 7)));
    delay(1);
    if (mode == 0x01) {
      (((byte & (1 << i)) != 0) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 9)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 9)));
    }
    else {
      val |= (((((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & (1 << 9)) != 0) << i);
    }
    ((1) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 7)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 7)));
    delay(1);
  }
  return (val);
}






 

static __inline unsigned char spi_tran (unsigned char byte) {

  ((LPC_SSP_TypeDef *) ((0x40000000UL) + 0x30000) )->DR = byte;
  while (!(((LPC_SSP_TypeDef *) ((0x40000000UL) + 0x30000) )->SR & 0x04));         
  return (((LPC_SSP_TypeDef *) ((0x40000000UL) + 0x30000) )->DR);
}






 

static __inline void wr_cmd (unsigned char cmd) {
  ((0) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));
  spi_tran((0x70) | (0x00) | (0x00));    
  spi_tran(0);
  spi_tran(cmd);
  ((1) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));
}






 

static __inline void wr_dat (unsigned short dat) {
  ((0) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));
  spi_tran((0x70) | (0x00) | (0x02));     
  spi_tran((dat >>   8));                      
  spi_tran((dat & 0xFF));                      
  ((1) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));
}






 

static __inline void wr_dat_start (void) {
  ((0) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));
  spi_tran((0x70) | (0x00) | (0x02));     
}






 

static __inline void wr_dat_stop (void) {

  ((1) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));
}






 

static __inline void wr_dat_only (unsigned short dat) {

  spi_tran((dat >>   8));                      
  spi_tran((dat & 0xFF));                      
}






 

static __inline unsigned short rd_dat (void) {
  unsigned short val = 0;

  ((0) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));
  spi_tran((0x70) | (0x01) | (0x02));     
  spi_tran(0);                                   
  val   = spi_tran(0);                         
  val <<= 8;
  val  |= spi_tran(0);                         
  ((1) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));
  return (val);
}






 

static __inline void wr_reg (unsigned char reg, unsigned short val) {

  wr_cmd(reg);
  wr_dat(val);
}






 

static unsigned short rd_reg (unsigned char reg) {

  wr_cmd(reg);
  return(rd_dat());
}






 

static unsigned short rd_id_man (void) {
  unsigned short val;

   
  ((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL0  &= ~((3 << 18) | (3 << 16) | (3 << 14));
  ((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINMODE0 |= 0x000AA000;
  ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR    |= (1 << 7);       
  ((1) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));                            
  ((1) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 7)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 7)));                            

  ((0) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));
  spi_tran_man ((0x70) | (0x00) | (0x00), 0x01);
  spi_tran_man (0x00, 0x01);
  ((1) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));

  ((0) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));
  spi_tran_man ((0x70) | (0x01) | (0x02), 0x01);
  val = spi_tran_man(0, 0x00);
  ((1) ? (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET = (1 << 6)) : (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOCLR = (1 << 6)));

   
  ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR    &= ~(1 << 7);
  ((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL0  |= (2 << 18) | (2 << 16) | (2 << 14);
  ((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINMODE0 &= ~0x000FF000;

  return (val);
}


 





 

void GLCD_Init (void) {
  unsigned short driverCode;

   
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PCONP       |= 0x00000400;
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PCLKSEL0    |= 0x00200000;

   
  ((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL9 &= 0xF0FFFFFF;
  ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00080) )->FIODIR   |= 0x30000000;
  ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00080) )->FIOSET    = 0x20000000;

   
  ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR   |= 0x00000040;
  ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET    = 0x00000040;
  ((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL0 &= 0xFFF03FFF;
  ((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL0 |= 0x000A8000;

   
   
  ((LPC_SSP_TypeDef *) ((0x40000000UL) + 0x30000) )->CR0        = 0x01C7;
  ((LPC_SSP_TypeDef *) ((0x40000000UL) + 0x30000) )->CPSR       = 0x02;
  ((LPC_SSP_TypeDef *) ((0x40000000UL) + 0x30000) )->CR1        = 0x02;
  
  driverCode = rd_id_man ();
  if (driverCode == 0) {
    driverCode = rd_reg(0x00);
  }

  if (driverCode == 0x47) {              
    Himax = 1;                           
     
    wr_reg(0xEA, 0x00);                  
    wr_reg(0xEB, 0x20);                  
    wr_reg(0xEC, 0x0C);                  
    wr_reg(0xED, 0xC7);                  
    wr_reg(0xE8, 0x38);                  
    wr_reg(0xE9, 0x10);                  
    wr_reg(0xF1, 0x01);                  
    wr_reg(0xF2, 0x10);

     
    wr_reg(0x40, 0x01);
    wr_reg(0x41, 0x00);
    wr_reg(0x42, 0x00);
    wr_reg(0x43, 0x10);
    wr_reg(0x44, 0x0E);
    wr_reg(0x45, 0x24);
    wr_reg(0x46, 0x04);
    wr_reg(0x47, 0x50);
    wr_reg(0x48, 0x02);
    wr_reg(0x49, 0x13);
    wr_reg(0x4A, 0x19);
    wr_reg(0x4B, 0x19);
    wr_reg(0x4C, 0x16);

    wr_reg(0x50, 0x1B);
    wr_reg(0x51, 0x31);
    wr_reg(0x52, 0x2F);
    wr_reg(0x53, 0x3F);
    wr_reg(0x54, 0x3F);
    wr_reg(0x55, 0x3E);
    wr_reg(0x56, 0x2F);
    wr_reg(0x57, 0x7B);
    wr_reg(0x58, 0x09);
    wr_reg(0x59, 0x06);
    wr_reg(0x5A, 0x06);
    wr_reg(0x5B, 0x0C);
    wr_reg(0x5C, 0x1D);
    wr_reg(0x5D, 0xCC);

     
    wr_reg(0x1B, 0x1B);
    wr_reg(0x1A, 0x01);
    wr_reg(0x24, 0x2F);
    wr_reg(0x25, 0x57);
    wr_reg(0x23, 0x88);

     
    wr_reg(0x18, 0x36);                  
    wr_reg(0x19, 0x01);                  
    wr_reg(0x01, 0x00);                  
    wr_reg(0x1F, 0x88);                  
    delay(20);
    wr_reg(0x1F, 0x82);                  
    delay(5);
    wr_reg(0x1F, 0x92);                  
    delay(5);
    wr_reg(0x1F, 0xD2);                  
    delay(5);

     
    wr_reg(0x17, 0x55);                  
    wr_reg(0x00, 0x00);                  

     
    wr_reg(0x2F, 0x11);                  
    wr_reg(0x31, 0x00);
    wr_reg(0x32, 0x00);                  

     
    wr_reg(0x28, 0x38);                  
    delay(20);
    wr_reg(0x28, 0x3C);                  



     wr_reg (0x16, 0xA8);
#line 424 "GLCD_SPI_LPC1700.c"

     
    wr_reg(0x0E, 0x00);                  
    wr_reg(0x0F, 0x00);                  
    wr_reg(0x10, 320 >> 8);              
    wr_reg(0x11, 320 &  0xFF);           
    wr_reg(0x12, 0x00);                  
    wr_reg(0x13, 0x00);                  
  }
  else {
    Himax = 0;                           
     



    wr_reg(0x01, 0x0100);                

    wr_reg(0x02, 0x0700);                
    wr_reg(0x04, 0x0000);                
    wr_reg(0x08, 0x0207);                
    wr_reg(0x09, 0x0000);                
    wr_reg(0x0A, 0x0000);                
    wr_reg(0x0C, 0x0000);                
    wr_reg(0x0D, 0x0000);                
    wr_reg(0x0F, 0x0000);                

     
    wr_reg(0x10, 0x0000);                
    wr_reg(0x11, 0x0000);                
    wr_reg(0x12, 0x0000);                
    wr_reg(0x13, 0x0000);                
    delay(20);                           
    wr_reg(0x10, 0x12B0);                
    wr_reg(0x11, 0x0007);                
    delay(5);                            
    wr_reg(0x12, 0x01BD);                
    delay(5);                            
    wr_reg(0x13, 0x1400);                
    wr_reg(0x29, 0x000E);                
    delay(5);                            
    wr_reg(0x20, 0x0000);                
    wr_reg(0x21, 0x0000);                

     
    switch (driverCode) {
      case 0x5408:                       
        wr_reg(0x30, 0x0B0D);
        wr_reg(0x31, 0x1923);
        wr_reg(0x32, 0x1C26);
        wr_reg(0x33, 0x261C);
        wr_reg(0x34, 0x2419);
        wr_reg(0x35, 0x0D0B);
        wr_reg(0x36, 0x1006);
        wr_reg(0x37, 0x0610);
        wr_reg(0x38, 0x0706);
        wr_reg(0x39, 0x0304);
        wr_reg(0x3A, 0x0E05);
        wr_reg(0x3B, 0x0E01);
        wr_reg(0x3C, 0x010E);
        wr_reg(0x3D, 0x050E);
        wr_reg(0x3E, 0x0403);
        wr_reg(0x3F, 0x0607);
        break;

      case 0x9325:                       
        wr_reg(0x0030,0x0000);
        wr_reg(0x0031,0x0607);
        wr_reg(0x0032,0x0305);
        wr_reg(0x0035,0x0000);
        wr_reg(0x0036,0x1604);
        wr_reg(0x0037,0x0204);
        wr_reg(0x0038,0x0001);
        wr_reg(0x0039,0x0707);
        wr_reg(0x003C,0x0000);
        wr_reg(0x003D,0x000F);
        break;

      case 0x9320:                       
      default:                           
        wr_reg(0x30, 0x0006);
        wr_reg(0x31, 0x0101);
        wr_reg(0x32, 0x0003);
        wr_reg(0x35, 0x0106);
        wr_reg(0x36, 0x0B02);
        wr_reg(0x37, 0x0302);
        wr_reg(0x38, 0x0707);
        wr_reg(0x39, 0x0007);
        wr_reg(0x3C, 0x0600);
        wr_reg(0x3D, 0x020B);
        break;
    }

     
    wr_reg(0x50, 0x0000);                
    wr_reg(0x51, (240-1));            
    wr_reg(0x52, 0x0000);                
    wr_reg(0x53, (320-1));             

     
    switch (driverCode) {
      case 0x5408:                       
      case 0x9325:                       

        wr_reg(0x60, 0x2700);



        break;

      case 0x9320:                       
      default:                           

        wr_reg(0x60, 0xA700);



        break;
    }
    wr_reg(0x61, 0x0001);                
    wr_reg(0x6A, 0x0000);                

     
    wr_reg(0x80, 0x0000);
    wr_reg(0x81, 0x0000);
    wr_reg(0x82, 0x0000);
    wr_reg(0x83, 0x0000);
    wr_reg(0x84, 0x0000);
    wr_reg(0x85, 0x0000);

     
    wr_reg(0x90, 0x0010);
    wr_reg(0x92, 0x0000);
    wr_reg(0x93, 0x0003);
    wr_reg(0x95, 0x0110);
    wr_reg(0x97, 0x0000);
    wr_reg(0x98, 0x0000);

    
 

     
    wr_reg(0x03, 0x1038);





    wr_reg(0x07, 0x0137);                
  }
  ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00080) )->FIOSET = 0x10000000;
}









 

void GLCD_SetWindow (unsigned int x, unsigned int y, unsigned int w, unsigned int h) {
  unsigned int xe, ye;

  if (Himax) {
    xe = x+w-1;
    ye = y+h-1;

    wr_reg(0x02, x  >>    8);            
    wr_reg(0x03, x  &  0xFF);            
    wr_reg(0x04, xe >>    8);            
    wr_reg(0x05, xe &  0xFF);            
  
    wr_reg(0x06, y  >>    8);            
    wr_reg(0x07, y  &  0xFF);            
    wr_reg(0x08, ye >>    8);            
    wr_reg(0x09, ye &  0xFF);            
  }
  else {

    wr_reg(0x50, y);                     
    wr_reg(0x51, y+h-1);                 
    wr_reg(0x52, x);                     
    wr_reg(0x53, x+w-1);                 
    wr_reg(0x20, y);
    wr_reg(0x21, x);
#line 619 "GLCD_SPI_LPC1700.c"
  }
}






 

void GLCD_WindowMax (void) {
  GLCD_SetWindow (0, 0, 320, 240);
}







 

void GLCD_PutPixel (unsigned int x, unsigned int y) {

  if (Himax) {
    wr_reg(0x02, x >>    8);             
    wr_reg(0x03, x &  0xFF);             
    wr_reg(0x04, x >>    8);             
    wr_reg(0x05, x &  0xFF);             
  
    wr_reg(0x06, y >>    8);             
    wr_reg(0x07, y &  0xFF);             
    wr_reg(0x08, y >>    8);             
    wr_reg(0x09, y &  0xFF);             
  }
  else {

    wr_reg(0x20, y);
    wr_reg(0x21, x);




  }

  wr_cmd(0x22);
  wr_dat(Color[1]);
}






 

void GLCD_SetTextColor (unsigned short color) {

  Color[1] = color;
}






 

void GLCD_SetBackColor (unsigned short color) {

  Color[0] = color;
}

void GLCD_Clear (unsigned short color) {
  unsigned int i;

  GLCD_WindowMax();
  wr_cmd(0x22);
  wr_dat_start();

  for(i = 0; i < (320*240); i++)
    wr_dat_only(color);
  wr_dat_stop();
}










 

void GLCD_DrawChar (unsigned int x, unsigned int y, unsigned int cw, unsigned int ch, unsigned char *c) {
  unsigned int i, j, k, pixs;

  GLCD_SetWindow(x, y, cw, ch);

  wr_cmd(0x22);
  wr_dat_start();

  k  = (cw + 7)/8;

  if (k == 1) {
    for (j = 0; j < ch; j++) {
      pixs = *(unsigned char  *)c;
      c += 1;
      
      for (i = 0; i < cw; i++) {
        wr_dat_only (Color[(pixs >> i) & 1]);
      }
    }
  }
  else if (k == 2) {
    for (j = 0; j < ch; j++) {
      pixs = *(unsigned short *)c;
      c += 2;
      
      for (i = 0; i < cw; i++) {
        wr_dat_only (Color[(pixs >> i) & 1]);
      }
    }
  }
  wr_dat_stop();
}









 

void GLCD_DisplayChar (unsigned int ln, unsigned int col, unsigned char fi, unsigned char c) {

  c -= 32;
  switch (fi) {
    case 0:   
      GLCD_DrawChar(col *  6, ln *  8,  6,  8, (unsigned char *)&Font_6x8_h  [c * 8]);
      break;
    case 1:   
      GLCD_DrawChar(col * 16, ln * 24, 16, 24, (unsigned char *)&Font_16x24_h[c * 24]);
      break;
  }
}









 

void GLCD_DisplayString (unsigned int ln, unsigned int col, unsigned char fi, unsigned char *s) {

  while (*s) {
    GLCD_DisplayChar(ln, col++, fi, *s++);
  }
}







 

void GLCD_ClearLn (unsigned int ln, unsigned char fi) {
  unsigned char i;
  unsigned char buf[60];

  GLCD_WindowMax();
  switch (fi) {
    case 0:   
      for (i = 0; i < (320+5)/6; i++)
        buf[i] = ' ';
      buf[i+1] = 0;
      break;
    case 1:   
      for (i = 0; i < (320+15)/16; i++)
        buf[i] = ' ';
      buf[i+1] = 0;
      break;
  }
  GLCD_DisplayString (ln, 0, fi, buf);
}









 

void GLCD_Bargraph (unsigned int x, unsigned int y, unsigned int w, unsigned int h, unsigned int val) {
  int i,j;

  val = (val * w) >> 10;                 
  GLCD_SetWindow(x, y, w, h);
  wr_cmd(0x22);
  wr_dat_start();
  for (i = 0; i < h; i++) {
    for (j = 0; j <= w-1; j++) {
      if(j >= val) {
        wr_dat_only(Color[0]);
      } else {
        wr_dat_only(Color[1]);
      }
    }
  }
  wr_dat_stop();
}





























 






 

void GLCD_ScrollVertical (unsigned int dy) {
#line 900 "GLCD_SPI_LPC1700.c"
}






 
void GLCD_WrCmd (unsigned char cmd) {
  wr_cmd (cmd);
}







 
void GLCD_WrReg (unsigned char reg, unsigned short val) {
  wr_reg (reg, val);
}




 




 





 
void GLCD_DrawCharCutout(unsigned int x, unsigned int y, unsigned int cw, unsigned int ch, unsigned char *c, unsigned short color) {
    unsigned int i, j, k, pixs;

    GLCD_SetWindow(x, y, cw, ch);

    wr_cmd(0x22);
    wr_dat_start();

    k = (cw + 7) / 8;

    if (k == 1) {
        for (j = 0; j < ch; j++) {
            pixs = *(unsigned char *)c;
            c += 1;

            for (i = 0; i < cw; i++) {
                if ((pixs >> i) & 1) {
                    wr_dat_only(color);  
                } else {
                     
                    (void)rd_dat();
                }
            }
        }
    } else if (k == 2) {
        for (j = 0; j < ch; j++) {
            pixs = *(unsigned short *)c;
            c += 2;

            for (i = 0; i < cw; i++) {
                if ((pixs >> i) & 1) {
                    wr_dat_only(color);  
                } else {
                    
                    (void)rd_dat();
                }
            }
        }
    }
    wr_dat_stop();
}
void GLCD_DisplayCharCutout (unsigned int ln, unsigned int col, unsigned char fi, unsigned char c, unsigned short color) {

  c -= 32;
  switch (fi) {
    case 0:   
      GLCD_DrawCharCutout(col *  6, ln *  8,  6,  8, (unsigned char *)&Font_6x8_h  [c * 8], color);
      break;
    case 1:   
      GLCD_DrawCharCutout(col * 16, ln * 24, 16, 24, (unsigned char *)&Font_16x24_h[c * 24], color);
      break;
  }
}
void GLCD_DisplayStringCutout (unsigned int ln, unsigned int col, unsigned char fi, unsigned char *s, unsigned short color) {

  while (*s) {
    GLCD_DisplayCharCutout(ln, col++, fi, *s++, color);
  }
}














 
int GLCD_Bitmap(int x, int y, unsigned int w, unsigned int h, const unsigned char *bitmap) {
    int i, j;
    int startx = 0, endx = w;
    int starty = 0, endy = h;
    const unsigned short *bitmap_ptr = (const unsigned short *)bitmap;
    unsigned int draw_width = endx - startx;
    unsigned int draw_height = endy - starty;
	
	  
    if (!bitmap || w == 0 || h == 0) {
        return -1;  
    }

    
    if (x >= 320 || x + (signed int)w < 0 || 
        y >= 240 || y + (signed int)h < 0) {
        return -2;  
    }

    
    if (x + (signed int)w > 320) {  
        endx = 320 - x;
    } else if (x < 0) {  
        startx = -x;
        x = 0;
    }

    
    if (y + (signed int)h > 240) {  
        endy = 240 - y;
    } else if (y < 0) {  
        starty = -y;
        y = 0;
    }

	  
    draw_width = endx - startx;
    draw_height = endy - starty;
		
    
    GLCD_SetWindow(x, y, draw_width, draw_height);

    
    wr_cmd(0x22);
    wr_dat_start();

    
    for (i = starty * w; i < endy * w; i += w) {
        
        for (j = startx; j < endx; j++) {
            wr_dat_only(bitmap_ptr[i + j]);
        }
    }
    wr_dat_stop();

    return 0;  
}














 
int GLCD_Bitmap_Region(int x, int y, unsigned int w, unsigned int h, 
                      const unsigned char *bitmap,
                      int rx, int ry, unsigned int rw, unsigned int rh) {
    int i, j;
    const unsigned short *bitmap_ptr = (const unsigned short *)bitmap;
    


    
    int region_start_x = rx;
    int region_start_y = ry;
    int region_end_x = rx + rw;
    int region_end_y = ry + rh;
	
		
    int bitmap_start_x = region_start_x - x;
    int bitmap_start_y = region_start_y - y;
    int draw_width = region_end_x - region_start_x;
    int draw_height = region_end_y - region_start_y;

		
    if (!bitmap || w == 0 || h == 0 || rw == 0 || rh == 0) {
        return -1;  
    }
		
    
    if (region_start_x < x) region_start_x = x;
    if (region_start_y < y) region_start_y = y;
    if (region_end_x > x + w) region_end_x = x + w;
    if (region_end_y > y + h) region_end_y = y + h;

    
    if (region_start_x >= region_end_x || region_start_y >= region_end_y) {
        return -2;  
    }

    

    
    if (region_start_x >= 320 || region_end_x <= 0 ||
        region_start_y >= 240 || region_end_y <= 0) {
        return -3;  
    }

    
    if (region_start_x < 0) {
        bitmap_start_x -= region_start_x;
        draw_width += region_start_x;
        region_start_x = 0;
    }
    if (region_end_x > 320) {
        draw_width -= (region_end_x - 320);
    }
    if (region_start_y < 0) {
        bitmap_start_y -= region_start_y;
        draw_height += region_start_y;
        region_start_y = 0;
    }
    if (region_end_y > 240) {
        draw_height -= (region_end_y - 240);
    }

    
    GLCD_SetWindow(region_start_x, region_start_y, draw_width, draw_height);
    
    
    wr_cmd(0x22);
    wr_dat_start();
    
    
    for (i = bitmap_start_y; i < bitmap_start_y + draw_height; i++) {
        
        int row_offset = i * w;
        
        for (j = bitmap_start_x; j < bitmap_start_x + draw_width; j++) {
            wr_dat_only(bitmap_ptr[row_offset + j]);
        }
    }
    
    wr_dat_stop();
    return 0;  
}



 



static void flush_buffer(unsigned short *pixel_buffer, int *buffer_count) {
		int k = 0;
    if (*buffer_count > 0) {
        wr_dat_start();
        for (k = 0; k < *buffer_count; k++) {
            wr_dat_only(pixel_buffer[k]);
        }
        wr_dat_stop();
        *buffer_count = 0;
    }
}

int GLCD_BitmapCutout(int x, int y, unsigned int w, unsigned int h, const unsigned char *bitmap, unsigned short alpha_color) {
    int i, j;
    int startx = 0, endx = w;
    int starty = 0, endy = h;
    const unsigned short *bitmap_ptr = (const unsigned short *)bitmap;
    int consecutive_transparent = 0;
	  
    unsigned int draw_width;
    unsigned int draw_height;
	
	  
    unsigned short pixel_buffer[32];
    int buffer_count = 0;
	
	  
    if (!bitmap || w == 0 || h == 0) {
        return -1;  
    }
    
    
    if (x >= 320 || x + (signed int)w < 0 || 
        y >= 240 || y + (signed int)h < 0) {
        return -2;  
    }

    
    if (x + (signed int)w > 320) {  
        endx = 320 - x;
    } else if (x < 0) {  
        startx = -x;
        x = 0;
    }

    
    if (y + (signed int)h > 240) {  
        endy = 240 - y;
    } else if (y < 0) {  
        starty = -y;
        y = 0;
    }

    
    draw_width = endx - startx;
    draw_height = endy - starty;

    
    GLCD_SetWindow(x, y, draw_width, draw_height);
    wr_cmd(0x22);

    
    for (i = starty * w; i < endy * w; i += w) {
        for (j = startx; j < endx; j++) {
            unsigned short current_pixel = bitmap_ptr[i + j];
            
            if (current_pixel != alpha_color) {
                
                pixel_buffer[buffer_count++] = current_pixel;
                
                
                if (buffer_count >= 32) {
                    flush_buffer(pixel_buffer, &buffer_count);
                }
                consecutive_transparent = 0;
            } else {
                
                if (buffer_count > 0) {
                    flush_buffer(pixel_buffer, &buffer_count);
                }
                
                consecutive_transparent++;
                if (consecutive_transparent == 1) {
                    
                    (void)rd_dat();
                }
            }
        }
        
        
        if (buffer_count > 0) {
            flush_buffer(pixel_buffer, &buffer_count);
        }
        consecutive_transparent = 0;  
    }

    return 0;  
}



 
void GLCD_PutPixelc (int x, int y, unsigned short color) {

	
	if (x >= 320 || y >= 240 || x < 0 || y < 0) {
			return;  
	}
				
  if (Himax) {
    wr_reg(0x02, x >>    8);             
    wr_reg(0x03, x &  0xFF);             
    wr_reg(0x04, x >>    8);             
    wr_reg(0x05, x &  0xFF);             
  
    wr_reg(0x06, y >>    8);             
    wr_reg(0x07, y &  0xFF);             
    wr_reg(0x08, y >>    8);             
    wr_reg(0x09, y &  0xFF);             
  }
  else {

    wr_reg(0x20, y);
    wr_reg(0x21, x);




  }

  wr_cmd(0x22);
  wr_dat(color);
}











 
int GLCD_DrawBox(int x, int y, unsigned int w, unsigned int h, unsigned short color) {
    int i;
	
		
    int startx = (x < 0) ? 0 : x;
    int starty = (y < 0) ? 0 : y;
    int endx = (x + w > 320) ? 320 : x + w;
    int endy = (y + h > 240) ? 240 : y + h;
	
	  
    unsigned int clipped_w = endx - startx;
    unsigned int clipped_h = endy - starty;
	
	  
    if (x >= 320 || x + (signed int)w <= 0 || 
        y >= 240 || y + (signed int)h <= 0) {
        return -1;  
    }
				
    
    if (clipped_w == 1) {
        
        GLCD_SetWindow(startx, starty, 1, clipped_h);
        wr_cmd(0x22);
        wr_dat_start();
        for (i = 0; i < clipped_h; i++) {
            wr_dat_only(color);
        }
        wr_dat_stop();
        return 0;
    }
    
    if (clipped_h == 1) {
        
        GLCD_SetWindow(startx, starty, clipped_w, 1);
        wr_cmd(0x22);
        wr_dat_start();
        for (i = 0; i < clipped_w; i++) {
            wr_dat_only(color);
        }
        wr_dat_stop();
        return 0;
    }
		
		
    if (starty < endy) {
        
        GLCD_SetWindow(startx, starty, clipped_w, 1);
        wr_cmd(0x22);
        wr_dat_start();
        for (i = 0; i < clipped_w; i++) {
            wr_dat_only(color);
        }
        wr_dat_stop();

        if (clipped_h > 1) {
            
            GLCD_SetWindow(startx, endy - 1, clipped_w, 1);
            wr_cmd(0x22);
            wr_dat_start();
            for (i = 0; i < clipped_w; i++) {
                wr_dat_only(color);
            }
            wr_dat_stop();
        }
    }

    
    if (clipped_h > 2 && startx < endx) {
        
        GLCD_SetWindow(startx, starty + 1, 1, clipped_h - 2);
        wr_cmd(0x22);
        wr_dat_start();
        for (i = 0; i < clipped_h - 2; i++) {
            wr_dat_only(color);
        }
        wr_dat_stop();

        if (clipped_w > 1) {
            
            GLCD_SetWindow(endx - 1, starty + 1, 1, clipped_h - 2);
            wr_cmd(0x22);
            wr_dat_start();
            for (i = 0; i < clipped_h - 2; i++) {
                wr_dat_only(color);
            }
            wr_dat_stop();
        }
    }

    return 0;  
}

void GLCD_DrawBoxOld(int x, int y, unsigned int w, unsigned int h, unsigned short color) {
    int i;
	
	  
    GLCD_SetWindow(x, y, w, 1); 
    wr_cmd(0x22);
    wr_dat_start();
    for (i = 0; i < w; i++) {
        wr_dat_only(color);
    }
    wr_dat_stop();

    
    GLCD_SetWindow(x, y + h - 1, w, 1); 
    wr_cmd(0x22);
    wr_dat_start();
    for (i = 0; i < w; i++) {
        wr_dat_only(color);
    }
    wr_dat_stop();

    
    GLCD_SetWindow(x, y, 1, h); 
    wr_cmd(0x22);
    wr_dat_start();
    for (i = 0; i < h; i++) {
        wr_dat_only(color);
    }
    wr_dat_stop();

    
    GLCD_SetWindow(x + w - 1, y, 1, h); 
    wr_cmd(0x22);
    wr_dat_start();
    for (i = 0; i < h; i++) {
        wr_dat_only(color);
    }
    wr_dat_stop();
}







 
void GLCD_DrawLine(int x1, int y1, int x2, int y2, unsigned short color) {
    int dx, dy, incrE, incrNE, d, x, y;
    int steep = abs(y2 - y1) > abs(x2 - x1);
		int stepY; 
    
    
    if (steep) {
        int temp;
        temp = x1; x1 = y1; y1 = temp;
        temp = x2; x2 = y2; y2 = temp;
    }
    
    
    if (x1 > x2) {
        int temp;
        temp = x1; x1 = x2; x2 = temp;
        temp = y1; y1 = y2; y2 = temp;
    }
    
    dx = x2 - x1;
    dy = abs(y2 - y1);
    d = (2 * dy) - dx;
    incrE = 2 * dy;
    incrNE = 2 * (dy - dx);
    
    y = y1;
    
		if (y1 < y2){
			stepY = 1;
		} else {
			stepY = -1;
		}
    
    for (x = x1; x <= x2; x++) {
        if (steep) {
            GLCD_PutPixelc(y, x, color);
        } else {
            GLCD_PutPixelc(x, y, color);
        }
        
        if (d <= 0) {
            d += incrE;
        } else {
            y += stepY;
            d += incrNE;
        }
    }
}








 



int isPixelOnScreen(int x, int y) {
    return (x >= 0 && x < 320 && y >= 0 && y < 240);
}

void plotCirclePoints(int xc, int yc, int x, int y, unsigned short color) {
		
    int points[8][2];
		int i = 0;
	
	  
    points[0][0] = xc + x; points[0][1] = yc + y;
    points[1][0] = xc - x; points[1][1] = yc + y;
    points[2][0] = xc + x; points[2][1] = yc - y;
    points[3][0] = xc - x; points[3][1] = yc - y;
    points[4][0] = xc + y; points[4][1] = yc + x;
    points[5][0] = xc - y; points[5][1] = yc + x;
    points[6][0] = xc + y; points[6][1] = yc - x;
    points[7][0] = xc - y; points[7][1] = yc - x;
    
    
    for ( i = 0; i < 8; i++) {
        if (points[i][0] >= 0 && points[i][0] < 320 &&
            points[i][1] >= 0 && points[i][1] < 240) {
            GLCD_PutPixelc(points[i][0], points[i][1], color);
        }
    }
}

void GLCD_DrawCircle(int xc, int yc, int radius, unsigned short color) {
    int x = 0;
    int y = radius;
    int d = 3 - 2 * radius;

    
    if (xc + radius < 0 || xc - radius >= 320 ||
        yc + radius < 0 || yc - radius >= 240) {
        return;  
    }
    
    
    plotCirclePoints(xc, yc, x, y, color);
    
    while (y >= x) {
        x++;
        
        
        if (d > 0) {
            y--;
            d = d + 4 * (x - y) + 10;
        } else {
            d = d + 4 * x + 6;
        }
        
        
        plotCirclePoints(xc, yc, x, y, color);
    }
}








 

void drawHorizontalLine(int x1, int x2, int y, unsigned short color) {
		int i;
		GLCD_SetWindow(x1, y, x2 - x1 + 1, 1); 
		wr_cmd(0x22);
		wr_dat_start();
		for (i = x1; i <= x2; i++) {
				wr_dat_only(color); 
		}
		wr_dat_stop();
}

void GLCD_DrawFilledCircle(int xc, int yc, int radius, unsigned short color) {
    int x = 0;
    int y = radius;
    int d = 3 - 2 * radius;
    
    
    while (y >= x) {
        
        drawHorizontalLine(xc - x, xc + x, yc + y, color);
        drawHorizontalLine(xc - x, xc + x, yc - y, color);
        drawHorizontalLine(xc - y, xc + y, yc + x, color);
        drawHorizontalLine(xc - y, xc + y, yc - x, color);
        
        x++;
        
        if (d > 0) {
            y--;
            d = d + 4 * (x - y) + 10;
        } else {
            d = d + 4 * x + 6;
        }
    }
}




 
int GLCD_FillBox(int x, int y, unsigned int w, unsigned int h, unsigned short color) {
	  
    int startx = (x < 0) ? 0 : x;
    int starty = (y < 0) ? 0 : y;
    int endx = (x + w > 320) ? 320 : x + w;
    int endy = (y + h > 240) ? 240 : y + h;
		unsigned int i;
    unsigned int total_pixels;
	
    
    unsigned int clipped_w = endx - startx;
    unsigned int clipped_h = endy - starty;
	
	    
    if (x >= 320 || x + (signed int)w <= 0 || 
        y >= 240 || y + (signed int)h <= 0) {
        return -2;  
    }
				
		
    GLCD_SetWindow(startx, starty, clipped_w, clipped_h);
    wr_cmd(0x22);
    wr_dat_start();

    
    total_pixels = clipped_w * clipped_h;

    
    for (i = 0; i < total_pixels; i++) {
        wr_dat_only(color);
    }

    wr_dat_stop();
    return 0;  
}
	


 





typedef struct {
    int x;
    int y;
} BoxCoord;


static int manhattan_dist(int x1, int y1, int x2, int y2) {
    return abs(x1 - x2) + abs(y1 - y2);
}


void transition_screen(unsigned short color, int pattern, int delay_ms) {
    BoxCoord box_order[(320 / 16) * (240 / 16)];
    int total_boxes = (320 / 16) * (240 / 16);
    int box_count = 0;
    int center_x = (320 / 16) / 2;
    int center_y = (240 / 16) / 2;
    int x, y, i, j;
    int dist1, dist2;
    BoxCoord temp;
    
    
    switch(pattern) {
        case 0:
            x = 0;
            y = 0;
            for(x = 0; x < (320 / 16); x++) {
                for(y = 0; y < (240 / 16); y++) {
                    box_order[box_count].x = x;
                    box_order[box_count].y = y;
                    box_count++;
                }
            }
            break;
            
        case 1:
            x = (320 / 16) - 1;
            y = 0;
            for(x = (320 / 16) - 1; x >= 0; x--) {
                for(y = 0; y < (240 / 16); y++) {
                    box_order[box_count].x = x;
                    box_order[box_count].y = y;
                    box_count++;
                }
            }
            break;
            
        case 2:
            x = 0;
            y = 0;
            for(y = 0; y < (240 / 16); y++) {
                for(x = 0; x < (320 / 16); x++) {
                    box_order[box_count].x = x;
                    box_order[box_count].y = y;
                    box_count++;
                }
            }
            break;
            
        case 3:
            x = 0;
            y = (240 / 16) - 1;
            for(y = (240 / 16) - 1; y >= 0; y--) {
                for(x = 0; x < (320 / 16); x++) {
                    box_order[box_count].x = x;
                    box_order[box_count].y = y;
                    box_count++;
                }
            }
            break;
            
        case 4:
        case 5:
            x = 0;
            y = 0;
            
            for(y = 0; y < (240 / 16); y++) {
                for(x = 0; x < (320 / 16); x++) {
                    box_order[box_count].x = x;
                    box_order[box_count].y = y;
                    box_count++;
                }
            }
            
            for(i = 0; i < total_boxes - 1; i++) {
                for(j = 0; j < total_boxes - i - 1; j++) {
                    dist1 = manhattan_dist(box_order[j].x, box_order[j].y, center_x, center_y);
                    dist2 = manhattan_dist(box_order[j+1].x, box_order[j+1].y, center_x, center_y);
                    
                    if((pattern == 4 && dist1 > dist2) ||
                       (pattern == 5 && dist1 < dist2)) {
                        temp = box_order[j];
                        box_order[j] = box_order[j+1];
                        box_order[j+1] = temp;
                    }
                }
            }
            break;
    }
    
    
    i = 0;
    for(i = 0; i < total_boxes; i++) {
        GLCD_FillBox(
            box_order[i].x * 16,
            box_order[i].y * 16,
            16,
            16,
            color
        );
        
        if(delay_ms > 0) {
            delay(delay_ms);  
        }
    }
}
