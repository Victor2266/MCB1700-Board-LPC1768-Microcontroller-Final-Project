//Final Project
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>

#define osObjectsPublic                     // define objects in main module
#include "osObjects.h"                      // RTOS object definitions
#include "cmsis_os.h"                                           // CMSIS RTOS header file
#include "LPC17xx.h"
#include "GLCD.h"
#include "KBD.h"
#include "USBAudio/type.h"
#include "GameScript.h"
#include "MainMenu.h"

#define __USE_LCD 1 /* Uncomment to use the LCD */


// Global variables and other shared resources Definition
char buf[20];
extern uint32_t KBD_val;
int kbdEnabled = 0;
uint64_t tickCount = 0;
uint64_t ticks = 0;
//Main Menu Definitions


// Gallery Viewer Definitions
#define gallerySize 4 //4
//extern unsigned char COLORFUL_BG_pixel_data[];
//extern unsigned char SWORD_pixel_data[];
//extern unsigned char BLUEFLOWER_pixel_data[];
#include "Images/colorful-BG.h"
#include "Images/sword.h"
#include "Images/blueFlower.h"
#include "Images/castle.h"
const unsigned char *gallery[gallerySize] = {COLORFUL_BG_pixel_data, SWORD_pixel_data, BLUEFLOWER_pixel_data, CASTLE_pixel_data};
//const unsigned char *gallery[gallerySize] = {BLUEFLOWER_pixel_data};

int currentImage = 0;
int prevImage = -1;

//USBAudio Definitions
extern int USBAudio_Init(void);
extern uint8_t Mute;

//State Machine Definitions
#define STATE_MAIN_MENU    0
#define STATE_GALLERY      1
#define STATE_MP3_PLAYER   2
#define STATE_GAME         3
#define TOTAL_STATES       4

typedef void (*InitializationHandler)(void);
typedef void (*UpdateHandler)(uint32_t ticks);
typedef void (*InputHandler)(uint32_t key);

typedef struct {
  InitializationHandler init, exit;
  UpdateHandler         update;
  InputHandler          input;
}  StateDef;

StateDef States[TOTAL_STATES];

int curr_state = STATE_MAIN_MENU;
int prev_state = -1;


//extern void Init_Threads     (void);
//extern void Terminate_Threads(void);
//extern osThreadId tid_MainMenu, tid_Gallery, tid_MP3Player, tid_Game, tid_UserInput;

extern void MainMenu_Init(void);

void Gallery_Start(){
	GLCD_Clear(Cyan);
	transition_screen(Black, rand() % 6,  0);		//Black Transition - Random Pattern
	currentImage = 0;
	prevImage = -1;
	//GLCD_Clear(Olive);
	GLCD_SetBackColor(Black);
	GLCD_SetTextColor(White);
	GLCD_DisplayStringCutout(0, 0, 1 , "   Gallery Images   ", White);
	GLCD_DisplayStringCutout(9, 0, 1 , "    Image 1 of 4    ", White);
}

void Gallery_Update(uint32_t ticks){
	int posX, posY = 0;
	int sizeX, sizeY = 0;
	
	
	if(currentImage == 0)
	{
		posX = 20;
		posY = 20;
		sizeX = COLORFUL_BG_WIDTH;
		sizeY = COLORFUL_BG_HEIGHT;
		//GLCD_DisplayStringCutout(9, 0, 1 , "    Image 1 of 4    ", White);
		GLCD_DisplayString(9, 0, 1 , "    Image 1 of 4    ");
	}
	else if(currentImage == 1)
	{
		posX = 124;
		posY = 76;
		sizeX = SWORD_WIDTH;
		sizeY = SWORD_HEIGHT;
		GLCD_DisplayStringCutout(9, 0, 1 , "    Image 2 of 4    ", White);
		//GLCD_DisplayString(9, 0, 1 , "    Image 2 of 4    ");
	}
	else if(currentImage == 2)
	{
		posX = 135;
		posY = 4;
		sizeX = BLUEFLOWER_WIDTH;
		sizeY = BLUEFLOWER_HEIGHT;
		GLCD_DisplayStringCutout(9, 0, 1 , "    Image 3 of 4    ", White);
		//GLCD_DisplayString(9, 0, 1 , "    Image 3 of 4    ");
	}
	else if(currentImage == 3)
	{
		posX = 0;
		posY = 20;
		sizeX = CASTLE_WIDTH;
		sizeY = CASTLE_HEIGHT;
		GLCD_DisplayStringCutout(9, 0, 1 , "    Image 4 of 4    ", White);
		//GLCD_DisplayString(9, 0, 1 , "    Image 4 of 4    ");
	}
	
	if(prevImage != currentImage){
		transition_screen(0x0000, rand() % 6,  0);		//Black Transition - Random Pattern
		//GLCD_Clear(Black);
		GLCD_Bitmap(posX, posY, sizeX, sizeY, gallery[currentImage]);
		prevImage = currentImage;
	}
}

