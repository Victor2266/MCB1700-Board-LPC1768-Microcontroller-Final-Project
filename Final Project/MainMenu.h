#ifndef _MainMenu
#define _MainMenu
extern int menu_select;

// used for menu state entry
void MainMenu_Init(void);
// used for graphical update of the menu
void MainMenu_Update(uint32_t ticks);

// used for passing input data to the menu
void MainMenuScript_Input(uint32_t key);

#endif
