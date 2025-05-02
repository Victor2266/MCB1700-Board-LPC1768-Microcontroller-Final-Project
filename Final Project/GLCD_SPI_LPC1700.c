/******************************************************************************/
/* GLCD_SPI_LPC1700.c: LPC1700 low level Graphic LCD (240x320 pixels) driven  */
/*                     with SPI functions                                     */
/******************************************************************************/
/* This file is part of the uVision/ARM development tools.                    */
/* Copyright (c) 2005-2011 Keil - An ARM Company. All rights reserved.        */
/* This software may only be used under the terms of a valid, current,        */
/* end user licence from KEIL for a compatible version of KEIL software       */
/* development tools. Nothing else gives you the right to use this software.  */
/******************************************************************************/


#include <lpc17xx.h>
#include <stdlib.h>  // for abs function
#include "GLCD.h"
#include "Font_6x8_h.h"
#include "Font_16x24_h.h"

/************************** Orientation  configuration ************************/

#define LANDSCAPE   1                   /* 1 for landscape, 0 for portrait    */
#define ROTATE180   0                   /* 1 to rotate the screen for 180 deg */

/*********************** Hardware specific configuration **********************/

/* SPI Interface: SPI3
   
   PINS: 
   - CS     = P0.6 (GPIO pin)
   - RS     = GND
   - WR/SCK = P0.7 (SCK1)
   - RD     = GND
   - SDO    = P0.8 (MISO1)
   - SDI    = P0.9 (MOSI1)                                                    */

#define PIN_CS      (1 << 6)
#define PIN_CLK     (1 << 7)
#define PIN_DAT     (1 << 9)

#define IN          0x00
#define OUT         0x01

/* SPI_SR - bit definitions                                                   */
#define TFE         0x01
#define RNE         0x04
#define BSY         0x10

/*------------------------- Speed dependant settings -------------------------*/

/* If processor works on high frequency delay has to be increased, it can be 
   increased by factor 2^N by this constant                                   */
#define DELAY_2N    18

/*---------------------- Graphic LCD size definitions ------------------------*/

#if (LANDSCAPE == 1)
#define WIDTH       320                 /* Screen Width (in pixels)           */
#define HEIGHT      240                 /* Screen Hight (in pixels)           */
#else
#define WIDTH       240                 /* Screen Width (in pixels)           */
#define HEIGHT      320                 /* Screen Hight (in pixels)           */
#endif
#define BPP         16                  /* Bits per pixel                     */
#define BYPP        ((BPP+7)/8)         /* Bytes per pixel                    */

/*--------------- Graphic LCD interface hardware definitions -----------------*/

/* Pin CS setting to 0 or 1                                                   */
#define LCD_CS(x)   ((x) ? (LPC_GPIO0->FIOSET = PIN_CS)    : (LPC_GPIO0->FIOCLR = PIN_CS))
#define LCD_CLK(x)  ((x) ? (LPC_GPIO0->FIOSET = PIN_CLK)   : (LPC_GPIO0->FIOCLR = PIN_CLK))
#define LCD_DAT(x)  ((x) ? (LPC_GPIO0->FIOSET = PIN_DAT)   : (LPC_GPIO0->FIOCLR = PIN_DAT))

#define DAT_MODE(x) ((x == OUT) ? (LPC_GPIO0->FIODIR |= PIN_DAT) : (LPC_GPIO0->FIODIR &= ~PIN_DAT))
#define BUS_VAL()                ((LPC_GPIO0->FIOPIN  & PIN_DAT) != 0)


#define SPI_START   (0x70)              /* Start byte for SPI transfer        */
#define SPI_RD      (0x01)              /* WR bit 1 within start              */
#define SPI_WR      (0x00)              /* WR bit 0 within start              */
#define SPI_DATA    (0x02)              /* RS bit 1 within start byte         */
#define SPI_INDEX   (0x00)              /* RS bit 0 within start byte         */

#define BG_COLOR  0                     /* Background color                   */
#define TXT_COLOR 1                     /* Text color                         */

 
/*---------------------------- Global variables ------------------------------*/

/******************************************************************************/
static volatile unsigned short Color[2] = {White, Black};
static unsigned char Himax;

/************************ Local auxiliary functions ***************************/

/*******************************************************************************
* Delay in while loop cycles                                                   *
*   Parameter:    cnt:    number of while cycles to delay                      *
*   Return:                                                                    *
*******************************************************************************/

static void delay (int cnt) {
  cnt <<= DELAY_2N;
  while (cnt--);
}


/*******************************************************************************
* Transfer 1 byte over the serial communication                                *
*   Parameter:    byte:   byte to be sent                                      *
*                 mode:   OUT = transmit byte, IN = receive byte               *
*   Return:               byte read while sending                              *
*******************************************************************************/
static unsigned char spi_tran_man (unsigned char byte, unsigned int mode) {
  unsigned char val = 0;
  int i;

  if (mode == OUT) { DAT_MODE (OUT); }
  else             { DAT_MODE (IN);  }

  for (i = 7; i >= 0; i--) {
    LCD_CLK(0);
    delay(1);
    if (mode == OUT) {
      LCD_DAT((byte & (1 << i)) != 0);
    }
    else {
      val |= (BUS_VAL() << i);
    }
    LCD_CLK(1);
    delay(1);
  }
  return (val);
}


/*******************************************************************************
* Transfer 1 byte over the serial communication                                *
*   Parameter:    byte:   byte to be sent                                      *
*   Return:               byte read while sending                              *
*******************************************************************************/

static __inline unsigned char spi_tran (unsigned char byte) {

  LPC_SSP1->DR = byte;
  while (!(LPC_SSP1->SR & RNE));        /* Wait for send to finish            */
  return (LPC_SSP1->DR);
}


/*******************************************************************************
* Write a command the LCD controller                                           *
*   Parameter:    cmd:    command to be written                                *
*   Return:                                                                    *
*******************************************************************************/

static __inline void wr_cmd (unsigned char cmd) {
  LCD_CS(0);
  spi_tran(SPI_START | SPI_WR | SPI_INDEX);   /* Write : RS = 0, RW = 0       */
  spi_tran(0);
  spi_tran(cmd);
  LCD_CS(1);
}


/*******************************************************************************
* Write data to the LCD controller                                             *
*   Parameter:    dat:    data to be written                                   *
*   Return:                                                                    *
*******************************************************************************/

static __inline void wr_dat (unsigned short dat) {
  LCD_CS(0);
  spi_tran(SPI_START | SPI_WR | SPI_DATA);    /* Write : RS = 1, RW = 0       */
  spi_tran((dat >>   8));                     /* Write D8..D15                */
  spi_tran((dat & 0xFF));                     /* Write D0..D7                 */
  LCD_CS(1);
}


/*******************************************************************************
* Start of data writing to the LCD controller                                  *
*   Parameter:                                                                 *
*   Return:                                                                    *
*******************************************************************************/

static __inline void wr_dat_start (void) {
  LCD_CS(0);
  spi_tran(SPI_START | SPI_WR | SPI_DATA);    /* Write : RS = 1, RW = 0       */
}