void MP3_Player_Start()
{
	USBAudio_Init();
	transition_screen(0x0000, rand() % 6,  0);		//Black Transition - Random Pattern
	//GLCD_Clear(Black);
	GLCD_SetBackColor(Black);
	GLCD_SetTextColor(White);
	GLCD_DisplayStringCutout(0, 0, 1 , "     MP3 PLAYER     ", White);
	GLCD_DisplayString(24, 0, 0, "                    HOLD UP TO EXIT                  ");
	GLCD_DisplayString(27, 0, 0, "                 Created by Victor Do                ");
	Mute = FALSE;
}

// Assuming these are defined elsewhere
extern uint32_t Volume;  // From usbdmain.c
#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 240
#define MAX_VOLUME 16   // Adjust based on your volume range
#define BASE_RADIUS 30   // Base radius for the circle
#define PULSE_AMPLITUDE 10  // How much the circle pulsates
#define PULSE_SPEED 0.1f   // Speed of pulsation
void MP3_Player_Update(uint32_t ticks)
{
	Mute = FALSE;
	
	// Calculate center coordinates
    int centerX = SCREEN_WIDTH / 2;
    int centerY = SCREEN_HEIGHT / 2;
    
    // Calculate base radius based on volume level
    int baseRadius = (int)(BASE_RADIUS * Volume);
    
    // Calculate pulsation using sine wave
    float pulseOffset = (sinf(ticks * PULSE_SPEED) + 2) * PULSE_AMPLITUDE;
    
    // Calculate final radius with pulsation
    int finalRadius = baseRadius + (int)pulseOffset;
    
    // Ensure radius stays positive
    if (finalRadius < 1) finalRadius = 1;
    
    // Clear previous frame (optional - depending on your display handling)
    GLCD_DrawCircle(centerX, centerY, finalRadius + 1, 0x0000); // Black
    
    // Draw new circle
    GLCD_DrawCircle(centerX, centerY, finalRadius, 0xFFFF); // White
		
}

void MP3_Player_Exit()
{
	Mute = TRUE;
}
void delay (int cnt) {
  cnt <<= 18;
  while (cnt--);
}
void GAME_Exit(){
	uint32_t joystick_state;
    transition_screen(Red, rand() % 6, PATTERN_TOP_TO_BOTTOM);
    GLCD_SetBackColor(Black);
    GLCD_SetTextColor(White);
    GLCD_DisplayString(4, 0, 1 , "      YOU DIED      ");
    GLCD_DisplayString(21, 0, 0, "                 Better Luck Next Time                ");
    GLCD_DisplayString(24, 0, 0, "                 Created by Victor Do                ");
    
    delay(50);
    
    while((joystick_state & KBD_SELECT) == 0) {

        joystick_state = get_button();
    }
}

void incrementTicks(){
	if (ticks++ >= 9) {                       /* Set Clock1s to 10ms */
			ticks    = 0;
			tickCount += 1;
		}
}

