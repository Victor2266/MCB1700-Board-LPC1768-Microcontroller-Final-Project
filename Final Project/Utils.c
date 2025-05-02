/* Utils.c */

#include "LPC17xx.H" /* LPC17xx definitions */
#include "Utils.h"
#include "GLCD.h"

// the color that will be considered as transparancy in the bitmap
unsigned short alpha_color = Magenta;

// draws a sprite on the screen, based on the info in the struct
void draw_sprite(Sprite *sprite)
{
    GLCD_Bitmap(sprite->x, sprite->y, sprite->width, sprite->height,
                sprite->ptr + sprite->index * (sprite->width * sprite->height * 2));
}

// draws a sprite, but skips pixels that have a value of alpha_color
void draw_sprite_alpha(Sprite *sprite)
{
    GLCD_BitmapCutout(sprite->x, sprite->y, sprite->width, sprite->height,
                     sprite->ptr + sprite->index * (sprite->width * sprite->height * 2), alpha_color);
}

// fills the area of the screen that the sprite takes up with the passed color
void clean_sprite_area(Sprite *sprite, unsigned short color)
{
    GLCD_FillBox(sprite->x, sprite->y, sprite->width, sprite->height, color);
}