/*******************************************************************************
* Stop of data writing to the LCD controller                                   *
*   Parameter:                                                                 *
*   Return:                                                                    *
*******************************************************************************/

static __inline void wr_dat_stop (void) {

  LCD_CS(1);
}


/*******************************************************************************
* Data writing to the LCD controller                                           *
*   Parameter:    dat:    data to be written                                   *
*   Return:                                                                    *
*******************************************************************************/

static __inline void wr_dat_only (unsigned short dat) {

  spi_tran((dat >>   8));                     /* Write D8..D15                */
  spi_tran((dat & 0xFF));                     /* Write D0..D7                 */
}


/*******************************************************************************
* Read data from the LCD controller                                            *
*   Parameter:                                                                 *
*   Return:               read data                                            *
*******************************************************************************/

static __inline unsigned short rd_dat (void) {
  unsigned short val = 0;

  LCD_CS(0);
  spi_tran(SPI_START | SPI_RD | SPI_DATA);    /* Read: RS = 1, RW = 1         */
  spi_tran(0);                                /* Dummy read 1                 */  
  val   = spi_tran(0);                        /* Read D8..D15                 */
  val <<= 8;
  val  |= spi_tran(0);                        /* Read D0..D7                  */
  LCD_CS(1);
  return (val);
}


/*******************************************************************************
* Write a value to the to LCD register                                         *
*   Parameter:    reg:    register to be written                               *
*                 val:    value to write to the register                       *
*******************************************************************************/

static __inline void wr_reg (unsigned char reg, unsigned short val) {

  wr_cmd(reg);
  wr_dat(val);
}


/*******************************************************************************
* Read from the LCD register                                                   *
*   Parameter:    reg:    register to be read                                  *
*   Return:               value read from the register                         *
*******************************************************************************/

static unsigned short rd_reg (unsigned char reg) {

  wr_cmd(reg);
  return(rd_dat());
}


/*******************************************************************************
* Read LCD controller ID (Himax GLCD)                                          *
*   Parameter:    (none)                                                       *
*   Return:       controller ID                                                *
*******************************************************************************/

static unsigned short rd_id_man (void) {
  unsigned short val;

  /* Set MOSI, MISO and SCK as GPIO pins, with pull-down/pull-up disabled     */
  LPC_PINCON->PINSEL0  &= ~((3 << 18) | (3 << 16) | (3 << 14));
  LPC_PINCON->PINMODE0 |= 0x000AA000;
  LPC_GPIO0->FIODIR    |= PIN_CLK;      /* SCK pin is GPIO output             */
  LCD_CS (1);                           /* Set chip select high               */
  LCD_CLK(1);                           /* Set clock high                     */

  LCD_CS(0);
  spi_tran_man (SPI_START | SPI_WR | SPI_INDEX, OUT);
  spi_tran_man (0x00, OUT);
  LCD_CS(1);

  LCD_CS(0);
  spi_tran_man (SPI_START | SPI_RD | SPI_DATA, OUT);
  val = spi_tran_man(0, IN);
  LCD_CS(1);

  /* Connect MOSI, MISO, and SCK to SSP peripheral                            */
  LPC_GPIO0->FIODIR    &= ~PIN_CLK;
  LPC_PINCON->PINSEL0  |= (2 << 18) | (2 << 16) | (2 << 14);
  LPC_PINCON->PINMODE0 &= ~0x000FF000;

  return (val);
}


/************************ Exported functions **********************************/

