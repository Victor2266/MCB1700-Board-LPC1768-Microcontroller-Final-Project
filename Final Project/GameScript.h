//Game Script Functions

#ifndef GAME_SCRIPT_H
#define GAME_SCRIPT_H
#include <stdint.h>

void Game_Script_Init(void);
void Game_Script_Update(uint32_t ticks);
void Game_Script_TimerTick(void);
void Game_Script_Input(uint32_t key);
#endif
