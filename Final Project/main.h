// main.h
#ifndef MAIN_H
#define MAIN_H

// State Machine Definitions
#define STATE_MAIN_MENU    0
#define STATE_GALLERY      1
#define STATE_MP3_PLAYER   2
#define STATE_GAME         3
#define STATE_TOTAL        4

// State variables
extern int curr_state;
extern int prev_state;

#endif // MAIN_H