/*******************************************************************************
* Initialize the Graphic LCD controller                                        *
*   Parameter:                                                                 *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_Init (void) {
  unsigned short driverCode;

  /* Enable clock for SSP1, clock = CCLK / 2                                  */
  LPC_SC->PCONP       |= 0x00000400;
  LPC_SC->PCLKSEL0    |= 0x00200000;

  /* Configure the LCD Control pins                                           */
  LPC_PINCON->PINSEL9 &= 0xF0FFFFFF;
  LPC_GPIO4->FIODIR   |= 0x30000000;
  LPC_GPIO4->FIOSET    = 0x20000000;

  /* SSEL1 is GPIO output set to high                                         */
  LPC_GPIO0->FIODIR   |= 0x00000040;
  LPC_GPIO0->FIOSET    = 0x00000040;
  LPC_PINCON->PINSEL0 &= 0xFFF03FFF;
  LPC_PINCON->PINSEL0 |= 0x000A8000;

  /* Enable SPI in Master Mode, CPOL=1, CPHA=1                                */
  /* Max. 12.5 MBit used for Data Transfer @ 100MHz                           */
  LPC_SSP1->CR0        = 0x01C7;
  LPC_SSP1->CPSR       = 0x02;
  LPC_SSP1->CR1        = 0x02;
  
  driverCode = rd_id_man ();
  if (driverCode == 0) {
    driverCode = rd_reg(0x00);
  }

  if (driverCode == 0x47) {             /* LCD with HX8347-D LCD Controller   */
    Himax = 1;                          /* Set Himax LCD controller flag      */
    /* Driving ability settings ----------------------------------------------*/
    wr_reg(0xEA, 0x00);                 /* Power control internal used (1)    */
    wr_reg(0xEB, 0x20);                 /* Power control internal used (2)    */
    wr_reg(0xEC, 0x0C);                 /* Source control internal used (1)   */
    wr_reg(0xED, 0xC7);                 /* Source control internal used (2)   */
    wr_reg(0xE8, 0x38);                 /* Source output period Normal mode   */
    wr_reg(0xE9, 0x10);                 /* Source output period Idle mode     */
    wr_reg(0xF1, 0x01);                 /* RGB 18-bit interface ;0x0110       */
    wr_reg(0xF2, 0x10);

    /* Adjust the Gamma Curve ------------------------------------------------*/
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

    /* Power voltage setting -------------------------------------------------*/
    wr_reg(0x1B, 0x1B);
    wr_reg(0x1A, 0x01);
    wr_reg(0x24, 0x2F);
    wr_reg(0x25, 0x57);
    wr_reg(0x23, 0x88);

    /* Power on setting ------------------------------------------------------*/
    wr_reg(0x18, 0x36);                 /* Internal oscillator frequency adj  */
    wr_reg(0x19, 0x01);                 /* Enable internal oscillator         */
    wr_reg(0x01, 0x00);                 /* Normal mode, no scrool             */
    wr_reg(0x1F, 0x88);                 /* Power control 6 - DDVDH Off        */
    delay(20);
    wr_reg(0x1F, 0x82);                 /* Power control 6 - Step-up: 3 x VCI */
    delay(5);
    wr_reg(0x1F, 0x92);                 /* Power control 6 - Step-up: On      */
    delay(5);
    wr_reg(0x1F, 0xD2);                 /* Power control 6 - VCOML active     */
    delay(5);

    /* Color selection -------------------------------------------------------*/
    wr_reg(0x17, 0x55);                 /* RGB, System interface: 16 Bit/Pixel*/
    wr_reg(0x00, 0x00);                 /* Scrolling off, no standby          */

    /* Interface config ------------------------------------------------------*/
    wr_reg(0x2F, 0x11);                 /* LCD Drive: 1-line inversion        */
    wr_reg(0x31, 0x00);
    wr_reg(0x32, 0x00);                 /* DPL=0, HSPL=0, VSPL=0, EPL=0       */

    /* Display on setting ----------------------------------------------------*/
    wr_reg(0x28, 0x38);                 /* PT(0,0) active, VGL/VGL            */
    delay(20);
    wr_reg(0x28, 0x3C);                 /* Display active, VGL/VGL            */

   #if (LANDSCAPE == 1)
    #if (ROTATE180 == 0)
     wr_reg (0x16, 0xA8);
    #else
     wr_reg (0x16, 0x68);
    #endif
   #else
    #if (ROTATE180 == 0)
     wr_reg (0x16, 0x08);
    #else
     wr_reg (0x16, 0xC8);
    #endif
   #endif

    /* Display scrolling settings --------------------------------------------*/
    wr_reg(0x0E, 0x00);                 /* TFA MSB                            */
    wr_reg(0x0F, 0x00);                 /* TFA LSB                            */
    wr_reg(0x10, 320 >> 8);             /* VSA MSB                            */
    wr_reg(0x11, 320 &  0xFF);          /* VSA LSB                            */
    wr_reg(0x12, 0x00);                 /* BFA MSB                            */
    wr_reg(0x13, 0x00);                 /* BFA LSB                            */
  }
  else {
    Himax = 0;                          /* This is not Himax LCD controller   */
    /* Start Initial Sequence ------------------------------------------------*/
   #if (ROTATE180 == 1)
    wr_reg(0x01, 0x0000);               /* Clear SS bit                       */
   #else
    wr_reg(0x01, 0x0100);               /* Set SS bit                         */
   #endif
    wr_reg(0x02, 0x0700);               /* Set 1 line inversion               */
    wr_reg(0x04, 0x0000);               /* Resize register                    */
    wr_reg(0x08, 0x0207);               /* 2 lines front, 7 back porch        */
    wr_reg(0x09, 0x0000);               /* Set non-disp area refresh cyc ISC  */
    wr_reg(0x0A, 0x0000);               /* FMARK function                     */
    wr_reg(0x0C, 0x0000);               /* RGB interface setting              */
    wr_reg(0x0D, 0x0000);               /* Frame marker Position              */
    wr_reg(0x0F, 0x0000);               /* RGB interface polarity             */

    /* Power On sequence -----------------------------------------------------*/
    wr_reg(0x10, 0x0000);               /* Reset Power Control 1              */
    wr_reg(0x11, 0x0000);               /* Reset Power Control 2              */
    wr_reg(0x12, 0x0000);               /* Reset Power Control 3              */
    wr_reg(0x13, 0x0000);               /* Reset Power Control 4              */
    delay(20);                          /* Discharge cap power voltage (200ms)*/
    wr_reg(0x10, 0x12B0);               /* SAP, BT[3:0], AP, DSTB, SLP, STB   */
    wr_reg(0x11, 0x0007);               /* DC1[2:0], DC0[2:0], VC[2:0]        */
    delay(5);                           /* Delay 50 ms                        */
    wr_reg(0x12, 0x01BD);               /* VREG1OUT voltage                   */
    delay(5);                           /* Delay 50 ms                        */
    wr_reg(0x13, 0x1400);               /* VDV[4:0] for VCOM amplitude        */
    wr_reg(0x29, 0x000E);               /* VCM[4:0] for VCOMH                 */
    delay(5);                           /* Delay 50 ms                        */
    wr_reg(0x20, 0x0000);               /* GRAM horizontal Address            */
    wr_reg(0x21, 0x0000);               /* GRAM Vertical Address              */

    /* Adjust the Gamma Curve ------------------------------------------------*/
    switch (driverCode) {
      case 0x5408:                      /* LCD with SPFD5408 LCD Controller   */
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

      case 0x9325:                      /* LCD with RM68050 LCD Controller    */
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

      case 0x9320:                      /* LCD with ILI9320 LCD Controller    */
      default:                          /* LCD with other LCD Controller      */
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

    /* Set GRAM area ---------------------------------------------------------*/
    wr_reg(0x50, 0x0000);               /* Horizontal GRAM Start Address      */
    wr_reg(0x51, (HEIGHT-1));           /* Horizontal GRAM End   Address      */
    wr_reg(0x52, 0x0000);               /* Vertical   GRAM Start Address      */
    wr_reg(0x53, (WIDTH-1));            /* Vertical   GRAM End   Address      */

    /* Set Gate Scan Line ----------------------------------------------------*/
    switch (driverCode) {
      case 0x5408:                      /* LCD with SPFD5408 LCD Controller   */
      case 0x9325:                      /* LCD with RM68050 LCD Controller    */
       #if (LANDSCAPE ^ ROTATE180)
        wr_reg(0x60, 0x2700);
       #else
        wr_reg(0x60, 0xA700);
       #endif
        break;

      case 0x9320:                      /* LCD with ILI9320 LCD Controller    */
      default:                          /* LCD with other LCD Controller      */
       #if (LANDSCAPE ^ ROTATE180)
        wr_reg(0x60, 0xA700);
       #else
        wr_reg(0x60, 0x2700);
       #endif
        break;
    }
    wr_reg(0x61, 0x0001);               /* NDL,VLE, REV                       */
    wr_reg(0x6A, 0x0000);               /* Set scrolling line                 */

    /* Partial Display Control -----------------------------------------------*/
    wr_reg(0x80, 0x0000);
    wr_reg(0x81, 0x0000);
    wr_reg(0x82, 0x0000);
    wr_reg(0x83, 0x0000);
    wr_reg(0x84, 0x0000);
    wr_reg(0x85, 0x0000);

    /* Panel Control ---------------------------------------------------------*/
    wr_reg(0x90, 0x0010);
    wr_reg(0x92, 0x0000);
    wr_reg(0x93, 0x0003);
    wr_reg(0x95, 0x0110);
    wr_reg(0x97, 0x0000);
    wr_reg(0x98, 0x0000);

    /* Set GRAM write direction
       I/D=11 (Horizontal : increment, Vertical : increment)                  */
  #if (LANDSCAPE == 1)
    /* AM=1   (address is updated in vertical writing direction)              */
    wr_reg(0x03, 0x1038);
  #else
    /* AM=0   (address is updated in horizontal writing direction)            */
    wr_reg(0x03, 0x1030);
  #endif

    wr_reg(0x07, 0x0137);               /* 262K color and display ON          */
  }
  LPC_GPIO4->FIOSET = 0x10000000;
}