void draw_connected_lines(int x_offset, int y_offset, int clear) {
    static int phase = 0;
    int x_shift = phase % 2;  // Oscillates between 0 and 1
    int y_shift = (phase % 6) / 2;  // Cycles through 0,1,2
    
    phase = (phase + 1) % 6;  // Increment phase, wrap at 6
    
    int final_x = x_offset + x_shift;
    int final_y = y_offset + y_shift * 3;  // Multiply by 3 for larger vertical movement
    
    unsigned short color_main = clear ? Black : Red;
    unsigned short color_secondary = clear ? Black : White;
    
    #define OFFSET(x,y) (x + final_x), (y + final_y)
    
    // Upper section
    GLCD_DrawLine(OFFSET(66, 15), OFFSET(77, 62), color_main);
    GLCD_DrawLine(OFFSET(77, 62), OFFSET(89, 14), color_main);
    GLCD_DrawLine(OFFSET(93, 59), OFFSET(104, 15), color_main);
    GLCD_DrawLine(OFFSET(104, 15), OFFSET(114, 57), color_main);
    GLCD_DrawLine(OFFSET(98, 39), OFFSET(109, 36), color_main);
    GLCD_DrawLine(OFFSET(121, 56), OFFSET(118, 15), color_main);
    GLCD_DrawLine(OFFSET(118, 15), OFFSET(129, 32), color_main);
    GLCD_DrawLine(OFFSET(129, 32), OFFSET(133, 14), color_main);
    GLCD_DrawLine(OFFSET(133, 14), OFFSET(143, 53), color_main);
    GLCD_DrawLine(OFFSET(149, 52), OFFSET(146, 15), color_main);
    GLCD_DrawLine(OFFSET(146, 15), OFFSET(163, 16), color_main);
    GLCD_DrawLine(OFFSET(163, 16), OFFSET(147, 33), color_main);
    GLCD_DrawLine(OFFSET(171, 15), OFFSET(175, 47), color_main);
    GLCD_DrawLine(OFFSET(187, 49), OFFSET(183, 14), color_main);
    GLCD_DrawLine(OFFSET(183, 14), OFFSET(200, 22), color_main);
    GLCD_DrawLine(OFFSET(200, 22), OFFSET(187, 34), color_main);
    GLCD_DrawLine(OFFSET(187, 34), OFFSET(203, 46), color_main);
    GLCD_DrawLine(OFFSET(213, 14), OFFSET(216, 48), color_main);
    GLCD_DrawLine(OFFSET(216, 48), OFFSET(236, 46), color_main);
    GLCD_DrawLine(OFFSET(215, 34), OFFSET(229, 32), color_main);
    GLCD_DrawLine(OFFSET(213, 15), OFFSET(237, 12), color_main);

    // Lower section
    GLCD_DrawLine(OFFSET(109, 80), OFFSET(97, 71), color_main);
    GLCD_DrawLine(OFFSET(97, 71), OFFSET(87, 86), color_main);
    GLCD_DrawLine(OFFSET(87, 86), OFFSET(111, 95), color_main);
    GLCD_DrawLine(OFFSET(111, 95), OFFSET(102, 108), color_main);
    GLCD_DrawLine(OFFSET(102, 108), OFFSET(91, 100), color_main);
    GLCD_DrawLine(OFFSET(115, 75), OFFSET(119, 100), color_main);
    GLCD_DrawLine(OFFSET(119, 100), OFFSET(130, 97), color_main);
    GLCD_DrawLine(OFFSET(130, 97), OFFSET(126, 72), color_main);
    GLCD_DrawLine(OFFSET(138, 95), OFFSET(133, 69), color_main);
    GLCD_DrawLine(OFFSET(133, 69), OFFSET(144, 73), color_main);
    GLCD_DrawLine(OFFSET(143, 73), OFFSET(137, 85), color_main);
    GLCD_DrawLine(OFFSET(137, 85), OFFSET(151, 92), color_main);
    GLCD_DrawLine(OFFSET(153, 72), OFFSET(163, 92), color_main);
    GLCD_DrawLine(OFFSET(163, 92), OFFSET(166, 66), color_main);
    GLCD_DrawLine(OFFSET(170, 64), OFFSET(174, 89), color_main);
    GLCD_DrawLine(OFFSET(177, 66), OFFSET(186, 86), color_main);
    GLCD_DrawLine(OFFSET(190, 64), OFFSET(186, 86), color_main);
    
		GLCD_DrawLine(OFFSET(202, 63), OFFSET(212, 73), color_main);
    GLCD_DrawLine(OFFSET(212, 73), OFFSET(204, 85), color_main);
    GLCD_DrawLine(OFFSET(204, 85), OFFSET(195, 75), color_main);
    GLCD_DrawLine(OFFSET(195, 75), OFFSET(202, 63), color_main);
		
    GLCD_DrawLine(OFFSET(221, 85), OFFSET(218, 60), color_main);
    GLCD_DrawLine(OFFSET(218, 60), OFFSET(232, 68), color_main);
    GLCD_DrawLine(OFFSET(232, 68), OFFSET(220, 76), color_main);
    GLCD_DrawLine(OFFSET(220, 76), OFFSET(235, 82), color_main);

    // White lines
    GLCD_DrawLine(OFFSET(0, 46), OFFSET(35, 56), color_secondary);
    GLCD_DrawLine(OFFSET(35, 56), OFFSET(0, 70), color_secondary);
    GLCD_DrawLine(OFFSET(0, 93), OFFSET(54, 77), color_secondary);
    GLCD_DrawLine(OFFSET(54, 77), OFFSET(0, 121), color_secondary);
    GLCD_DrawLine(OFFSET(291, 0), OFFSET(264, 54), color_secondary);
    GLCD_DrawLine(OFFSET(264, 54), OFFSET(319, 21), color_secondary);
    GLCD_DrawLine(OFFSET(319, 39), OFFSET(288, 58), color_secondary);
    GLCD_DrawLine(OFFSET(288, 68), OFFSET(319, 61), color_secondary);
}

