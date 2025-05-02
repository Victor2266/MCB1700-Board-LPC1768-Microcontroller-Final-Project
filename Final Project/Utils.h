// Utils.h Utility Functions
#ifndef _UTILS_H
#define _UTILS_H
#include "LPC17xx.H" /* LPC17xx definitions */

// sprite struct that packs the sprite bitmap info with descriptive info
typedef struct
{
    int x, y;           // x and y coordinates of the image on the GLCD
    int width, height;  // width and height of a bitmap image
    unsigned char *ptr; // pointer to the bitmap array
    int index;          // index of image in a bitmap array, for bitmaps with multiple images
} Sprite;

// sprite wrapper that can supports easy timed bitmap image transitions
typedef struct
{
    Sprite sprite;        // the sprite container
    int num_imgs;         // # of images in the animation
    uint32_t last_update; // # of ticks at last sprite update
    int update_msec;      // # of milliseconds between image updates
} AnimatedSprite;

// draws a sprite on the screen, based on the info in the struct
void draw_sprite(Sprite *sprite);
// draws a sprite, but skips pixels that have a value of alpha_color (defined in utils.c)
void draw_sprite_alpha(Sprite *sprite);
// fills the area of the screen that the sprite takes up with the passed color
void clean_sprite_area(Sprite *sprite, unsigned short color);

#endif
