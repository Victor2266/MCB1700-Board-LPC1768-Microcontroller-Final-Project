// MainMenu Code
#include <stdio.h>
#include "cmsis_os.h" // CMSIS RTOS header file
#include "LPC17xx.h"
#include "GLCD.h"
#include "MainMenu.h"
#include "KBD.h"

#define ICON_SIZE 64
#define ICON_OUTLINE_SIZE 72

//#include "Images/darkerBG.h"
//#include "Images/gameIcon.h"
//#include "Images/gallery.h"
//#include "Images/musical-note.h"

//#include "darkerBG.c"

extern unsigned char MAINMENU_BG_pixel_data[];
extern unsigned char GALLERY_ICON_pixel_data[];
extern unsigned char MUSIC_ICON_pixel_data[];
extern unsigned char GAME_ICON_pixel_data[];


int menu_select = 0;
int needs_update = 1;

void MainMenu_Init(void) {
  GLCD_Bitmap(0, 0, 320, 240, MAINMENU_BG_pixel_data);
	
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
  
  GLCD_BitmapCutout( 43, 80, ICON_SIZE, ICON_SIZE, GALLERY_ICON_pixel_data, White);
  GLCD_BitmapCutout(128, 80, ICON_SIZE, ICON_SIZE, MUSIC_ICON_pixel_data, White);
  GLCD_BitmapCutout(213, 80, ICON_SIZE, ICON_SIZE, GAME_ICON_pixel_data, White);
	
	//GLCD_Bitmap( 43, 80, ICON_SIZE, ICON_SIZE, GALLERY_ICON_pixel_data);
  //GLCD_Bitmap(128, 80, ICON_SIZE, ICON_SIZE, MUSIC_ICON_pixel_data);
  //GLCD_Bitmap(213, 80, ICON_SIZE, ICON_SIZE, GAME_ICON_pixel_data);
}

void MainMenu_Update(uint32_t ticks) {
	int i;
	//GLCD_Clear(White);
	
  if(needs_update) {
		// To redraw just a 50x50 region starting at (100,100) of a background bitmap
		GLCD_Bitmap_Region(0, 0, 320, 240, MAINMENU_BG_pixel_data, 39, 76, 242, 72);

    for(i = 0; i < 3; i++) {
      if(i == menu_select) {
        GLCD_DrawBox((43-4)+i*85, 80-4, ICON_OUTLINE_SIZE, ICON_OUTLINE_SIZE, White);
      }
    }
		
    if (menu_select == 0) {
			  //GLCD_BitmapCutout( 43, 80, ICON_SIZE, ICON_SIZE, GALLERY_ICON_pixel_data, White);
				GLCD_Bitmap( 43, 80, ICON_SIZE, ICON_SIZE, GALLERY_ICON_pixel_data);
        GLCD_BitmapCutout(128, 80, ICON_SIZE, ICON_SIZE, MUSIC_ICON_pixel_data, White);
        GLCD_BitmapCutout(213, 80, ICON_SIZE, ICON_SIZE, GAME_ICON_pixel_data, White);

      	GLCD_DisplayString(7, 0, 1 , "    > PICTURES <    ");
    } else if (menu_select == 1) {
				//GLCD_BitmapCutout(128, 80, ICON_SIZE, ICON_SIZE, MUSIC_ICON_pixel_data, White);
				GLCD_Bitmap(128, 80, ICON_SIZE, ICON_SIZE, MUSIC_ICON_pixel_data);
        GLCD_BitmapCutout( 43, 80, ICON_SIZE, ICON_SIZE, GALLERY_ICON_pixel_data, White);
        GLCD_BitmapCutout(213, 80, ICON_SIZE, ICON_SIZE, GAME_ICON_pixel_data, White);

        GLCD_DisplayString(7, 0, 1 , "   > MP3 PLAYER <   ");
    } else if (menu_select == 2) {
				//GLCD_BitmapCutout(213, 80, ICON_SIZE, ICON_SIZE, GAME_ICON_pixel_data, White);
				GLCD_Bitmap(213, 80, ICON_SIZE, ICON_SIZE, GAME_ICON_pixel_data);
        GLCD_BitmapCutout( 43, 80, ICON_SIZE, ICON_SIZE, GALLERY_ICON_pixel_data, White);
        GLCD_BitmapCutout(128, 80, ICON_SIZE, ICON_SIZE, MUSIC_ICON_pixel_data, White);

      	GLCD_DisplayString(7, 0, 1 , "      > GAME <      ");
    }
    
	      GLCD_DrawBox(0, 167, 320, 26, 0x0000);
        GLCD_DrawBox(0, 165, 320, 2, 0x0000);
    
  }
  needs_update = 0;
}
void delayM (int cnt) {
  cnt <<= 18;
  while (cnt--);
}

