#line 1 "USBAudio\\usbcore.c"






















 

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

#line 26 "USBAudio\\usbcore.c"

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


#line 28 "USBAudio\\usbcore.c"
#line 1 "USBAudio\\usbcfg.h"




















 






















































 

#line 84 "USBAudio\\usbcfg.h"





































 

#line 134 "USBAudio\\usbcfg.h"























 

#line 172 "USBAudio\\usbcfg.h"





 



#line 29 "USBAudio\\usbcore.c"
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


#line 30 "USBAudio\\usbcore.c"
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



#line 31 "USBAudio\\usbcore.c"
#line 1 "USBAudio\\usbdesc.h"
















 













extern const uint8_t USB_DeviceDescriptor[];
extern const uint8_t USB_ConfigDescriptor[];
extern const uint8_t USB_StringDescriptor[];


#line 32 "USBAudio\\usbcore.c"
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


#line 33 "USBAudio\\usbcore.c"



#line 1 "USBAudio\\audio.h"
















 





 





 



 
#line 40 "USBAudio\\audio.h"


 
#line 52 "USBAudio\\audio.h"

 





 




 
#line 76 "USBAudio\\audio.h"


 
#line 86 "USBAudio\\audio.h"


 
#line 101 "USBAudio\\audio.h"


 


 


 
#line 120 "USBAudio\\audio.h"

 



 
 
 

 
 
 

 
 


 
 




 
 




 
 






 
 

 




 

 
#line 175 "USBAudio\\audio.h"

 







 






 







 

 
#line 208 "USBAudio\\audio.h"

 




 
#line 223 "USBAudio\\audio.h"


 
#line 239 "USBAudio\\audio.h"


 
#line 252 "USBAudio\\audio.h"

 



 
 
 

 
 
 

 
 


 
 





 
 




 
 






 
 

 





 

 




 
#line 314 "USBAudio\\audio.h"

 
#line 324 "USBAudio\\audio.h"

 
#line 332 "USBAudio\\audio.h"

 





 
#line 348 "USBAudio\\audio.h"

 
#line 370 "USBAudio\\audio.h"


#line 38 "USBAudio\\usbcore.c"
#line 1 "USBAudio\\adcuser.h"
















 





 
extern uint32_t ADC_IF_GetRequest (void);
extern uint32_t ADC_IF_SetRequest (void);
extern uint32_t ADC_EP_GetRequest (void);
extern uint32_t ADC_EP_SetRequest (void);


#line 39 "USBAudio\\usbcore.c"
























#pragma diag_suppress 111,177,1441


uint16_t  USB_DeviceStatus;
uint8_t  USB_DeviceAddress;
uint8_t  USB_Configuration;
uint32_t USB_EndPointMask;
uint32_t USB_EndPointHalt;
uint32_t USB_EndPointStall;                          
uint8_t  USB_NumInterfaces;
uint8_t  USB_AltSetting[4];

uint8_t  EP0Buf[64];


USB_EP_DATA EP0Data;

USB_SETUP_PACKET SetupPacket;






 

void USB_ResetCore (void) {

  USB_DeviceStatus  = 0;
  USB_DeviceAddress = 0;
  USB_Configuration = 0;
  USB_EndPointMask  = 0x00010001;
  USB_EndPointHalt  = 0x00000000;
  USB_EndPointStall = 0x00000000;
}






 

void USB_SetupStage (void) {
  USB_ReadEP(0x00, (uint8_t *)&SetupPacket);
}






 

void USB_DataInStage (void) {
  uint32_t cnt;

  if (EP0Data.Count > 64) {
    cnt = 64;
  } else {
    cnt = EP0Data.Count;
  }
  cnt = USB_WriteEP(0x80, EP0Data.pData, cnt);
  EP0Data.pData += cnt;
  EP0Data.Count -= cnt;
}






 

void USB_DataOutStage (void) {
  uint32_t cnt;

  cnt = USB_ReadEP(0x00, EP0Data.pData);
  EP0Data.pData += cnt;
  EP0Data.Count -= cnt;
}






 

