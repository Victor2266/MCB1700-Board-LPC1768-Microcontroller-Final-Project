#line 1 "USBAudio\\adcuser.c"
















 

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

#line 20 "USBAudio\\adcuser.c"

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


#line 22 "USBAudio\\adcuser.c"
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


#line 23 "USBAudio\\adcuser.c"
#line 1 "USBAudio\\usbcfg.h"




















 






















































 

#line 84 "USBAudio\\usbcfg.h"





































 

#line 134 "USBAudio\\usbcfg.h"























 

#line 172 "USBAudio\\usbcfg.h"





 



#line 24 "USBAudio\\adcuser.c"
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



#line 25 "USBAudio\\adcuser.c"
#line 1 "USBAudio\\adcuser.h"
















 





 
extern uint32_t ADC_IF_GetRequest (void);
extern uint32_t ADC_IF_SetRequest (void);
extern uint32_t ADC_EP_GetRequest (void);
extern uint32_t ADC_EP_SetRequest (void);


#line 26 "USBAudio\\adcuser.c"

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
#line 28 "USBAudio\\adcuser.c"

      uint16_t VolCur = 0x0100;      
const uint16_t VolMin = 0x0000;      
const uint16_t VolMax = 0x0100;      
const uint16_t VolRes = 0x0004;      






 

uint32_t ADC_IF_GetRequest (void) {







 

  if (SetupPacket.wIndex.W == 0x0200) {
     
    if (SetupPacket.wValue.WB.L == 0) {
       
      switch (SetupPacket.wValue.WB.H) {
        case 0x01:
          switch (SetupPacket.bRequest) {
            case 0x81:
              EP0Buf[0] = Mute;
              return ((1));
          }
          break;
        case 0x02:
          switch (SetupPacket.bRequest) {
            case 0x81:
              *((__packed uint16_t *)EP0Buf) = VolCur;
              return ((1));
            case 0x82:
              *((__packed uint16_t *)EP0Buf) = VolMin;
              return ((1));
            case 0x83:
              *((__packed uint16_t *)EP0Buf) = VolMax;
              return ((1));
            case 0x84:
              *((__packed uint16_t *)EP0Buf) = VolRes;
              return ((1));
          }
          break;
      }
    }
  }
  return ((0));   
}







 

uint32_t ADC_IF_SetRequest (void) {







 

  if (SetupPacket.wIndex.W == 0x0200) {
     
    if (SetupPacket.wValue.WB.L == 0) {
       
      switch (SetupPacket.wValue.WB.H) {
        case 0x01:
          switch (SetupPacket.bRequest) {
            case 0x01:
              Mute = EP0Buf[0];
              return ((1));
          }
          break;
        case 0x02:
          switch (SetupPacket.bRequest) {
            case 0x01:
              VolCur = *((__packed uint16_t *)EP0Buf);
              return ((1));
          }
          break;
      }
    }
  }
  return ((0));   
}







 

uint32_t ADC_EP_GetRequest (void) {






 
  return ((0));   
}







 

uint32_t ADC_EP_SetRequest (void) {






 
  return ((0));   
}