void Game_Start() {
    uint32_t joystick_state;
    int x_pos = 0, y_pos = 0;  // Starting position

    transition_screen(0x0000, rand() % 6, 0);
    GLCD_SetBackColor(Black);
    GLCD_SetTextColor(White);
		
    GLCD_DisplayString(20, 0, 0, "              Move the Joystick to Play             ");
    GLCD_DisplayString(21, 0, 0, "                   [SELECT TO START]                  ");
    GLCD_DisplayString(24, 0, 0, "          Survive the attack of the red balls         ");
    GLCD_DrawBox(30, 140, 260, 80, White);
	
		draw_connected_lines(x_pos, y_pos, 0);
    delay(50);
    
    while((joystick_state & KBD_SELECT) == 0) {
				if(tickCount %10 == 0){
				draw_connected_lines(x_pos, y_pos, 0);
        draw_connected_lines(x_pos, y_pos, 1);
				}
				

        joystick_state = get_button();
        incrementTicks();
        snprintf(buf, sizeof(buf), "Ticks: %llu", tickCount);
        GLCD_DisplayString(32, 0, 0, (unsigned char *)buf);
		
    }
    Game_Script_Init();
}

void Game_Update(uint32_t ticks){
	Game_Script_Update(ticks);
	Game_Script_TimerTick();
}

void MainMenu_Input(uint32_t key){
	if (key == KBD_SELECT){
		curr_state = menu_select +1;
	} else{
		MainMenuScript_Input(key);
	}
}

void Gallery_Input(uint32_t key){
  switch(key){
    case KBD_LEFT:
      currentImage--;
      if (currentImage < 0){
        currentImage = gallerySize - 1;
      }
      break;
    case KBD_RIGHT:
      currentImage++;
      if (currentImage >= gallerySize){
        currentImage = 0;
      }
      break;
    case KBD_UP:
      curr_state = STATE_MAIN_MENU;
      break;
    default:
      break;
  }
	delay(15);
}


void simple_input(uint32_t key){
  if (key == KBD_UP){
    curr_state = STATE_MAIN_MENU;
  }
	if (curr_state != STATE_MP3_PLAYER){
		delay(15);
	}
		
}

//the game input handler
// handles the joystick movement and the button press
void game_input(uint32_t key){
  Game_Script_Input(key);
}


//Thread Declarations and priority configurations
void GameTimer_handler(void const *argument);
//void UpdateLoopThread(void const *argument);

osThreadId GameTimerThread_ID;
//osThreadId UpdateLoopThread_ID;
osThreadId t_main_ID;