/*******************************************************************************
* Set draw window region                                                       *
*   Parameter:      x:        horizontal position                              *
*                   y:        vertical position                                *
*                   w:        window width in pixel                            *
*                   h:        window height in pixels                          *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_SetWindow (unsigned int x, unsigned int y, unsigned int w, unsigned int h) {
  unsigned int xe, ye;

  if (Himax) {
    xe = x+w-1;
    ye = y+h-1;

    wr_reg(0x02, x  >>    8);           /* Column address start MSB           */
    wr_reg(0x03, x  &  0xFF);           /* Column address start LSB           */
    wr_reg(0x04, xe >>    8);           /* Column address end MSB             */
    wr_reg(0x05, xe &  0xFF);           /* Column address end LSB             */
  
    wr_reg(0x06, y  >>    8);           /* Row address start MSB              */
    wr_reg(0x07, y  &  0xFF);           /* Row address start LSB              */
    wr_reg(0x08, ye >>    8);           /* Row address end MSB                */
    wr_reg(0x09, ye &  0xFF);           /* Row address end LSB                */
  }
  else {
   #if (LANDSCAPE == 1)
    wr_reg(0x50, y);                    /* Vertical   GRAM Start Address      */
    wr_reg(0x51, y+h-1);                /* Vertical   GRAM End   Address (-1) */
    wr_reg(0x52, x);                    /* Horizontal GRAM Start Address      */
    wr_reg(0x53, x+w-1);                /* Horizontal GRAM End   Address (-1) */
    wr_reg(0x20, y);
    wr_reg(0x21, x);
   #else
    wr_reg(0x50, x);                    /* Horizontal GRAM Start Address      */
    wr_reg(0x51, x+w-1);                /* Horizontal GRAM End   Address (-1) */
    wr_reg(0x52, y);                    /* Vertical   GRAM Start Address      */
    wr_reg(0x53, y+h-1);                /* Vertical   GRAM End   Address (-1) */
    wr_reg(0x20, x);
    wr_reg(0x21, y);
   #endif
  }
}


/*******************************************************************************
* Set draw window region to whole screen                                       *
*   Parameter:                                                                 *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_WindowMax (void) {
  GLCD_SetWindow (0, 0, WIDTH, HEIGHT);
}


/*******************************************************************************
* Draw a pixel in foreground color                                             *
*   Parameter:      x:        horizontal position                              *
*                   y:        vertical position                                *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_PutPixel (unsigned int x, unsigned int y) {

  if (Himax) {
    wr_reg(0x02, x >>    8);            /* Column address start MSB           */
    wr_reg(0x03, x &  0xFF);            /* Column address start LSB           */
    wr_reg(0x04, x >>    8);            /* Column address end MSB             */
    wr_reg(0x05, x &  0xFF);            /* Column address end LSB             */
  
    wr_reg(0x06, y >>    8);            /* Row address start MSB              */
    wr_reg(0x07, y &  0xFF);            /* Row address start LSB              */
    wr_reg(0x08, y >>    8);            /* Row address end MSB                */
    wr_reg(0x09, y &  0xFF);            /* Row address end LSB                */
  }
  else {
   #if (LANDSCAPE == 1)
    wr_reg(0x20, y);
    wr_reg(0x21, x);
   #else
    wr_reg(0x20, x);
    wr_reg(0x21, y);
   #endif
  }

  wr_cmd(0x22);
  wr_dat(Color[TXT_COLOR]);
}


/*******************************************************************************
* Set foreground color                                                         *
*   Parameter:      color:    foreground color                                 *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_SetTextColor (unsigned short color) {

  Color[TXT_COLOR] = color;
}


/*******************************************************************************
* Set background color                                                         *
*   Parameter:      color:    background color                                 *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_SetBackColor (unsigned short color) {

  Color[BG_COLOR] = color;
}

void GLCD_Clear (unsigned short color) {
  unsigned int i;

  GLCD_WindowMax();
  wr_cmd(0x22);
  wr_dat_start();

  for(i = 0; i < (WIDTH*HEIGHT); i++)
    wr_dat_only(color);
  wr_dat_stop();
}


/*******************************************************************************
* Draw character on given position                                             *
*   Parameter:      x:        horizontal position                              *
*                   y:        vertical position                                *
*                   cw:       character width in pixel                         *
*                   ch:       character height in pixels                       *
*                   c:        pointer to character bitmap                      *
*   Return:                                                                    *
*******************************************************************************/

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


/*******************************************************************************
* Disply character on given line                                               *
*   Parameter:      ln:       line number                                      *
*                   col:      column number                                    *
*                   fi:       font index (0 = 6x8, 1 = 16x24)                  *
*                   c:        ascii character                                  *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_DisplayChar (unsigned int ln, unsigned int col, unsigned char fi, unsigned char c) {

  c -= 32;
  switch (fi) {
    case 0:  /* Font 6 x 8 */
      GLCD_DrawChar(col *  6, ln *  8,  6,  8, (unsigned char *)&Font_6x8_h  [c * 8]);
      break;
    case 1:  /* Font 16 x 24 */
      GLCD_DrawChar(col * 16, ln * 24, 16, 24, (unsigned char *)&Font_16x24_h[c * 24]);
      break;
  }
}


/*******************************************************************************
* Disply string on given line                                                  *
*   Parameter:      ln:       line number                                      *
*                   col:      column number                                    *
*                   fi:       font index (0 = 6x8, 1 = 16x24)                  *
*                   s:        pointer to string                                *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_DisplayString (unsigned int ln, unsigned int col, unsigned char fi, unsigned char *s) {

  while (*s) {
    GLCD_DisplayChar(ln, col++, fi, *s++);
  }
}


/*******************************************************************************
* Clear given line                                                             *
*   Parameter:      ln:       line number                                      *
*                   fi:       font index (0 = 6x8, 1 = 16x24)                  *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_ClearLn (unsigned int ln, unsigned char fi) {
  unsigned char i;
  unsigned char buf[60];

  GLCD_WindowMax();
  switch (fi) {
    case 0:  /* Font 6 x 8 */
      for (i = 0; i < (WIDTH+5)/6; i++)
        buf[i] = ' ';
      buf[i+1] = 0;
      break;
    case 1:  /* Font 16 x 24 */
      for (i = 0; i < (WIDTH+15)/16; i++)
        buf[i] = ' ';
      buf[i+1] = 0;
      break;
  }
  GLCD_DisplayString (ln, 0, fi, buf);
}

/*******************************************************************************
* Draw bargraph                                                                *
*   Parameter:      x:        horizontal position                              *
*                   y:        vertical position                                *
*                   w:        maximum width of bargraph (in pixels)            *
*                   h:        bargraph height                                  *
*                   val:      value of active bargraph (in 1/1024)             *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_Bargraph (unsigned int x, unsigned int y, unsigned int w, unsigned int h, unsigned int val) {
  int i,j;

  val = (val * w) >> 10;                /* Scale value                        */
  GLCD_SetWindow(x, y, w, h);
  wr_cmd(0x22);
  wr_dat_start();
  for (i = 0; i < h; i++) {
    for (j = 0; j <= w-1; j++) {
      if(j >= val) {
        wr_dat_only(Color[BG_COLOR]);
      } else {
        wr_dat_only(Color[TXT_COLOR]);
      }
    }
  }
  wr_dat_stop();
}


