#line 1 "USBAudio\\usbuser.c"
















 

#line 1 "USBAudio\\type.h"










 
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






 
#line 13 "USBAudio\\type.h"

















typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus;
typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;

#line 20 "USBAudio\\usbuser.c"

#line 1 "USBAudio\\usb.h"
















 





typedef __packed union {
  uint16_t W;
  __packed struct {
    uint8_t L;
    uint8_t H;
  } WB;
} WORD_BYTE;


 



 





 





 
typedef __packed union _REQUEST_TYPE {
  __packed struct _BM {
    uint8_t Recipient : 5;
    uint8_t Type      : 2;
    uint8_t Dir       : 1;
  } BM;
  uint8_t B;
} REQUEST_TYPE;

 
#line 70 "USBAudio\\usb.h"

 




 



 
typedef __packed struct _USB_SETUP_PACKET {
  REQUEST_TYPE bmRequestType;
  uint8_t         bRequest;
  WORD_BYTE    wValue;
  WORD_BYTE    wIndex;
  uint16_t         wLength;
} USB_SETUP_PACKET;


 
#line 102 "USBAudio\\usb.h"

 
#line 116 "USBAudio\\usb.h"

 





 


 




 
#line 147 "USBAudio\\usb.h"

 
typedef __packed struct _USB_DEVICE_DESCRIPTOR {
  uint8_t  bLength;
  uint8_t  bDescriptorType;
  uint16_t  bcdUSB;
  uint8_t  bDeviceClass;
  uint8_t  bDeviceSubClass;
  uint8_t  bDeviceProtocol;
  uint8_t  bMaxPacketSize0;
  uint16_t  idVendor;
  uint16_t  idProduct;
  uint16_t  bcdDevice;
  uint8_t  iManufacturer;
  uint8_t  iProduct;
  uint8_t  iSerialNumber;
  uint8_t  bNumConfigurations;
} USB_DEVICE_DESCRIPTOR;

 
typedef __packed struct _USB_DEVICE_QUALIFIER_DESCRIPTOR {
  uint8_t  bLength;
  uint8_t  bDescriptorType;
  uint16_t  bcdUSB;
  uint8_t  bDeviceClass;
  uint8_t  bDeviceSubClass;
  uint8_t  bDeviceProtocol;
  uint8_t  bMaxPacketSize0;
  uint8_t  bNumConfigurations;
  uint8_t  bReserved;
} USB_DEVICE_QUALIFIER_DESCRIPTOR;

 
typedef __packed struct _USB_CONFIGURATION_DESCRIPTOR {
  uint8_t  bLength;
  uint8_t  bDescriptorType;
  uint16_t  wTotalLength;
  uint8_t  bNumInterfaces;
  uint8_t  bConfigurationValue;
  uint8_t  iConfiguration;
  uint8_t  bmAttributes;
  uint8_t  bMaxPower;
} USB_CONFIGURATION_DESCRIPTOR;

 
typedef __packed struct _USB_INTERFACE_DESCRIPTOR {
  uint8_t  bLength;
  uint8_t  bDescriptorType;
  uint8_t  bInterfaceNumber;
  uint8_t  bAlternateSetting;
  uint8_t  bNumEndpoints;
  uint8_t  bInterfaceClass;
  uint8_t  bInterfaceSubClass;
  uint8_t  bInterfaceProtocol;
  uint8_t  iInterface;
} USB_INTERFACE_DESCRIPTOR;

 
typedef __packed struct _USB_ENDPOINT_DESCRIPTOR {
  uint8_t  bLength;
  uint8_t  bDescriptorType;
  uint8_t  bEndpointAddress;
  uint8_t  bmAttributes;
  uint16_t  wMaxPacketSize;
  uint8_t  bInterval;
} USB_ENDPOINT_DESCRIPTOR;

 
typedef __packed struct _USB_STRING_DESCRIPTOR {
  uint8_t  bLength;
  uint8_t  bDescriptorType;
  uint16_t  bString ;
} USB_STRING_DESCRIPTOR;

 
typedef __packed struct _USB_COMMON_DESCRIPTOR {
  uint8_t  bLength;
  uint8_t  bDescriptorType;
} USB_COMMON_DESCRIPTOR;


#line 22 "USBAudio\\usbuser.c"
#line 1 "USBAudio\\usbcfg.h"




















 






















































 

#line 84 "USBAudio\\usbcfg.h"





































 

#line 134 "USBAudio\\usbcfg.h"























 

#line 172 "USBAudio\\usbcfg.h"





 