osThreadDef(GameTimer_handler, osPriorityAboveNormal, 128, 0);
//osThreadDef(UpdateLoopThread, osPriorityNormal, 128, 0); 




void GameTimer_handler(void const *argument){
	//GLCD_Clear(Red);
	while(1){
		osSignalWait(0x01, osWaitForever);
		GLCD_Clear(DarkGreen);
		Game_Script_TimerTick();
		//osThreadYield();
	}
}

// Timer callback functions to trigger each process based on its period
void TimerCallbackA(void const *param) {
    osSignalSet(GameTimerThread_ID, 0x01);  // Signal Process A to start
}
osTimerDef(GameTimer, TimerCallbackA);



 
	
void UpdateLoopThread(){
	uint32_t joystick_state;  // Get Joystick state
	GLCD_Clear(Blue);
	for (;;)
	{
		joystick_state = get_button();  // Get Joystick state
		//osSignalWait(0x02, osWaitForever);
		//GLCD_Clear(Yellow);
		if (curr_state != prev_state)
		{
			if (States[prev_state].exit != NULL && prev_state != -1)
			{
				States[prev_state].exit();
			}
			//GLCD_Clear(DarkGreen);
			States[curr_state].init();
			prev_state = curr_state;
			//GLCD_Clear(Red);
		}
		incrementTicks();
		States[curr_state].update(tickCount);
		States[curr_state].input(joystick_state);
		//osThreadYield();
	}
}






// Main function
int main(void) {
	//int i,j,k,l;
	
	//t_main_ID = osThreadGetId();
	//osThreadSetPriority(t_main_ID, osPriorityHigh);
	
	//SystemInit();
	KBD_Init();
	Mute = TRUE;
	
	
	#ifdef __USE_LCD
	GLCD_Init();
	GLCD_Clear(White);
	transition_screen(Black, PATTERN_LEFT_TO_RIGHT,  0);		//Black Transition - Random Pattern
	GLCD_SetBackColor(Black);
	GLCD_SetTextColor(White);
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
	#endif

	
	#ifdef __USE_LCD
	//GLCD_Clear(Blue);
	transition_screen(Blue, rand() % 6,  0);
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
	#endif
	
	#ifdef __USE_LCD
	//GLCD_Clear(Red);
	transition_screen(Red, rand() % 6,  0);
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
	#endif
	
	#ifdef __USE_LCD
	//GLCD_Clear(Green);
	transition_screen(Green, rand() % 6,  0);
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
	#endif
	
	//USBAudio_Init();
	
	
	States[STATE_MAIN_MENU].init = MainMenu_Init;
	States[STATE_MAIN_MENU].update = MainMenu_Update;
	States[STATE_MAIN_MENU].input = MainMenu_Input;
	States[STATE_MAIN_MENU].exit = NULL;
	
	States[STATE_GALLERY].init = Gallery_Start;
	States[STATE_GALLERY].update = Gallery_Update;
	States[STATE_GALLERY].input = Gallery_Input;
	States[STATE_GALLERY].exit = NULL;
	
	States[STATE_MP3_PLAYER].init = MP3_Player_Start;
	States[STATE_MP3_PLAYER].update = MP3_Player_Update;
	States[STATE_MP3_PLAYER].input = simple_input;
	States[STATE_MP3_PLAYER].exit = MP3_Player_Exit;
	
	States[STATE_GAME].init = Game_Start;
	States[STATE_GAME].update = Game_Update;
	States[STATE_GAME].input = game_input;
	States[STATE_GAME].exit = GAME_Exit;
	
	// Create the mutex
		//    loggerMutex = osMutexCreate(osMutex(loggerMutex));
    //if (loggerMutex == NULL) {
        // Handle error: Failed to create the mutex
    //}
		
    //Init_Threads();        // Create and initialize threads
    
	#ifdef __USE_LCD
	//GLCD_Clear(Yellow);
	transition_screen(Yellow, rand() % 6,  0);
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
	#endif
	//start UpdateLoopThread
	
		

	#ifdef __USE_LCD
	//GLCD_Clear(Magenta);
	transition_screen(Magenta, rand() % 6,  0);
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
	#endif
	
	//delete own thread
	//osDelay(osWaitForever);
	

	
	//osThreadSetPriority(t_main_ID, osPriorityBelowNormal);
	
    // Round-robin scheduling: Execute tasks and yield control
    /*while (1) {
			osThreadYield();
        //UpdateLoopThread(NULL);
				//GLCD_Clear(Magenta);
		*/

	#ifdef __USE_LCD
	//GLCD_Clear(Red);
	transition_screen(Red, rand() % 6,  0);
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
	#endif
	
	//osKernelInitialize();  // Initialize RTOS
	//t_main_ID = osThreadGetId();
	//osThreadSetPriority(t_main_ID, osPriorityHigh);
	
	//GameTimerThread_ID = osThreadCreate(osThread(GameTimer_handler), NULL);
  //if (!GameTimerThread_ID) return -1;
	
	//osTimerId GameTimer = osTimerCreate(osTimer(GameTimer), osTimerPeriodic, (void *)1);
	//GLCD_Clear(Green);
	transition_screen(Green, rand() % 6,  0);
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
	
	//osKernelStart();       // Start thread execution
	
	//osTimerStart(GameTimer, 2000);
	
	#ifdef __USE_LCD
	//GLCD_Clear(Yellow);
	transition_screen(Yellow, rand() % 6,  0);
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
	#endif
	//osThreadTerminate(t_main_ID);
	
	#ifdef __USE_LCD
	//GLCD_Clear(Magenta);
	transition_screen(Magenta, rand() % 6,  0);
	GLCD_DisplayStringCutout(0, 0, 1 , "COE718 Final Project", White);
	GLCD_DisplayStringCutout(4, 0, 0 , "    Created by Victor Do - 501137174", White);
	#endif
	osThreadSetPriority(t_main_ID, osPriorityNormal);
	while (1) {
		UpdateLoopThread();
	}                             // Infinite loop to keep main active
			

}