/*******************************************************************************
* Display graphical bitmap image at position x horizontally and y vertically   *
* (This function is optimized for 16 bits per pixel format, it has to be       *
*  adapted for any other bits per pixel format)                                *
*   Parameter:      x:        horizontal position                              *
*                   y:        vertical position                                *
*                   w:        width of bitmap                                  *
*                   h:        height of bitmap                                 *
*                   bitmap:   address at which the bitmap data resides         *
*   Return:                                                                    *
*******************************************************************************

void GLCD_Bitmap (unsigned int x, unsigned int y, unsigned int w, unsigned int h, unsigned char *bitmap) {
  int i, j;
  unsigned short *bitmap_ptr = (unsigned short *)bitmap;

  GLCD_SetWindow (x, y, w, h);

  wr_cmd(0x22);
  wr_dat_start();
  for (i = (h-1)*w; i > -1; i -= w) {
    for (j = 0; j < w; j++) {
      wr_dat_only (bitmap_ptr[i+j]);
    }
  }
  wr_dat_stop();
}
*/


/*******************************************************************************
* Scroll content of the whole display for dy pixels vertically                 *
*   Parameter:      dy:       number of pixels for vertical scroll             *
*   Return:                                                                    *
*******************************************************************************/

void GLCD_ScrollVertical (unsigned int dy) {
#if (LANDSCAPE == 0)
  static unsigned int y = 0;

  y = y + dy;
  while (y >= HEIGHT)
    y -= HEIGHT;

  if (Himax) {
    wr_reg(0x01, 0x08);
    wr_reg(0x14, y>>8);                 /* VSP MSB                            */
    wr_reg(0x15, y&0xFF);               /* VSP LSB                            */
  }
  else {
    wr_reg(0x6A, y);
    wr_reg(0x61, 3);
  }
#endif
}


/*******************************************************************************
* Write a command to the LCD controller                                        *
*   Parameter:      cmd:      command to write to the LCD                      *
*   Return:                                                                    *
*******************************************************************************/
void GLCD_WrCmd (unsigned char cmd) {
  wr_cmd (cmd);
}


/*******************************************************************************
* Write a value into LCD controller register                                   *
*   Parameter:      reg:      lcd register address                             *
*                   val:      value to write into reg                          *
*   Return:                                                                    *
*******************************************************************************/
void GLCD_WrReg (unsigned char reg, unsigned short val) {
  wr_reg (reg, val);
}




/***********************[CUSTOM FUNCTIONS BELOW]*******************************/

/*
TO DO:
- circle transition (final pixel pos)
*/



/*******************************************************************************
// Draws characters to screen without effecting background
*******************************************************************************/
void GLCD_DrawCharCutout(unsigned int x, unsigned int y, unsigned int cw, unsigned int ch, unsigned char *c, unsigned short color) {
    unsigned int i, j, k, pixs;
    int wr_started = 0;

    GLCD_SetWindow(x, y, cw, ch);
    wr_cmd(0x22);

    k = (cw + 7) / 8;

    if (k == 1) {
        for (j = 0; j < ch; j++) {
            pixs = *(unsigned char *)c;
            c += 1;

            for (i = 0; i < cw; i++) {
                if (pixs & (1 << i)) { // ((pixs >> i) & 1)
                    if (!wr_started) {
                        wr_dat_start();
                        wr_started = 1;
                    }
                    wr_dat_only(color);
                } else {
                    if (wr_started) {
                        wr_dat_stop();
                        wr_started = 0;
                    }
                    (void)rd_dat();
                }
            }
        }
    } else if (k == 2) {
        for (j = 0; j < ch; j++) {
            pixs = *(unsigned short *)c;
            c += 2;

            for (i = 0; i < cw; i++) {
                if (pixs & (1 << i)) {  // ((pixs >> i) & 1)
                    if (!wr_started) {
                        wr_dat_start();
                        wr_started = 1;
                    }
                    wr_dat_only(color);
                } else {
                    if (wr_started) {
                        wr_dat_stop();
                        wr_started = 0;
                    }
                    (void)rd_dat();
                }
            }
        }
    }

    if (wr_started) {
        wr_dat_stop();
    }
}
void GLCD_DisplayCharCutout (unsigned int ln, unsigned int col, unsigned char fi, unsigned char c, unsigned short color) {

  c -= 32;
  switch (fi) {
    case 0:  /* Font 6 x 8 */
      GLCD_DrawCharCutout(col *  6, ln *  8,  6,  8, (unsigned char *)&Font_6x8_h  [c * 8], color);
      break;
    case 1:  /* Font 16 x 24 */
      GLCD_DrawCharCutout(col * 16, ln * 24, 16, 24, (unsigned char *)&Font_16x24_h[c * 24], color);
      break;
  }
}
void GLCD_DisplayStringCutout (unsigned int ln, unsigned int col, unsigned char fi, unsigned char *s, unsigned short color) {

  while (*s) {
    GLCD_DisplayCharCutout(ln, col++, fi, *s++, color);
  }
}