void USB_StatusInStage (void) {
  USB_WriteEP(0x80, ((void *)0), 0);
}






 

void USB_StatusOutStage (void) {
  USB_ReadEP(0x00, EP0Buf);
}






 

__inline uint32_t USB_ReqGetStatus (void) {
  uint32_t n, m;

  switch (SetupPacket.bmRequestType.BM.Recipient) {
    case 0:
      EP0Data.pData = (uint8_t *)&USB_DeviceStatus;
      break;
    case 1:
      if ((USB_Configuration != 0) && (SetupPacket.wIndex.WB.L < USB_NumInterfaces)) {
        *((__packed uint16_t *)EP0Buf) = 0;
        EP0Data.pData = EP0Buf;
      } else {
        return ((0));
      }
      break;
    case 2:
      n = SetupPacket.wIndex.WB.L & 0x8F;
      m = (n & 0x80) ? ((1 << 16) << (n & 0x0F)) : (1 << n);
      if (((USB_Configuration != 0) || ((n & 0x0F) == 0)) && (USB_EndPointMask & m)) {
        *((__packed uint16_t *)EP0Buf) = (USB_EndPointHalt & m) ? 1 : 0;
        EP0Data.pData = EP0Buf;
      } else {
        return ((0));
      }
      break;
    default:
      return ((0));
  }
  return ((1));
}







 

__inline uint32_t USB_ReqSetClrFeature (uint32_t sc) {
  uint32_t n, m;

  switch (SetupPacket.bmRequestType.BM.Recipient) {
    case 0:
      if (SetupPacket.wValue.W == 1) {
        if (sc) {
          USB_WakeUpCfg((1));
          USB_DeviceStatus |=  0x02;
        } else {
          USB_WakeUpCfg((0));
          USB_DeviceStatus &= ~0x02;
        }
      } else {
        return ((0));
      }
      break;
    case 1:
      return ((0));
    case 2:
      n = SetupPacket.wIndex.WB.L & 0x8F;
      m = (n & 0x80) ? ((1 << 16) << (n & 0x0F)) : (1 << n);
      if ((USB_Configuration != 0) && ((n & 0x0F) != 0) && (USB_EndPointMask & m)) {
        if (SetupPacket.wValue.W == 0) {
          if (sc) {
            USB_SetStallEP(n);
            USB_EndPointHalt |=  m;
          } else {
            if ((USB_EndPointStall & m) != 0) {
              return ((1));
            }
            USB_ClrStallEP(n);
#line 253 "USBAudio\\usbcore.c"
            USB_EndPointHalt &= ~m;
          }
        } else {
          return ((0));
        }
      } else {
        return ((0));
      }
      break;
    default:
      return ((0));
  }
  return ((1));
}






 

__inline uint32_t USB_ReqSetAddress (void) {

  switch (SetupPacket.bmRequestType.BM.Recipient) {
    case 0:
      USB_DeviceAddress = 0x80 | SetupPacket.wValue.WB.L;
      break;
    default:
      return ((0));
  }
  return ((1));
}






 