/*
	GLCD_DisplayString(7, 0, 1 , "    > PICTURES <    ");
	GLCD_DrawBox(0, 167, 320, 26, 0x0000);
	
	GLCD_DisplayString(7, 0, 1 , "      > GAME <      ");
	GLCD_DrawBox(0, 167, 320, 26, 0x0000);
	
	GLCD_DisplayString(7, 0, 1 , "   > MP3 PLAYER <   ");
	GLCD_DrawBox(0, 167, 320, 26, 0x0000);
		

    transition_screen(0x0000, rand() % 6,  0);		//Black Transition - Random Pattern
		
		GLCD_FillBox(0,0,16,16,0xF800);
		GLCD_FillBox(16,16,16,16,0xF800);
		
		//GLCD_DrawBox(160,120,32,32,0xF800);
		
		while(1){
			for(i = -32; i <= 40; i++){
				GLCD_DrawBox((i-1)*8,120,64,64,0x0000);
				GLCD_DrawBox((i-1)*7,120+64,64,64,0x0000);
				GLCD_DrawBox((i-1)*6,120+128,64,64,0x0000);
				GLCD_DrawBox((i-1)*5,120-64,64,64,0x0000);
				//delay(5);
				GLCD_DrawBox(i*8,120,64,64,0xF800);
				GLCD_DrawBox(i*7,120+64,64,64,0xF800);
				GLCD_DrawBox(i*6,120+128,64,64,0xF800);
				GLCD_DrawBox(i*5,120-64,64,64,0xF800);
				delay(5);
			}
			for(j = -32; j <= 20; j++){
				GLCD_DrawBox((j-1)*16,120,64,64,0x0000);
				//delay(5);
				GLCD_DrawBox(j*16,120,64,64,0xF800);
				delay(5);
			}
			for(k = -32; k <= 160; k++){
				GLCD_DrawBox((k-1)*2,120,64,64,0x0000);
				//delay(5);
				GLCD_DrawBox(k*2,120,64,64,0xF800);
				delay(5);
			}
			for(l = -32; l <= 10; l++){
				GLCD_DrawBox((l-1)*32,120,64,64,0x0000);
				//delay(5);
				GLCD_DrawBox(l*32,120,64,64,0xF800);
				delay(5);
			}
		}
		
    return 0;
}*/