/*******************************************************************************
* Display graphical bitmap image at position x horizontally and y vertically   *
* with improved bounds checking, y-axis clipping, and error handling           *
* (This function is optimized for 16 bits per pixel format, it has to be       *
*  adapted for any other bits per pixel format)                                *
*   Parameter:      x:        horizontal position                              *
*                   y:        vertical position                                *
*                   w:        width of bitmap                                  *
*                   h:        height of bitmap                                 *
*                   bitmap:   address at which the bitmap data resides         *
*   Return:                                                                    *
* Modified by Victor Do (Images also do not need to be flipped anymore)        *
*******************************************************************************/
int GLCD_Bitmap(int x, int y, unsigned int w, unsigned int h, const unsigned char *bitmap) {
    int i, j;
    int startx = 0, endx = w;
    int starty = 0, endy = h;
    const unsigned short *bitmap_ptr = (const unsigned short *)bitmap;
    unsigned int draw_width = endx - startx;
    unsigned int draw_height = endy - starty;
	
	  // Parameter validation
    if (!bitmap || w == 0 || h == 0) {
        return -1;  // Invalid parameters
    }

    // Complete out of bounds check
    if (x >= WIDTH || x + (signed int)w < 0 || 
        y >= HEIGHT || y + (signed int)h < 0) {
        return -2;  // Completely out of bounds
    }

    // X-axis bounds handling
    if (x + (signed int)w > WIDTH) {  // x overflow
        endx = WIDTH - x;
    } else if (x < 0) {  // x underflow
        startx = -x;
        x = 0;
    }

    // Y-axis bounds handling (new)
    if (y + (signed int)h > HEIGHT) {  // y overflow
        endy = HEIGHT - y;
    } else if (y < 0) {  // y underflow
        starty = -y;
        y = 0;
    }

	  // Calculate actual drawing dimensions
    draw_width = endx - startx;
    draw_height = endy - starty;
		
    // Set the window for the visible portion only
    GLCD_SetWindow(x, y, draw_width, draw_height);

    // Start drawing
    wr_cmd(0x22);
    wr_dat_start();

    // Only loop through the visible rows
    for (i = starty * w; i < endy * w; i += w) {
        // Only draw visible pixels in each row
        for (j = startx; j < endx; j++) {
            wr_dat_only(bitmap_ptr[i + j]);
        }
    }
    wr_dat_stop();

    return 0;  // Success
}
/*******************************************************************************
* Display portion of a graphical bitmap image within specified region           *
* This function allows redrawing only a specific section of the screen         *
* (This function is optimized for 16 bits per pixel format)                    *
*   Parameters:     x:        horizontal position of bitmap                     *
*                   y:        vertical position of bitmap                       *
*                   w:        width of entire bitmap                            *
*                   h:        height of entire bitmap                           *
*                   bitmap:   address at which the bitmap data resides          *
*                   rx:       x position of region to redraw                    *
*                   ry:       y position of region to redraw                    *
*                   rw:       width of region to redraw                         *
*                   rh:       height of region to redraw                        *
*   Return:         0 on success, negative value on error                       *
*******************************************************************************/
int GLCD_Bitmap_Region(int x, int y, unsigned int w, unsigned int h, 
                      const unsigned char *bitmap,
                      int rx, int ry, unsigned int rw, unsigned int rh) {
    int i, j;
    const unsigned short *bitmap_ptr = (const unsigned short *)bitmap;
    


    // Calculate intersection between bitmap and region
    int region_start_x = rx;
    int region_start_y = ry;
    int region_end_x = rx + rw;
    int region_end_y = ry + rh;
	
		// Calculate relative positions within bitmap
    int bitmap_start_x = region_start_x - x;
    int bitmap_start_y = region_start_y - y;
    int draw_width = region_end_x - region_start_x;
    int draw_height = region_end_y - region_start_y;

		// Parameter validation
    if (!bitmap || w == 0 || h == 0 || rw == 0 || rh == 0) {
        return -1;  // Invalid parameters
    }
		
    // Clip region to bitmap boundaries
    if (region_start_x < x) region_start_x = x;
    if (region_start_y < y) region_start_y = y;
    if (region_end_x > x + w) region_end_x = x + w;
    if (region_end_y > y + h) region_end_y = y + h;

    // Check if region is completely outside bitmap
    if (region_start_x >= region_end_x || region_start_y >= region_end_y) {
        return -2;  // No intersection
    }

    

    // Screen bounds checking
    if (region_start_x >= WIDTH || region_end_x <= 0 ||
        region_start_y >= HEIGHT || region_end_y <= 0) {
        return -3;  // Region completely out of screen bounds
    }

    // Clip to screen boundaries
    if (region_start_x < 0) {
        bitmap_start_x -= region_start_x;
        draw_width += region_start_x;
        region_start_x = 0;
    }
    if (region_end_x > WIDTH) {
        draw_width -= (region_end_x - WIDTH);
    }
    if (region_start_y < 0) {
        bitmap_start_y -= region_start_y;
        draw_height += region_start_y;
        region_start_y = 0;
    }
    if (region_end_y > HEIGHT) {
        draw_height -= (region_end_y - HEIGHT);
    }

    // Set the window for the visible portion only
    GLCD_SetWindow(region_start_x, region_start_y, draw_width, draw_height);
    
    // Start drawing
    wr_cmd(0x22);
    wr_dat_start();
    
    // Only loop through the visible rows of the region
    for (i = bitmap_start_y; i < bitmap_start_y + draw_height; i++) {
        // Calculate the starting position for this row in the bitmap
        int row_offset = i * w;
        // Only draw visible pixels in each row
        for (j = bitmap_start_x; j < bitmap_start_x + draw_width; j++) {
            wr_dat_only(bitmap_ptr[row_offset + j]);
        }
    }
    
    wr_dat_stop();
    return 0;  // Success
}

/*******************************************************************************
// Draws bitmap with cutout
*******************************************************************************/
int GLCD_BitmapCutout(int x, int y, unsigned int w, unsigned int h, 
                      const unsigned char *bitmap, unsigned short alpha_color) {
    const unsigned short *bitmap_ptr = (const unsigned short *)bitmap;
    int startx = 0, endx = w;
    int starty = 0, endy = h;
    int wr_started = 0;
    unsigned int draw_width, draw_height;

    if (!bitmap || w == 0 || h == 0) return -1;
    if (x >= WIDTH || x + (signed int)w < 0 || 
        y >= HEIGHT || y + (signed int)h < 0) return -2;

    // X-axis bounds handling
    if (x + (signed int)w > WIDTH) {
        endx = WIDTH - x;
    } else if (x < 0) {
        startx = -x;
        x = 0;
    }

    // Y-axis bounds handling
    if (y + (signed int)h > HEIGHT) {
        endy = HEIGHT - y;
    } else if (y < 0) {
        starty = -y;
        y = 0;
    }

    draw_width = endx - startx;
    draw_height = endy - starty;

    GLCD_SetWindow(x, y, draw_width, draw_height);
    wr_cmd(0x22);

    // Optimized drawing loop
    for (int i = starty * w; i < endy * w; i += w) {
        for (int j = startx; j < endx; j++) {
            unsigned short current_pixel = bitmap_ptr[i + j];
            
            if (current_pixel != alpha_color) {
                if (!wr_started) {
                    wr_dat_start();
                    wr_started = 1;
                }
                wr_dat_only(current_pixel);
            } else {
                if (wr_started) {
                    wr_dat_stop();
                    wr_started = 0;
                }
                (void)rd_dat();
            }
        }
    }

    if (wr_started) {
        wr_dat_stop();
    }

    return 0;
}

/*******************************************************************************
//This draws the pixel at coords with specified color
*******************************************************************************/
void GLCD_PutPixelc (int x, int y, unsigned short color) {

	// Complete out of bounds check
	if (x >= WIDTH || y >= HEIGHT || x < 0 || y < 0) {
			return;  // Completely out of bounds
	}
				
  if (Himax) {
    wr_reg(0x02, x >>    8);            /* Column address start MSB           */
    wr_reg(0x03, x &  0xFF);            /* Column address start LSB           */
    wr_reg(0x04, x >>    8);            /* Column address end MSB             */
    wr_reg(0x05, x &  0xFF);            /* Column address end LSB             */
  
    wr_reg(0x06, y >>    8);            /* Row address start MSB              */
    wr_reg(0x07, y &  0xFF);            /* Row address start LSB              */
    wr_reg(0x08, y >>    8);            /* Row address end MSB                */
    wr_reg(0x09, y &  0xFF);            /* Row address end LSB                */
  }
  else {
   #if (LANDSCAPE == 1)
    wr_reg(0x20, y);
    wr_reg(0x21, x);
   #else
    wr_reg(0x20, x);
    wr_reg(0x21, y);
   #endif
  }

  wr_cmd(0x22);
  wr_dat(color);
}