__inline uint32_t USB_ReqGetDescriptor (void) {
  uint8_t  *pD;
  uint32_t len, n;

  switch (SetupPacket.bmRequestType.BM.Recipient) {
    case 0:
      switch (SetupPacket.wValue.WB.H) {
        case 1:
          EP0Data.pData = (uint8_t *)USB_DeviceDescriptor;
          len = (sizeof(USB_DEVICE_DESCRIPTOR));
          break;
        case 2:
          pD = (uint8_t *)USB_ConfigDescriptor;
          for (n = 0; n != SetupPacket.wValue.WB.L; n++) {
            if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bLength != 0) {
              pD += ((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength;
            }
          }
          if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bLength == 0) {
            return ((0));
          }
          EP0Data.pData = pD;
          len = ((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength;
          break;
        case 3:
          pD = (uint8_t *)USB_StringDescriptor;
          for (n = 0; n != SetupPacket.wValue.WB.L; n++) {
            if (((USB_STRING_DESCRIPTOR *)pD)->bLength != 0) {
              pD += ((USB_STRING_DESCRIPTOR *)pD)->bLength;
            }
          }
          if (((USB_STRING_DESCRIPTOR *)pD)->bLength == 0) {
            return ((0));
          }
          EP0Data.pData = pD;
		  len = ((USB_STRING_DESCRIPTOR *)EP0Data.pData)->bLength;
          break;
        default:
          return ((0));
      }
      break;
    case 1:
      switch (SetupPacket.wValue.WB.H) {
#line 355 "USBAudio\\usbcore.c"
        default:
          return ((0));
      }
      break;
    default:
      return ((0));
  }

  if (EP0Data.Count > len) {
    EP0Data.Count = len;
  }

  return ((1));
}






 

__inline uint32_t USB_ReqGetConfiguration (void) {

  switch (SetupPacket.bmRequestType.BM.Recipient) {
    case 0:
      EP0Data.pData = &USB_Configuration;
      break;
    default:
      return ((0));
  }
  return ((1));
}






 

__inline uint32_t USB_ReqSetConfiguration (void) {
  USB_COMMON_DESCRIPTOR *pD;
  uint32_t alt = 0;
  uint32_t n, m;

  switch (SetupPacket.bmRequestType.BM.Recipient) {
    case 0:

      if (SetupPacket.wValue.WB.L) {
        pD = (USB_COMMON_DESCRIPTOR *)USB_ConfigDescriptor;
        while (pD->bLength) {
          switch (pD->bDescriptorType) {
            case 2:
              if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bConfigurationValue == SetupPacket.wValue.WB.L) {
                USB_Configuration = SetupPacket.wValue.WB.L;
                USB_NumInterfaces = ((USB_CONFIGURATION_DESCRIPTOR *)pD)->bNumInterfaces;
                for (n = 0; n < 4; n++) {
                  USB_AltSetting[n] = 0;
                }
                for (n = 1; n < 16; n++) {
                  if (USB_EndPointMask & (1 << n)) {
                    USB_DisableEP(n);
                  }
                  if (USB_EndPointMask & ((1 << 16) << n)) {
                    USB_DisableEP(n | 0x80);
                  }
                }
                USB_EndPointMask = 0x00010001;
                USB_EndPointHalt = 0x00000000;
                USB_EndPointStall= 0x00000000;
                USB_Configure((1));
                if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bmAttributes & 0x40) {
                  USB_DeviceStatus |=  0x01;
                } else {
                  USB_DeviceStatus &= ~0x01;
                }
              } else {
                (uint8_t *)pD += ((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength;
                continue;
              }
              break;
            case 4:
              alt = ((USB_INTERFACE_DESCRIPTOR *)pD)->bAlternateSetting;
              break;
            case 5:
              if (alt == 0) {
                n = ((USB_ENDPOINT_DESCRIPTOR *)pD)->bEndpointAddress & 0x8F;
                m = (n & 0x80) ? ((1 << 16) << (n & 0x0F)) : (1 << n);
                USB_EndPointMask |= m;
                USB_ConfigEP((USB_ENDPOINT_DESCRIPTOR *)pD);
                USB_EnableEP(n);
                USB_ResetEP(n);
              }
              break;
          }
          (uint8_t *)pD += pD->bLength;
        }
      }
      else {
        USB_Configuration = 0;
        for (n = 1; n < 16; n++) {
          if (USB_EndPointMask & (1 << n)) {
            USB_DisableEP(n);
          }
          if (USB_EndPointMask & ((1 << 16) << n)) {
            USB_DisableEP(n | 0x80);
          }
        }
        USB_EndPointMask  = 0x00010001;
        USB_EndPointHalt  = 0x00000000;
        USB_EndPointStall = 0x00000000;
        USB_Configure((0));
      }

      if (USB_Configuration != SetupPacket.wValue.WB.L) {
        return ((0));
      }
      break;
    default:
      return ((0));
  }
  return ((1));
}






 

__inline uint32_t USB_ReqGetInterface (void) {

  switch (SetupPacket.bmRequestType.BM.Recipient) {
    case 1:
      if ((USB_Configuration != 0) && (SetupPacket.wIndex.WB.L < USB_NumInterfaces)) {
        EP0Data.pData = USB_AltSetting + SetupPacket.wIndex.WB.L;
      } else {
        return ((0));
      }
      break;
    default:
      return ((0));
  }
  return ((1));
}






 

__inline uint32_t USB_ReqSetInterface (void) {
  USB_COMMON_DESCRIPTOR *pD;
  uint32_t ifn = 0, alt = 0, old = 0, msk = 0;
  uint32_t n, m;
  uint32_t set;

  switch (SetupPacket.bmRequestType.BM.Recipient) {
    case 1:
      if (USB_Configuration == 0) return ((0));
      set = (0);
      pD  = (USB_COMMON_DESCRIPTOR *)USB_ConfigDescriptor;
      while (pD->bLength) {
        switch (pD->bDescriptorType) {
          case 2:
            if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bConfigurationValue != USB_Configuration) {
              (uint8_t *)pD += ((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength;
              continue;
            }
            break;
          case 4:
            ifn = ((USB_INTERFACE_DESCRIPTOR *)pD)->bInterfaceNumber;
            alt = ((USB_INTERFACE_DESCRIPTOR *)pD)->bAlternateSetting;
            msk = 0;
            if ((ifn == SetupPacket.wIndex.WB.L) && (alt == SetupPacket.wValue.WB.L)) {
              set = (1);
              old = USB_AltSetting[ifn];
              USB_AltSetting[ifn] = (uint8_t)alt;
            }
            break;
          case 5:
            if (ifn == SetupPacket.wIndex.WB.L) {
              n = ((USB_ENDPOINT_DESCRIPTOR *)pD)->bEndpointAddress & 0x8F;
              m = (n & 0x80) ? ((1 << 16) << (n & 0x0F)) : (1 << n);
              if (alt == SetupPacket.wValue.WB.L) {
                USB_EndPointMask |=  m;
                USB_EndPointHalt &= ~m;
                USB_ConfigEP((USB_ENDPOINT_DESCRIPTOR *)pD);
                USB_EnableEP(n);
                USB_ResetEP(n);
                msk |= m;
              }
              else if ((alt == old) && ((msk & m) == 0)) {
                USB_EndPointMask &= ~m;
                USB_EndPointHalt &= ~m;
                USB_DisableEP(n);
              }
            }
           break;
        }
        (uint8_t *)pD += pD->bLength;
      }
      break;
    default:
      return ((0));
  }

  return (set);
}






 
 
void USB_EndPoint0 (uint32_t event) {

  switch (event) {
    case 1:
      USB_SetupStage();
      USB_DirCtrlEP(SetupPacket.bmRequestType.BM.Dir);
      EP0Data.Count = SetupPacket.wLength;      
      switch (SetupPacket.bmRequestType.BM.Type) {

        case 0:
          switch (SetupPacket.bRequest) {
            case 0:
              if (!USB_ReqGetStatus()) {
                goto stall_i;
              }
              USB_DataInStage();
              break;

            case 1:
              if (!USB_ReqSetClrFeature(0)) {
                goto stall_i;
              }
              USB_StatusInStage();



              break;

            case 3:
              if (!USB_ReqSetClrFeature(1)) {
                goto stall_i;
              }
              USB_StatusInStage();



              break;

            case 5:
              if (!USB_ReqSetAddress()) {
                goto stall_i;
              }
              USB_StatusInStage();
              break;

            case 6:
              if (!USB_ReqGetDescriptor()) {
                goto stall_i;
              }
              USB_DataInStage();
              break;

            case 7:
   USB_SetStallEP(0x00);             
              EP0Data.Count = 0;
              break;

            case 8:
              if (!USB_ReqGetConfiguration()) {
                goto stall_i;
              }
              USB_DataInStage();
              break;

            case 9:
              if (!USB_ReqSetConfiguration()) {
                goto stall_i;
              }
              USB_StatusInStage();



              break;

            case 10:
              if (!USB_ReqGetInterface()) {
                goto stall_i;
              }
              USB_DataInStage();
              break;

            case 11:
              if (!USB_ReqSetInterface()) {
                goto stall_i;
              }
              USB_StatusInStage();



              break;

            default:
              goto stall_i;
          }
          break;   


        case 1:
          switch (SetupPacket.bmRequestType.BM.Recipient) {

            case 0:
              goto stall_i;                                               

            case 1:
#line 748 "USBAudio\\usbcore.c"
              if ((SetupPacket.wIndex.WB.L == 0)  ||        
                  (SetupPacket.wIndex.WB.L == 1) ||
                  (SetupPacket.wIndex.WB.L == 2)) {
                switch (SetupPacket.bRequest) {
                  case 0x81:
                  case 0x82:
                  case 0x83:
                  case 0x84:
                    if (ADC_IF_GetRequest()) {
                      EP0Data.pData = EP0Buf;                             
                      USB_DataInStage();                                  
                      goto setup_class_ok;
                    }
                    break;
                  case 0x01:



                    EP0Data.pData = EP0Buf;                                
                    goto setup_class_ok;
                }
              }
#line 826 "USBAudio\\usbcore.c"
              goto stall_i;                                               
               

            case 2:

              switch (SetupPacket.bRequest) {
                case 0x81:
                case 0x82:
                case 0x83:
                case 0x84:
                  if (ADC_EP_GetRequest()) {
                    EP0Data.pData = EP0Buf;                               
                    USB_DataInStage();                                    
                    goto setup_class_ok;
                  }
                  break;
                case 0x01:



                  EP0Data.pData = EP0Buf;                                  
                  goto setup_class_ok;
              }

              goto stall_i;
               

            default:
              goto stall_i;
          }
setup_class_ok:                                                           
          break;   


#line 896 "USBAudio\\usbcore.c"

        default:
stall_i:  USB_SetStallEP(0x80);
          EP0Data.Count = 0;
          break;
      }
      break;   

    case 2:
      if (SetupPacket.bmRequestType.BM.Dir == 0) {
        if (EP0Data.Count) {                                              
          USB_DataOutStage();                                             
          if (EP0Data.Count == 0) {                                       
            switch (SetupPacket.bmRequestType.BM.Type) {

              case 0:
                goto stall_i;                                             


              case 1:
                switch (SetupPacket.bmRequestType.BM.Recipient) {
                  case 0:
                    goto stall_i;                                         

                  case 1:
#line 934 "USBAudio\\usbcore.c"
                    if ((SetupPacket.wIndex.WB.L == 0)  ||  
                        (SetupPacket.wIndex.WB.L == 1) ||
                        (SetupPacket.wIndex.WB.L == 2)) {
                      switch (SetupPacket.bRequest) {
                        case 0x01:



                          if (ADC_IF_SetRequest()) {
                            USB_StatusInStage();                          
                            goto out_class_ok;
                          }
                          break;
                      }
                    }
#line 975 "USBAudio\\usbcore.c"
                    goto stall_i;
                     

                  case 2:

                    switch (SetupPacket.bRequest) {
                      case 0x01:



                        if (ADC_EP_SetRequest()) {
                          USB_StatusInStage();                            
                          goto out_class_ok;
                        }
                        break;
                    }

                    goto stall_i;
                     

                  default:
                    goto stall_i;
                }
out_class_ok:                                                             
                break;  


#line 1032 "USBAudio\\usbcore.c"

              default:
                goto stall_i;
            }
          }
        }
      } else {
        USB_StatusOutStage();                                             
      }
      break;   

    case 3 :
      if (SetupPacket.bmRequestType.BM.Dir == 1) {
        USB_DataInStage();                                                
      } else {
        if (USB_DeviceAddress & 0x80) {
          USB_DeviceAddress &= 0x7F;
          USB_SetAddress(USB_DeviceAddress);
        }
      }
      break;   

    case 6:
      USB_ClrStallEP(0x00);
      break;

    case 7:
      USB_ClrStallEP(0x80);
      break;

  }
}