#line 23 "USBAudio\\usbuser.c"
#line 1 "USBAudio\\usbhw.h"




















 





 



 
#line 39 "USBAudio\\usbhw.h"

 



 
#line 53 "USBAudio\\usbhw.h"

 
#line 63 "USBAudio\\usbhw.h"

 
typedef struct _USB_DMA_DESCRIPTOR {
  uint32_t BufAdr;                      
  uint16_t  BufLen;                      
  uint16_t  MaxSize;                     
  uint32_t InfoAdr;                     
  union {                            
    struct {
      uint32_t Link   : 1;              
      uint32_t IsoEP  : 1;              
      uint32_t ATLE   : 1;              
      uint32_t Rsrvd  : 5;              
      uint32_t LenPos : 8;              
    } Type;
    uint32_t Val;
  } Cfg;
} USB_DMA_DESCRIPTOR;

 
extern void  USB_Init       (void);
extern void  USB_Connect    (uint32_t  con);
extern void  USB_Reset      (void);
extern void  USB_Suspend    (void);
extern void  USB_Resume     (void);
extern void  USB_WakeUp     (void);
extern void  USB_WakeUpCfg  (uint32_t  cfg);
extern void  USB_SetAddress (uint32_t adr);
extern void  USB_Configure  (uint32_t  cfg);
extern void  USB_ConfigEP   (USB_ENDPOINT_DESCRIPTOR *pEPD);
extern void  USB_DirCtrlEP  (uint32_t dir);
extern void  USB_EnableEP   (uint32_t EPNum);
extern void  USB_DisableEP  (uint32_t EPNum);
extern void  USB_ResetEP    (uint32_t EPNum);
extern void  USB_SetStallEP (uint32_t EPNum);
extern void  USB_ClrStallEP (uint32_t EPNum);
extern void USB_ClearEPBuf  (uint32_t  EPNum);
extern uint32_t USB_ReadEP     (uint32_t EPNum, uint8_t *pData);
extern uint32_t USB_WriteEP    (uint32_t EPNum, uint8_t *pData, uint32_t cnt);
extern uint32_t  USB_DMA_Setup  (uint32_t EPNum, USB_DMA_DESCRIPTOR *pDD);
extern void  USB_DMA_Enable (uint32_t EPNum);
extern void  USB_DMA_Disable(uint32_t EPNum);
extern uint32_t USB_DMA_Status (uint32_t EPNum);
extern uint32_t USB_DMA_BufAdr (uint32_t EPNum);
extern uint32_t USB_DMA_BufCnt (uint32_t EPNum);
extern uint32_t USB_GetFrame   (void);
extern void  USB_IRQHandler (void);


#line 24 "USBAudio\\usbuser.c"
#line 1 "USBAudio\\usbcore.h"
















 





 
typedef struct _USB_EP_DATA {
  uint8_t  *pData;
  uint16_t Count;
} USB_EP_DATA;

 
extern uint16_t USB_DeviceStatus;
extern uint8_t  USB_DeviceAddress;
extern uint8_t  USB_Configuration;
extern uint32_t USB_EndPointMask;
extern uint32_t USB_EndPointHalt;
extern uint32_t USB_EndPointStall;
extern uint8_t  USB_AltSetting[4];

 
extern uint8_t  EP0Buf[64];

 
extern USB_EP_DATA EP0Data;

 
extern USB_SETUP_PACKET SetupPacket;

 
extern void USB_ResetCore (void);



#line 25 "USBAudio\\usbuser.c"
#line 1 "USBAudio\\usbuser.h"
















 





 
extern void USB_Power_Event     (uint32_t  power);
extern void USB_Reset_Event     (void);
extern void USB_Suspend_Event   (void);
extern void USB_Resume_Event    (void);
extern void USB_WakeUp_Event    (void);
extern void USB_SOF_Event       (void);
extern void USB_Error_Event     (uint32_t error);

 
#line 46 "USBAudio\\usbuser.h"

 
extern void (* const USB_P_EP[16])(uint32_t event);

 
extern void USB_EndPoint0  (uint32_t event);
extern void USB_EndPoint1  (uint32_t event);
extern void USB_EndPoint2  (uint32_t event);
extern void USB_EndPoint3  (uint32_t event);
extern void USB_EndPoint4  (uint32_t event);
extern void USB_EndPoint5  (uint32_t event);
extern void USB_EndPoint6  (uint32_t event);
extern void USB_EndPoint7  (uint32_t event);
extern void USB_EndPoint8  (uint32_t event);
extern void USB_EndPoint9  (uint32_t event);
extern void USB_EndPoint10 (uint32_t event);
extern void USB_EndPoint11 (uint32_t event);
extern void USB_EndPoint12 (uint32_t event);
extern void USB_EndPoint13 (uint32_t event);
extern void USB_EndPoint14 (uint32_t event);
extern void USB_EndPoint15 (uint32_t event);

 
extern void USB_Configure_Event (void);
extern void USB_Interface_Event (void);
extern void USB_Feature_Event   (void);