/*******************************************************************************
* Draw a 1-pixel thick outline of a box at position (x, y)                      *
* by: Victor Do                                                                 *
* Parameters:                                                                   *
*   x:      horizontal position                                                 *
*   y:      vertical position       (starts at top left)                        *
*   w:      width of the outline box                                            *
*   h:      height of the outline box                                           *
*   color:  color value for the outline                                         *
* Return:                                                                       *
*******************************************************************************/
int GLCD_DrawBox(int x, int y, unsigned int w, unsigned int h, unsigned short color) {
    int i;
	
		// Clip coordinates and dimensions
    int startx = (x < 0) ? 0 : x;
    int starty = (y < 0) ? 0 : y;
    int endx = (x + w > WIDTH) ? WIDTH : x + w;
    int endy = (y + h > HEIGHT) ? HEIGHT : y + h;
	
	  // Recalculate dimensions after clipping
    unsigned int clipped_w = endx - startx;
    unsigned int clipped_h = endy - starty;
	
	  // Complete out of bounds check
    if (x >= WIDTH || x + (signed int)w <= 0 || 
        y >= HEIGHT || y + (signed int)h <= 0) {
        return -1;  // Completely out of bounds
    }
				
    // Optimize for thin boxes
    if (clipped_w == 1) {
        // Single vertical line
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
        // Single horizontal line
        GLCD_SetWindow(startx, starty, clipped_w, 1);
        wr_cmd(0x22);
        wr_dat_start();
        for (i = 0; i < clipped_w; i++) {
            wr_dat_only(color);
        }
        wr_dat_stop();
        return 0;
    }
		
		// Draw horizontal lines
    if (starty < endy) {
        // Top line
        GLCD_SetWindow(startx, starty, clipped_w, 1);
        wr_cmd(0x22);
        wr_dat_start();
        for (i = 0; i < clipped_w; i++) {
            wr_dat_only(color);
        }
        wr_dat_stop();

        if (clipped_h > 1) {
            // Bottom line
            GLCD_SetWindow(startx, endy - 1, clipped_w, 1);
            wr_cmd(0x22);
            wr_dat_start();
            for (i = 0; i < clipped_w; i++) {
                wr_dat_only(color);
            }
            wr_dat_stop();
        }
    }

    // Draw vertical lines (if height > 2)
    if (clipped_h > 2 && startx < endx) {
        // Left line
        GLCD_SetWindow(startx, starty + 1, 1, clipped_h - 2);
        wr_cmd(0x22);
        wr_dat_start();
        for (i = 0; i < clipped_h - 2; i++) {
            wr_dat_only(color);
        }
        wr_dat_stop();

        if (clipped_w > 1) {
            // Right line
            GLCD_SetWindow(endx - 1, starty + 1, 1, clipped_h - 2);
            wr_cmd(0x22);
            wr_dat_start();
            for (i = 0; i < clipped_h - 2; i++) {
                wr_dat_only(color);
            }
            wr_dat_stop();
        }
    }

    return 0;  // Success
}

