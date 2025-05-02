#line 1 "RTE\\Device\\LPC1768\\system_LPC17xx.c"
 





















 


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






 
#line 27 "RTE\\Device\\LPC1768\\system_LPC17xx.c"
#line 1 ".\\USBAudio\\LPC17xx.h"























 









 



 

 
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







 
#line 105 ".\\USBAudio\\LPC17xx.h"
#line 1 ".\\USBAudio\\system_LPC17xx.h"
 





















 









#line 34 ".\\USBAudio\\system_LPC17xx.h"



 

extern uint32_t SystemFrequency;      










 
extern void SystemInit (void);









 
extern void SystemCoreClockUpdate (void);







 

#line 106 ".\\USBAudio\\LPC17xx.h"


 
 
 


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



 
 
 
 
#line 903 ".\\USBAudio\\LPC17xx.h"

 
#line 924 ".\\USBAudio\\LPC17xx.h"

 
#line 938 ".\\USBAudio\\LPC17xx.h"

 
#line 951 ".\\USBAudio\\LPC17xx.h"

 







 
 
 
#line 1010 ".\\USBAudio\\LPC17xx.h"



 

#line 28 "RTE\\Device\\LPC1768\\system_LPC17xx.c"




 



 


























































































































































































































































 





 

#line 308 "RTE\\Device\\LPC1768\\system_LPC17xx.c"













 





 



 



 














































 







 



 






 





 
#line 425 "RTE\\Device\\LPC1768\\system_LPC17xx.c"



 




 


 
uint32_t SystemCoreClock = (((2ULL * (((0x00050063 ) & 0x7FFF) + 1) * ( (12000000UL))) / (((0x00050063 >> 16) & 0x00FF) + 1)) / (((0x00000003 ) & 0x00FF) + 1)); 



 




 









 void SystemCoreClockUpdate (void)             
{
   
  if (((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT >> 24) & 3) == 3) {  
    switch (((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CLKSRCSEL & 0x03) {
      case 0:                                 
      case 3:                                 
        SystemCoreClock = (( 4000000UL) *
                          ((2ULL * ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT & 0x7FFF) + 1)))  /
                          (((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT >> 16) & 0xFF) + 1)       /
                          ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1));
        break;
      case 1:                                 
        SystemCoreClock = (( (12000000UL)) *
                          ((2ULL * ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT & 0x7FFF) + 1)))  /
                          (((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT >> 16) & 0xFF) + 1)       /
                          ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1));
        break;
      case 2:                                 
        SystemCoreClock = (( 32768UL) *
                          ((2ULL * ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT & 0x7FFF) + 1)))  /
                          (((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT >> 16) & 0xFF) + 1)       /
                          ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1));
        break;
    }
  } else {
    switch (((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CLKSRCSEL & 0x03) {
      case 0:                                 
      case 3:                                 
        SystemCoreClock = ( 4000000UL) / ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1);
        break;
      case 1:                                 
        SystemCoreClock = ( (12000000UL)) / ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1);
        break;
      case 2:                                 
        SystemCoreClock = ( 32768UL) / ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1);
        break;
    }
  }

}









 
void SystemInit (void)
{

  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->SCS       = 0x00000020;
  if (((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->SCS & (1 << 5)) {              
    while ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->SCS & (1<<6)) == 0); 
  }

  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG   = 0x00000003;       
  

 
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PCLKSEL0  = 0x00000000;      
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PCLKSEL1  = 0x00000000;

  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CLKSRCSEL = 0x00000001;     


  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0CFG   = 0x00050063;       
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0FEED  = 0xAA;
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0FEED  = 0x55;

  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0CON   = 0x01;              
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0FEED  = 0xAA;
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0FEED  = 0x55;
  while (!(((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT & (1<<26))); 

  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0CON   = 0x03;              
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0FEED  = 0xAA;
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0FEED  = 0x55;
  while ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT & ((1<<25) | (1<<24))) != ((1<<25) | (1<<24)));   



  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1CFG   = 0x00000023;
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1FEED  = 0xAA;
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1FEED  = 0x55;

  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1CON   = 0x01;              
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1FEED  = 0xAA;
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1FEED  = 0x55;
  while (!(((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1STAT & (1<<10))); 

  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1CON   = 0x03;              
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1FEED  = 0xAA;
  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1FEED  = 0x55;
  while ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL1STAT & ((1<< 9) | (1<< 8))) != ((1<< 9) | (1<< 8)));   




  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PCONP     = 0x042887DE;         

  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CLKOUTCFG = 0x00000000;     



  ((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->FLASHCFG  = (((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->FLASHCFG & ~0x0000F000) | 0x00004000;

}











 





 
uint32_t SystemFrequency = ( 4000000UL);  

void SystemClockUpdate (void) {
	 
	if (((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT >> 24)&3)==3) { 
		switch (((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CLKSRCSEL & 0x03) {
			case 0:                            
			case 3:                            
				SystemFrequency = (( 4000000UL) * 
				                  (((2 * ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT & 0x7FFF) + 1))) /
				                  (((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT >> 16) & 0xFF) + 1))   /
				                  ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1));
				break;
			case 1:                            
				SystemFrequency = (( (12000000UL)) * 
				                  (((2 * ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT & 0x7FFF) + 1))) /
				                  (((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT >> 16) & 0xFF) + 1))   /
				                  ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1));
				break;
			case 2:                            
				SystemFrequency = (( 32768UL) * 
				                  (((2 * ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT & 0x7FFF) + 1))) /
				                  (((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->PLL0STAT >> 16) & 0xFF) + 1))   /
				                  ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1));
				break;
		}
		
	} else {
		switch (((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CLKSRCSEL & 0x03) {
			case 0:                            
			case 3:                            
				SystemFrequency = ( 4000000UL) / ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1);
				break;
			case 1:                            
				SystemFrequency = ( (12000000UL)) / ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1);
				break;
			case 2:                            
				SystemFrequency = ( 32768UL) / ((((LPC_SC_TypeDef *) ((0x40080000UL) + 0x7C000) )->CCLKCFG & 0xFF)+ 1);
				break;
		}
	}
}


 



 