#line 26 "USBAudio\\usbuser.c"

#line 1 "USBAudio\\usbaudio.h"














 

 
#line 26 "USBAudio\\usbaudio.h"

 


 


 
extern uint8_t  Mute;                       
extern uint32_t Volume;                     
extern uint16_t  VolCur;                     




extern uint32_t *InfoBuf;
extern short *DataBuf;

extern uint16_t  DataOut;                    
extern uint16_t  DataIn;                     
extern uint8_t   DataRun;                    
#line 28 "USBAudio\\usbuser.c"






 










 


void USB_Reset_Event (void) {
  USB_ResetCore();
}






 










 










 










 


void USB_SOF_Event (void) {
#line 108 "USBAudio\\usbuser.c"
}







 










 

#line 137 "USBAudio\\usbuser.c"





 










 









 
void (* const USB_P_EP[16]) (uint32_t event) = {
  ((0x0009 & (1 << (0))) ? USB_EndPoint0 : ((void *)0)),
  ((0x0009 & (1 << (1))) ? USB_EndPoint1 : ((void *)0)),
  ((0x0009 & (1 << (2))) ? USB_EndPoint2 : ((void *)0)),
  ((0x0009 & (1 << (3))) ? USB_EndPoint3 : ((void *)0)),
  ((0x0009 & (1 << (4))) ? USB_EndPoint4 : ((void *)0)),
  ((0x0009 & (1 << (5))) ? USB_EndPoint5 : ((void *)0)),
  ((0x0009 & (1 << (6))) ? USB_EndPoint6 : ((void *)0)),
  ((0x0009 & (1 << (7))) ? USB_EndPoint7 : ((void *)0)),
  ((0x0009 & (1 << (8))) ? USB_EndPoint8 : ((void *)0)),
  ((0x0009 & (1 << (9))) ? USB_EndPoint9 : ((void *)0)),
  ((0x0009 & (1 << (10))) ? USB_EndPoint10 : ((void *)0)),
  ((0x0009 & (1 << (11))) ? USB_EndPoint11 : ((void *)0)),
  ((0x0009 & (1 << (12))) ? USB_EndPoint12 : ((void *)0)),
  ((0x0009 & (1 << (13))) ? USB_EndPoint13 : ((void *)0)),
  ((0x0009 & (1 << (14))) ? USB_EndPoint14 : ((void *)0)),
  ((0x0009 & (1 << (15))) ? USB_EndPoint15 : ((void *)0)),
};






 

void USB_EndPoint1 (uint32_t event) {
}






 

void USB_EndPoint2 (uint32_t event) {
}





 

void USB_EndPoint3 (uint32_t event) {

  USB_DMA_DESCRIPTOR DD;

  if (event & 8) {
     
    if (USB_DMA_BufAdr(0x03) != ((uint32_t)DataBuf + 2*DataIn)) {
       
      DataIn += 4*32;                     
      DataIn &= (8*4*32) - 1;                     
      if (((DataIn - DataOut) & ((8*4*32) - 1)) == ((8*4*32)/2)) {
        DataRun = 1;                         
      }
    } else {
       
      DataRun = 0;                           
      DataOut = DataIn;                      
    }
  }
  if (event & (8) | (10)) {
     
    DD.BufAdr  = (uint32_t)DataBuf + 2*DataIn;  
    DD.BufLen  = 4;                        
    DD.MaxSize = 0;                          
    DD.InfoAdr = (uint32_t)InfoBuf;             
    DD.Cfg.Val = 0;                          
    DD.Cfg.Type.IsoEP = 1;                   
    USB_DMA_Setup (0x03, &DD);               
    USB_DMA_Enable(0x03);                    
  }



}






 

void USB_EndPoint4 (uint32_t event) {
}






 

void USB_EndPoint5 (uint32_t event) {
}






 

void USB_EndPoint6 (uint32_t event) {
}






 

void USB_EndPoint7 (uint32_t event) {
}






 

void USB_EndPoint8 (uint32_t event) {
}






 

void USB_EndPoint9 (uint32_t event) {
}






 

void USB_EndPoint10 (uint32_t event) {
}






 

void USB_EndPoint11 (uint32_t event) {
}






 

void USB_EndPoint12 (uint32_t event) {
}






 

void USB_EndPoint13 (uint32_t event) {
}






 

void USB_EndPoint14 (uint32_t event) {
}






 

void USB_EndPoint15 (uint32_t event) {
}