void MainMenuScript_Input(uint32_t key) {
  if(key & KBD_LEFT) {
    menu_select--;
    if(menu_select < 0) menu_select = 2;
		needs_update = 1;
  }
  else if(key & KBD_RIGHT) {
    menu_select++;
    if(menu_select > 2) menu_select = 0;
		needs_update = 1;
  }
	else if(key & KBD_UP) {
		needs_update = 1;
  }
	else if(key & KBD_RIGHT) {
		needs_update = 1;
  }
	delayM(15);
}


/*
// Define thread IDs and thread prototypes
osThreadId tid_MainMenu, tid_Gallery, tid_MP3Player, tid_Game, tid_UserInput;
void MainMenu(void const *argument);
void Gallery(void const *argument);
void MP3Player(void const *argument);
void Game(void const *argument);
void UserInput(void const *argument);

// Thread definitions
osThreadDef(MainMenu,  osPriorityNormal, 1, 0);
osThreadDef(Gallery,   osPriorityNormal, 1, 0);
osThreadDef(MP3Player, osPriorityNormal, 1, 0);
osThreadDef(Game,      osPriorityNormal, 1, 0);
osThreadDef(UserInput, osPriorityNormal, 1, 0);

char logger[100];  // Shared resource for Application Interface and Device Management
osMutexId loggerMutex;
osMutexDef(loggerMutex);

// Initialization function for creating threads and the logger mutex
int Init_Threads(void) {

    // Create the threads
    tid_MainMenu = osThreadCreate(osThread(MainMenu), NULL);
    if (!tid_MainMenu) return -1;

    return 0;
}

// Terminate all threads
void Terminate_Threads(void) {
    osThreadTerminate(tid_MainMenu);
    osThreadTerminate(tid_Gallery);
    osThreadTerminate(tid_MP3Player);
    osThreadTerminate(tid_Game);
    osThreadTerminate(tid_UserInput);
}



void MainMenu(void const *argument) {
    volatile uint32_t *bit_band_address;  // Move declaration before the executable statements
		int memoryCounter = 0;
    while (memoryCounter < 10) {
        memoryCounter++;
        
        // Now assign the bit-band address
        bit_band_address = (uint32_t *)(0x42000000 + (0x20000000 - 0x20000000) * 32 + 1 * 4);
        *bit_band_address = 1;

        //osDelay(10);  // Simulate some processing delay

        // Signal CPU Management to start
        tid_Gallery = osThreadCreate(osThread(Gallery), NULL);
        osSignalWait(0x01, osWaitForever);
				// Signal APP Interface to start
				tid_MP3Player = osThreadCreate(osThread(MP3Player), NULL);
				osSignalWait(0x03, osWaitForever);

        osDelay(1);  // Delay for 1 OS tick
        osThreadTerminate(tid_MainMenu);
    }
}

// Task 2: CPU Management
void Gallery(void const *argument) {
		int A = 0;
		int B = 4;
		int C = 2;
		
    while (A < 10) {
        A++;
        // Simulate some conditional execution
        if (A % 2 == 1) {
          //__asm("ROR R1, R1, #1");  // Barrel shift for even numbers	
					A = B + (C * 4);
        }
				//osDelay(1);  // Delay for 1 OS tick
        // Signal back to Memory Management
        osSignalSet(tid_MainMenu, 0x01);
				osDelay(1);  // Delay for 1 OS tick
        osThreadTerminate(tid_Gallery);
    }
}

// Task 3: Application Interface
void MP3Player(void const *argument) {
	int appCounter = 0;
    while (appCounter < 10) {
        appCounter++;
        osMutexWait(loggerMutex, osWaitForever);  // Lock the logger

        // Write to logger
        snprintf(logger, sizeof(logger), "Application Message Part 1");
				
        osMutexRelease(loggerMutex);  // Unlock the logger
			
        // Wait for Device Management to finish
        tid_Game = osThreadCreate(osThread(Game), NULL);
        osSignalWait(0x02, osWaitForever);

			
				osSignalSet(tid_MainMenu, 0x03); 
        osDelay(1);  // Delay for 1 OS tick
        osThreadTerminate(tid_MP3Player);
    }
}

// Task 4: Device Management
void Game(void const *argument) {
	int deviceCounter = 0;
    while (deviceCounter < 10) {
        deviceCounter++;
        osMutexWait(loggerMutex, osWaitForever);  // Lock the logger

        // Append to logger
        //strcat(logger, " - Device Management Ending");

        osMutexRelease(loggerMutex);  // Unlock the logger

        // Signal back to Application Interface
        osSignalSet(tid_MP3Player, 0x02);
        osDelay(1);  // Delay for 1 OS tick
        osThreadTerminate(tid_Game);
    }
}

// Task 5: User Interface
void UserInput(void const *argument) {
	int userCounter = 0;
    while (userCounter < 10) {
        userCounter++;
        // Indicate the number of users in the system
        osDelay(1);  // Delay for 1 OS tick
        osThreadTerminate(tid_UserInput);
    }
}
*/
