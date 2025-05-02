#line 1 "USBAudio\\usbdesc.c"




















 
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

#line 23 "USBAudio\\usbdesc.c"

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


#line 25 "USBAudio\\usbdesc.c"
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


#line 26 "USBAudio\\usbdesc.c"
#line 1 "USBAudio\\usbcfg.h"




















 






















































 

#line 84 "USBAudio\\usbcfg.h"





































 

#line 134 "USBAudio\\usbcfg.h"























 

#line 172 "USBAudio\\usbcfg.h"





 



#line 27 "USBAudio\\usbdesc.c"
#line 1 "USBAudio\\usbdesc.h"
















 













extern const uint8_t USB_DeviceDescriptor[];
extern const uint8_t USB_ConfigDescriptor[];
extern const uint8_t USB_StringDescriptor[];


#line 28 "USBAudio\\usbdesc.c"


 
const uint8_t USB_DeviceDescriptor[] = {
  (sizeof(USB_DEVICE_DESCRIPTOR)),               
  1,         
  (0x0200 & 0xFF),((0x0200 >> 8) & 0xFF),             
  0x00,                               
  0x00,                               
  0x00,                               
  64,                    
  (0x1FC9 & 0xFF),((0x1FC9 >> 8) & 0xFF),                      
  (0x4002 & 0xFF),((0x4002 >> 8) & 0xFF),                      
  (0x0100 & 0xFF),((0x0100 >> 8) & 0xFF),             
  0x01,                               
  0x02,                               
  0x03,                               
  0x01                                
};

 
 
const uint8_t USB_ConfigDescriptor[] = {
 
  (sizeof(USB_CONFIGURATION_DESCRIPTOR)),           
  2,     
  ((sizeof(USB_CONFIGURATION_DESCRIPTOR)) + (sizeof(USB_INTERFACE_DESCRIPTOR)) + 0x08+1 + 0x0C + 0x07+(1+1)*1 + 0x09 + (sizeof(USB_INTERFACE_DESCRIPTOR)) + (sizeof(USB_INTERFACE_DESCRIPTOR)) + 0x07 + 0x08+(1*3) + 0x09 + 0x07 & 0xFF),(((sizeof(USB_CONFIGURATION_DESCRIPTOR)) + (sizeof(USB_INTERFACE_DESCRIPTOR)) + 0x08+1 + 0x0C + 0x07+(1+1)*1 + 0x09 + (sizeof(USB_INTERFACE_DESCRIPTOR)) + (sizeof(USB_INTERFACE_DESCRIPTOR)) + 0x07 + 0x08+(1*3) + 0x09 + 0x07 >> 8) & 0xFF),
#line 68 "USBAudio\\usbdesc.c"
  0x02,                                  
  0x01,                                  
  0x00,                                  
  0x80,                
  ((100)/2),              
 
  (sizeof(USB_INTERFACE_DESCRIPTOR)),               
  4,         
  0x00,                                  
  0x00,                                  
  0x00,                                  
  0x01,                
  0x01,           
  0x00,              
  0x00,                                  
 
  0x08+1,    
  0x24,       
  0x01,                  
  (0x0100 & 0xFF),((0x0100 >> 8) & 0xFF),                
  (0x08+1 + 0x0C + 0x07+(1+1)*1 + 0x09 & 0xFF),((0x08+1 + 0x0C + 0x07+(1+1)*1 + 0x09 >> 8) & 0xFF),





  0x01,                                  
  0x01,                                  
 
  0x0C,        
  0x24,       
  0x02,          
  0x01,                                  
  (0x0101 & 0xFF),((0x0101 >> 8) & 0xFF),   
  0x00,                                  
  0x01,                                  
  (0x0000 & 0xFF),((0x0000 >> 8) & 0xFF),                
  0x00,                                  
  0x00,                                  
 
  0x07+(1+1)*1,       
  0x24,       
  0x06,            
  0x02,                                  
  0x01,                                  
  0x01,                                  
  0x0001 |
  0x0002,                  
  0x00,                                  
  0x00,                                  
 
  0x09,       
  0x24,       
  0x03,         
  0x03,                                  
  (0x0301 & 0xFF),((0x0301 >> 8) & 0xFF),         
  0x00,                                  
  0x02,                                  
  0x00,                                  
 
  (sizeof(USB_INTERFACE_DESCRIPTOR)),               
  4,         
  0x01,                                  
  0x00,                                  
  0x00,                                  
  0x01,                
  0x02,         
  0x00,              
  0x00,                                  
 
  (sizeof(USB_INTERFACE_DESCRIPTOR)),               
  4,         
  0x01,                                  
  0x01,                                  
  0x01,                                  
  0x01,                
  0x02,         
  0x00,              
  0x00,                                  
 
  0x07,   
  0x24,       
  0x01,               
  0x01,                                  
  0x01,                                  
  (0x0001 & 0xFF),((0x0001 >> 8) & 0xFF),               
 
  0x08+(1*3),        
  0x24,       
  0x02,           
  0x01,                   
  0x01,                                  
  0x02,                                  
  16,                                    
  0x01,                                  
  (32000 & 0xFF),((32000 >> 8) & 0xFF),((32000 >> 16) & 0xFF),                          
 
  0x09,     
  5,          
  ((3) | 0x00),                   
  0x01,         
  (64 & 0xFF),((64 >> 8) & 0xFF),                             
  0x01,                                  
  0x00,                                  
  0x00,                                  
 
  0x07,    
  0x25,        
  0x01,                
  0x00,                                  
  0x00,                                  
  (0x0000 & 0xFF),((0x0000 >> 8) & 0xFF),                         
 
  0                                      
};

 
const uint8_t USB_StringDescriptor[] = {
 
  0x04,                               
  3,         
  (0x0409 & 0xFF),((0x0409 >> 8) & 0xFF),       
 
  (13*2 + 2),                         
  3,         
  'N',0,
  'X',0,
  'P',0,
  ' ',0,
  'S',0,
  'e',0,
  'm',0,
  'i',0,
  'c',0,
  'o',0,
  'n',0,
  'd',0,
  ' ',0,
 
  (20*2 + 2),                         
  3,         
  'N',0,
  'X',0,
  'P',0,
  ' ',0,
  'L',0,
  'P',0,
  'C',0,
  '1',0,
  '7',0,
  'x',0,
  'x',0,
  ' ',0,
  'S',0,
  'p',0,
  'e',0,
  'a',0,
  'k',0,
  'e',0,
  'r',0,
  ' ',0,
 
  (12*2 + 2),                         
  3,         
  'D',0,
  'E',0,
  'M',0,
  'O',0,
  '0',0,
  '0',0,
  '0',0,
  '0',0,
  '0',0,
  '0',0,
  '0',0,
  '0',0,
};