void GLCD_DrawBoxOld(int x, int y, unsigned int w, unsigned int h, unsigned short color) {
    int i;
	
	  // Top horizontal line
    GLCD_SetWindow(x, y, w, 1); // Set window for a horizontal line at the top edge
    wr_cmd(0x22);
    wr_dat_start();
    for (i = 0; i < w; i++) {
        wr_dat_only(color);
    }
    wr_dat_stop();

    // Bottom horizontal line
    GLCD_SetWindow(x, y + h - 1, w, 1); // Set window for a horizontal line at the bottom edge
    wr_cmd(0x22);
    wr_dat_start();
    for (i = 0; i < w; i++) {
        wr_dat_only(color);
    }
    wr_dat_stop();

    // Left vertical line
    GLCD_SetWindow(x, y, 1, h); // Set window for a vertical line on the left edge
    wr_cmd(0x22);
    wr_dat_start();
    for (i = 0; i < h; i++) {
        wr_dat_only(color);
    }
    wr_dat_stop();

    // Right vertical line
    GLCD_SetWindow(x + w - 1, y, 1, h); // Set window for a vertical line on the right edge
    wr_cmd(0x22);
    wr_dat_start();
    for (i = 0; i < h; i++) {
        wr_dat_only(color);
    }
    wr_dat_stop();
}
/*******************************************************************************
* Draw a line using Bresenham's line algorithm                                 *
* by: Victor Do                                                                *
*   Parameter:      x1, y1:   starting point of line                           *
*                   x2, y2:   ending point of line                             *
*                   color:  color value for the outline                        *
*   Return:                                                                    *
*******************************************************************************/
void GLCD_DrawLine(int x1, int y1, int x2, int y2, unsigned short color) {
    int dx, dy, incrE, incrNE, d, x, y;
    int steep = abs(y2 - y1) > abs(x2 - x1);
		int stepY; 
    
    // If line is steep, transpose the coordinates
    if (steep) {
        int temp;
        temp = x1; x1 = y1; y1 = temp;
        temp = x2; x2 = y2; y2 = temp;
    }
    
    // Make sure we always draw from left to right
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
    //int stepY = (y1 < y2) ? 1 : -1;
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

/*******************************************************************************
* Draw a circle using Bresenham's circle algorithm                             *
* by: Victor Do                                                                *
*   Parameter:      xc, yc:   center point of circle                           *
*                   radius:   radius of circle                                 *
*                   color:  color value for the outline                        *
*   Return:                                                                    *
*******************************************************************************/
#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 240
// Check if a pixel is within screen boundaries
int isPixelOnScreen(int x, int y) {
    return (x >= 0 && x < SCREEN_WIDTH && y >= 0 && y < SCREEN_HEIGHT);
}
// Plot initial points in all octants
void plotCirclePoints(int xc, int yc, int x, int y, unsigned short color) {
		// 8 symmetric points of the circle
    int points[8][2];
		int i = 0;
	
	  // Populate points array
    points[0][0] = xc + x; points[0][1] = yc + y;
    points[1][0] = xc - x; points[1][1] = yc + y;
    points[2][0] = xc + x; points[2][1] = yc - y;
    points[3][0] = xc - x; points[3][1] = yc - y;
    points[4][0] = xc + y; points[4][1] = yc + x;
    points[5][0] = xc - y; points[5][1] = yc + x;
    points[6][0] = xc + y; points[6][1] = yc - x;
    points[7][0] = xc - y; points[7][1] = yc - x;
    
    // Plot each point if it's on screen
    for ( i = 0; i < 8; i++) {
        if (points[i][0] >= 0 && points[i][0] < SCREEN_WIDTH &&
            points[i][1] >= 0 && points[i][1] < SCREEN_HEIGHT) {
            GLCD_PutPixelc(points[i][0], points[i][1], color);
        }
    }
}

void GLCD_DrawCircle(int xc, int yc, int radius, unsigned short color) {
    int x = 0;
    int y = radius;
    int d = 3 - 2 * radius;

    // Quick reject if circle is completely off screen
    if (xc + radius < 0 || xc - radius >= SCREEN_WIDTH ||
        yc + radius < 0 || yc - radius >= SCREEN_HEIGHT) {
        return;  // Circle is entirely off screen
    }
    
    // Draw initial points
    plotCirclePoints(xc, yc, x, y, color);
    
    while (y >= x) {
        x++;
        
        // Update decision parameter
        if (d > 0) {
            y--;
            d = d + 4 * (x - y) + 10;
        } else {
            d = d + 4 * x + 6;
        }
        
        // Draw points in all octants
        plotCirclePoints(xc, yc, x, y, color);
    }
}

/*******************************************************************************
* Draw a filled circle using an optimized algorithm                            *
* by: Victor Do                                                                *
*   Parameter:      xc, yc:   center point of circle                           *
*                   radius:   radius of circle                                 *
*                   color:  color value for the outline                        *
*   Return:                                                                    *
*******************************************************************************/
// Function to draw horizontal lines for filling
void drawHorizontalLine(int x1, int x2, int y, unsigned short color) {
		int i;
		GLCD_SetWindow(x1, y, x2 - x1 + 1, 1); // Set window for a horizontal line
		wr_cmd(0x22);
		wr_dat_start();
		for (i = x1; i <= x2; i++) {
				wr_dat_only(color); // Assuming 0xFFFF is the color value
		}
		wr_dat_stop();
}

void GLCD_DrawFilledCircle(int xc, int yc, int radius, unsigned short color) {
    int x = 0;
    int y = radius;
    int d = 3 - 2 * radius;
    
    // Draw initial points and lines
    while (y >= x) {
        // Draw horizontal lines to fill the circle
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

/*******************************************************************************
* Fill a rectangular box with specified position, dimensions and color          *
* Includes complete bounds checking and optimized filling                       *
*******************************************************************************/
int GLCD_FillBox(int x, int y, unsigned int w, unsigned int h, unsigned short color) {
	  // Clip coordinates and dimensions
    int startx = (x < 0) ? 0 : x;
    int starty = (y < 0) ? 0 : y;
    int endx = (x + w > WIDTH) ? WIDTH : x + w;
    int endy = (y + h > HEIGHT) ? HEIGHT : y + h;
		unsigned int i;
    unsigned int total_pixels;
	
    // Recalculate dimensions after clipping
    unsigned int clipped_w = endx - startx;
    unsigned int clipped_h = endy - starty;
	
	    // Complete out of bounds check
    if (x >= WIDTH || x + (signed int)w <= 0 || 
        y >= HEIGHT || y + (signed int)h <= 0) {
        return -2;  // Completely out of bounds
    }
				
		// Set window once for the entire fill operation
    GLCD_SetWindow(startx, starty, clipped_w, clipped_h);
    wr_cmd(0x22);
    wr_dat_start();

    // Calculate total number of pixels
    total_pixels = clipped_w * clipped_h;

    // Optimize the filling loop to avoid unnecessary row/column calculations
    for (i = 0; i < total_pixels; i++) {
        wr_dat_only(color);
    }

    wr_dat_stop();
    return 0;  // Success
}
	
/*******************************************************************************
//Transititions:
*******************************************************************************/
#define BOX_SIZE 16
#define BOXES_X (WIDTH / BOX_SIZE)  // 20 boxes
#define BOXES_Y (HEIGHT / BOX_SIZE) // 15 boxes

// Structure to hold box coordinates for transition ordering
typedef struct {
    int x;
    int y;
} BoxCoord;

// Calculate Manhattan distance from center
static int manhattan_dist(int x1, int y1, int x2, int y2) {
    return abs(x1 - x2) + abs(y1 - y2);
}

// Function to fill screen with boxes in specified pattern
void transition_screen(unsigned short color, int pattern, int delay_ms) {
    BoxCoord box_order[BOXES_X * BOXES_Y];
    int total_boxes = BOXES_X * BOXES_Y;
    int box_count = 0;
    int center_x = BOXES_X / 2;
    int center_y = BOXES_Y / 2;
    int x, y, i, j;
    int dist1, dist2;
    BoxCoord temp;
    
    // Pre-calculate box order based on pattern
    switch(pattern) {
        case PATTERN_LEFT_TO_RIGHT:
            x = 0;
            y = 0;
            for(x = 0; x < BOXES_X; x++) {
                for(y = 0; y < BOXES_Y; y++) {
                    box_order[box_count].x = x;
                    box_order[box_count].y = y;
                    box_count++;
                }
            }
            break;
            
        case PATTERN_RIGHT_TO_LEFT:
            x = BOXES_X - 1;
            y = 0;
            for(x = BOXES_X - 1; x >= 0; x--) {
                for(y = 0; y < BOXES_Y; y++) {
                    box_order[box_count].x = x;
                    box_order[box_count].y = y;
                    box_count++;
                }
            }
            break;
            
        case PATTERN_TOP_TO_BOTTOM:
            x = 0;
            y = 0;
            for(y = 0; y < BOXES_Y; y++) {
                for(x = 0; x < BOXES_X; x++) {
                    box_order[box_count].x = x;
                    box_order[box_count].y = y;
                    box_count++;
                }
            }
            break;
            
        case PATTERN_BOTTOM_TO_TOP:
            x = 0;
            y = BOXES_Y - 1;
            for(y = BOXES_Y - 1; y >= 0; y--) {
                for(x = 0; x < BOXES_X; x++) {
                    box_order[box_count].x = x;
                    box_order[box_count].y = y;
                    box_count++;
                }
            }
            break;
            
        case PATTERN_CENTER_OUT:
        case PATTERN_OUTSIDE_IN:
            x = 0;
            y = 0;
            // Create array of boxes
            for(y = 0; y < BOXES_Y; y++) {
                for(x = 0; x < BOXES_X; x++) {
                    box_order[box_count].x = x;
                    box_order[box_count].y = y;
                    box_count++;
                }
            }
            // Bubble sort boxes by distance from center
            for(i = 0; i < total_boxes - 1; i++) {
                for(j = 0; j < total_boxes - i - 1; j++) {
                    dist1 = manhattan_dist(box_order[j].x, box_order[j].y, center_x, center_y);
                    dist2 = manhattan_dist(box_order[j+1].x, box_order[j+1].y, center_x, center_y);
                    // For center out: sort ascending, for outside in: sort descending
                    if((pattern == PATTERN_CENTER_OUT && dist1 > dist2) ||
                       (pattern == PATTERN_OUTSIDE_IN && dist1 < dist2)) {
                        temp = box_order[j];
                        box_order[j] = box_order[j+1];
                        box_order[j+1] = temp;
                    }
                }
            }
            break;
    }
    
    // Draw boxes in calculated order
    i = 0;
    for(i = 0; i < total_boxes; i++) {
        GLCD_FillBox(
            box_order[i].x * BOX_SIZE,
            box_order[i].y * BOX_SIZE,
            BOX_SIZE,
            BOX_SIZE,
            color
        );
        
        if(delay_ms > 0) {
            //delay(delay_ms);  // Add delay between boxes if specified
        }
    }
}
