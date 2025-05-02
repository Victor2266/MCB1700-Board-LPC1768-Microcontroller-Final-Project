
#include <stdio.h>
#include "cmsis_os.h" // CMSIS RTOS header file
#include "LPC17xx.h"
#include "GLCD.h"
#include "GameScript.h"
#include "KBD.h"
#include "MainMenu.h"
#include <stdint.h>
#include <stdlib.h>
#include <math.h>
#include "main.h"

// Add missing PI definition
#ifndef M_PI
#define M_PI 3.14159265358979323846f
#endif

// Helper macros for min/max since we can't use fmin/fmax
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b))

#define MAP_WIDTH 960
#define MAP_HEIGHT 720
#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 240
#define MAX_ENEMIES 32
#define MAX_PROJECTILES 16
#define MAX_UPGRADES 5
#define MAX_COINS 10

#define OBSTACLE_SIZE 144
#define CENTER_GRID_X 320
#define CENTER_GRID_Y 240
#define SCREEN_CENTER_X (SCREEN_WIDTH / 2)
#define SCREEN_CENTER_Y (SCREEN_HEIGHT / 2)

#define MAX_PROJECTILE_SPEED 4.0f
#define MAX_PROJECTILE_RADIUS 50
#define MAX_PROJECTILE_LIFETIME 100 // 10 seconds
#define MIN_FIRE_RATE 3              // milliseconds between shots

// Add coin-specific defines
#define COIN_RADIUS 5
#define COIN_SPAWN_RATE 20 // 5 seconds between coin spawns
#define COIN_LIFETIME 20  // Coins disappear after 15 seconds
#define COIN_SCORE 100

#define PLAYER_RADIUS 10
#define MAX_ENEMY_RADIUS 10


// defines for upgrades
#define UPGRADE_RADIUS 8
#define UPGRADE_SPAWN_RATE 20 // 10 seconds between upgrade spawns
#define UPGRADE_LIFETIME 20  // Upgrades disappear after 10 seconds
#define MULTI_SHOT_MAX 3        // Maximum number of simultaneous projectiles

// Game State Structures
typedef struct
{
    int x, y;           // Position
    int health;         // Hearts
    int score;          // Current score
    float speed;        // Movement speed
    int invulnerable;   // Invulnerability timer
    int last_hit_time;  // Time since last hit
    int last_shot_time; // Track last shot time for fire rate
    int multi_shot;     // Number of projectiles fired at once

} Player;

typedef struct
{
    int screen_x;
    int screen_y;
} ScreenPos;

typedef struct
{
    int x, y; // World position
    int active;
    float speed;
    ScreenPos last_pos; // Last screen position
} Enemy;

typedef struct
{
    int x, y;
    int active;
    // float speed;
    float dx, dy; // Direction vector
    int lifetime;
    ScreenPos last_pos;
} Projectile;

typedef struct
{
    int x, y;
    int type; // 0: Coin, 1: Speed, 2: Projectile Size, 3: Fire Rate
    int active;
    ScreenPos last_pos;
} Upgrade;

typedef struct
{
    int x, y;
    int active;
    int spawn_time; // When the coin was spawned
    ScreenPos last_pos;
} Coin;

// Global Game Variables
Player player;
Enemy enemies[MAX_ENEMIES];
Projectile projectiles[MAX_PROJECTILES];
Upgrade upgrades[MAX_UPGRADES];
Coin coins[MAX_COINS];
uint16_t MAX_DIFFICULTY;
static int last_score = -1;
static int last_health = -1;

Enemy *closest_enemy = NULL;
float closest_enemy_distance = INFINITY;

int game_time = 0;
int enemy_spawn_rate = 30; // milliseconds
int last_enemy_spawn = 0;
int last_coin_spawn = 0;
int difficulty_multiplier = 1;
int last_upgrade_spawn = 0;
int timerCounter = 0;

float PROJECTILE_SPEED = 4.0f;
uint8_t PROJECTILE_RADIUS = 5;
uint32_t PROJECTILE_LIFETIME = 20; // 2 seconds
uint32_t FIRE_RATE = 20;           // milliseconds between shots
uint8_t ENEMY_RADIUS = 10;
char score_str[20];

// Initialize Game State
void Game_Script_Init(void)
{
		snprintf(score_str, sizeof(score_str), "Score: %d\0\0\0\0\0\0\0\0\0\0\0\0", 0);
		last_score = -1;
		last_health = -1;
    // Initialize Player
    int i = 0;
    player.x = MAP_WIDTH / 2;
    player.y = MAP_HEIGHT / 2;
    player.health = 3;
    player.score = 0;
    player.speed = 4.0;
    player.invulnerable = 0;
    player.multi_shot = 1; // Initialize with single shot
		
		MAX_DIFFICULTY = player.speed - 1;
	
    timerCounter = 0;
    ENEMY_RADIUS = 10;

    game_time = 0;
    enemy_spawn_rate = 30; // milliseconds
    last_enemy_spawn = 0;
    last_coin_spawn = 0;
    difficulty_multiplier = 1;
    last_upgrade_spawn = 0;

    PROJECTILE_SPEED = 4.0f;
    PROJECTILE_RADIUS = 5;
    PROJECTILE_LIFETIME = 100; // 2 seconds
    FIRE_RATE = 100;           // milliseconds between shots
    ENEMY_RADIUS = 10;

    // Clear Enemies
    for (i = 0; i < MAX_ENEMIES; i++)
    {
        enemies[i].active = 0;
    }

    // Clear Projectiles
    for (i = 0; i < MAX_PROJECTILES; i++)
    {
        projectiles[i].active = 0;
    }

    // Clear Upgrades
    for (i = 0; i < MAX_UPGRADES; i++)
    {
        upgrades[i].active = 0;
    }

    // Clear Coins
    for (i = 0; i < MAX_COINS; i++)
    {
        coins[i].active = 0;
    }

    // Draw Initial Screen Elements
    GLCD_Clear(Black);
    GLCD_DrawCircle(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, PLAYER_RADIUS, Blue); // Player
    //GLCD_DisplayStringCutout(0, 0, 1, "Score: 0", White);
		//GLCD_DisplayString(0, 0, 1, "Score: 0");
		
    // Draw Heart Icons
    for (i = 0; i < player.health; i++)
    {
        GLCD_DrawLine(305 - i * 20, 5, 305 - i * 20, 15, Red);
        GLCD_DrawLine(310 - i * 20, 10, 300 - i * 20, 10, Red);
    }
}

// Function to spawn a new projectile
void SpawnProjectile(void)
{
    int i, shot;
    int currentTime = game_time;
    float base_dx, base_dy, length;
    // Check fire rate
    if (currentTime - player.last_shot_time > FIRE_RATE)
    {
        return;
    }

    // Only shoot if there's an enemy
    if (closest_enemy == NULL)// || !closest_enemy->active)
    {
        return;
    }

    base_dx = closest_enemy->x - player.x;
    base_dy = closest_enemy->y - player.y;
    length = sqrtf(base_dx * base_dx + base_dy * base_dy);

    // For each shot in multi-shot
    for (shot = 0; shot < player.multi_shot; shot++)
    {
        for (i = 0; i < MAX_PROJECTILES; i++)
        {
            if (!projectiles[i].active)
            {
                float angle_offset = (shot - (player.multi_shot - 1) / 2.0f) * 15.0f; // 15 degree spread
                float rad_angle = angle_offset * M_PI / 180.0f;

                // Rotate the direction vector
                float dx = base_dx * cosf(rad_angle) - base_dy * sinf(rad_angle);
                float dy = base_dx * sinf(rad_angle) + base_dy * cosf(rad_angle);

                // Normalize and apply speed
                if (length > 0)
                {
                    projectiles[i].dx = (dx / length) * PROJECTILE_SPEED;
                    projectiles[i].dy = (dy / length) * PROJECTILE_SPEED;
                }

                projectiles[i].x = player.x;
                projectiles[i].y = player.y;
                projectiles[i].active = 1;
                projectiles[i].lifetime = currentTime + PROJECTILE_LIFETIME;
                projectiles[i].last_pos.screen_x = SCREEN_CENTER_X;
                projectiles[i].last_pos.screen_y = SCREEN_CENTER_Y;
                break;
            }
        }
    }
    player.last_shot_time = currentTime;
}

// Spawn Enemies Near Screen Edges
void SpawnEnemy(void)
{
    int i = 0;
    for (i = 0; i < MAX_ENEMIES; i++)
    {
        if (!enemies[i].active)
        {
            // Randomly choose side to spawn
            int side = rand() % 4;
            switch (side)
            {
            case 0: // Top
                enemies[i].x = player.x + (rand() % SCREEN_WIDTH) - SCREEN_WIDTH / 2;
                enemies[i].y = player.y - SCREEN_HEIGHT / 2 - 20;
                break;
            case 1: // Bottom
                enemies[i].x = player.x + (rand() % SCREEN_WIDTH) - SCREEN_WIDTH / 2;
                enemies[i].y = player.y + SCREEN_HEIGHT / 2 + 20;
                break;
            case 2: // Left
                enemies[i].x = player.x - SCREEN_WIDTH / 2 - 20;
                enemies[i].y = player.y + (rand() % SCREEN_HEIGHT) - SCREEN_HEIGHT / 2;
                break;
            case 3: // Right
                enemies[i].x = player.x + SCREEN_WIDTH / 2 + 20;
                enemies[i].y = player.y + (rand() % SCREEN_HEIGHT) - SCREEN_HEIGHT / 2;
                break;
            }
            enemies[i].speed = 1.0 * difficulty_multiplier;
            enemies[i].active = 1;
            break;
        }
    }
}

// Function to convert world coordinates to screen coordinates
void WorldToScreen(int worldX, int worldY, int *screenX, int *screenY)
{
    *screenX = worldX - (player.x - SCREEN_CENTER_X);
    *screenY = worldY - (player.y - SCREEN_CENTER_Y);
}

int CheckObstacleCollision(int x, int y, int radius)
{
    // Define obstacle positions in world space
    int center_grid_left = CENTER_GRID_X - OBSTACLE_SIZE / 2 - 64;
    int center_grid_right = CENTER_GRID_X + MAP_WIDTH / 3 - OBSTACLE_SIZE / 2 + 64;
    int center_grid_top = CENTER_GRID_Y - OBSTACLE_SIZE / 2 - 64;
    int center_grid_bottom = CENTER_GRID_Y + MAP_HEIGHT / 3 - OBSTACLE_SIZE / 2 + 64;

    // Check collision with each obstacle (including radius in calculation)
    // Top-left obstacle
    if (x + radius > center_grid_left && x - radius < center_grid_left + OBSTACLE_SIZE &&
        y + radius > center_grid_top && y - radius < center_grid_top + OBSTACLE_SIZE)
        return 1;

    // Top-right obstacle
    if (x + radius > center_grid_right && x - radius < center_grid_right + OBSTACLE_SIZE &&
        y + radius > center_grid_top && y - radius < center_grid_top + OBSTACLE_SIZE)
        return 1;

    // Bottom-left obstacle
    if (x + radius > center_grid_left && x - radius < center_grid_left + OBSTACLE_SIZE &&
        y + radius > center_grid_bottom && y - radius < center_grid_bottom + OBSTACLE_SIZE)
        return 1;

    // Bottom-right obstacle
    if (x + radius > center_grid_right && x - radius < center_grid_right + OBSTACLE_SIZE &&
        y + radius > center_grid_bottom && y - radius < center_grid_bottom + OBSTACLE_SIZE)
        return 1;

    return 0;
}

// New function to spawn coins
void SpawnCoin(void)
{
    int i;
    for (i = 0; i < MAX_COINS; i++)
    {
        if (!coins[i].active)
        {
            // Spawn coin in a random location near the player
            // but not too close to make it challenging
            int angle = rand() % 360;
            float radius = 100 + (rand() % 100); // Between 100-200 pixels from player

            // Use cosf and sinf for single-precision float calculations
            coins[i].x = player.x + (int)(radius * cosf(angle * M_PI / 180.0f));
            coins[i].y = player.y + (int)(radius * sinf(angle * M_PI / 180.0f));

            // Ensure coin is within map bounds using our MAX/MIN macros
            coins[i].x = MAX(COIN_RADIUS, MIN(MAP_WIDTH - COIN_RADIUS, coins[i].x));
            coins[i].y = MAX(COIN_RADIUS, MIN(MAP_HEIGHT - COIN_RADIUS, coins[i].y));

            // Don't spawn if would collide with obstacle
            if (CheckObstacleCollision(coins[i].x, coins[i].y, COIN_RADIUS))
            {
                continue;
            }

            coins[i].active = 1;
            coins[i].spawn_time = game_time;
            coins[i].last_pos.screen_x = -1; // Force initial draw
            coins[i].last_pos.screen_y = -1;
            break;
        }
    }
}
// Function to spawn upgrades
void SpawnUpgrade(void)
{
    int i;
    for (i = 0; i < MAX_UPGRADES; i++)
    {
        if (!upgrades[i].active)
        {
            // Spawn upgrade in random location near the player
            int angle = rand() % 360;
            float radius = 150 + (rand() % 100); // Between 150-250 pixels from player

            upgrades[i].x = player.x + (int)(radius * cosf(angle * M_PI / 180.0f));
            upgrades[i].y = player.y + (int)(radius * sinf(angle * M_PI / 180.0f));

            // Ensure upgrade is within map bounds
            upgrades[i].x = MAX(UPGRADE_RADIUS, MIN(MAP_WIDTH - UPGRADE_RADIUS, upgrades[i].x));
            upgrades[i].y = MAX(UPGRADE_RADIUS, MIN(MAP_HEIGHT - UPGRADE_RADIUS, upgrades[i].y));

            // Don't spawn if would collide with obstacle
            if (CheckObstacleCollision(upgrades[i].x, upgrades[i].y, UPGRADE_RADIUS))
            {
                continue;
            }

            // Randomly choose upgrade type
            upgrades[i].type = rand() % 5;
            upgrades[i].active = 1;
            break;
        }
    }
}

// Function to apply upgrade effects
void ApplyUpgrade(int type)
{
    switch (type)
    {
    case 0: // Fire rate upgrade
        if (FIRE_RATE > MIN_FIRE_RATE)
        {
            FIRE_RATE = MAX(MIN_FIRE_RATE, FIRE_RATE - 5); // Decrease by 5ms, but not below minimum
        }
        break;

    case 1:                                             // Speed upgrade
        player.speed = MIN(player.speed + 4.0f, 16.0f); // Cap at 16
        break;

    case 2: // Multi-shot upgrade
        if (player.multi_shot < MULTI_SHOT_MAX)
        {
            player.multi_shot++;
						if (player.health < 3)
							player.health++;
        }
        break;

    case 3: // Projectile size upgrade
        if (PROJECTILE_RADIUS < MAX_PROJECTILE_RADIUS)
        {
            PROJECTILE_RADIUS = MIN(PROJECTILE_RADIUS + 2, MAX_PROJECTILE_RADIUS);
        }
        break;
    case 4: // Projectile lifetime upgrade
        if (PROJECTILE_LIFETIME < MAX_PROJECTILE_LIFETIME)
        {
            PROJECTILE_LIFETIME = MIN(PROJECTILE_LIFETIME + 10, MAX_PROJECTILE_LIFETIME);
        }
        break;
    }
}

void UpdateCoins(void)
{
    int i;
    int screen_x, screen_y;
    float dx, dy, distance;

    for (i = 0; i < MAX_COINS; i++)
    {
        if (coins[i].active)
        {
            // Clear old position if it was on screen
            if (coins[i].last_pos.screen_x >= -COIN_RADIUS &&
                coins[i].last_pos.screen_x <= SCREEN_WIDTH + COIN_RADIUS &&
                coins[i].last_pos.screen_y >= -COIN_RADIUS &&
                coins[i].last_pos.screen_y <= SCREEN_HEIGHT + COIN_RADIUS)
            {
                GLCD_DrawFilledCircle(
                    coins[i].last_pos.screen_x,
                    coins[i].last_pos.screen_y,
                    COIN_RADIUS,
                    Black);
            }

            // Check if coin has expired
            if (game_time - coins[i].spawn_time > COIN_LIFETIME)
            {
                coins[i].active = 0;
                continue;
            }

            // Check if player collected the coin
            dx = coins[i].x - player.x;
            dy = coins[i].y - player.y;
            distance = sqrtf(dx * dx + dy * dy); // Using sqrtf instead of sqrt

            if (distance < PLAYER_RADIUS + COIN_RADIUS)
            {
                player.score += COIN_SCORE;
                coins[i].active = 0;
                continue;
            }

            // Draw coin at new screen position
            WorldToScreen(coins[i].x, coins[i].y, &screen_x, &screen_y);
            coins[i].last_pos.screen_x = screen_x;
            coins[i].last_pos.screen_y = screen_y;

            if (screen_x >= -COIN_RADIUS && screen_x <= SCREEN_WIDTH + COIN_RADIUS &&
                screen_y >= -COIN_RADIUS && screen_y <= SCREEN_HEIGHT + COIN_RADIUS)
            {
                // Make coins flash by alternating colors
                uint16_t coin_color = ((game_time / 250) % 2) ? Yellow : White;
                GLCD_DrawFilledCircle(screen_x, screen_y, COIN_RADIUS, coin_color);
            }
        }
    }
}
void UpdateUpgrades(void)
{
    int i;
    int screen_x, screen_y;
    float dx, dy, distance;

    for (i = 0; i < MAX_UPGRADES; i++)
    {
        if (upgrades[i].active)
        {
            // Clear old position if it was on screen
            if (upgrades[i].last_pos.screen_x >= -UPGRADE_RADIUS &&
                upgrades[i].last_pos.screen_x <= SCREEN_WIDTH + UPGRADE_RADIUS &&
                upgrades[i].last_pos.screen_y >= -UPGRADE_RADIUS &&
                upgrades[i].last_pos.screen_y <= SCREEN_HEIGHT + UPGRADE_RADIUS)
            {
                GLCD_DrawFilledCircle(
                    upgrades[i].last_pos.screen_x,
                    upgrades[i].last_pos.screen_y,
                    UPGRADE_RADIUS,
                    Black);
            }

            // Check if player collected the upgrade
            dx = upgrades[i].x - player.x;
            dy = upgrades[i].y - player.y;
            distance = sqrtf(dx * dx + dy * dy);

            if (distance < PLAYER_RADIUS + UPGRADE_RADIUS)
            {
                ApplyUpgrade(upgrades[i].type);
                upgrades[i].active = 0;
                continue;
            }

            // Draw upgrade at new screen position
            WorldToScreen(upgrades[i].x, upgrades[i].y, &screen_x, &screen_y);
            upgrades[i].last_pos.screen_x = screen_x;
            upgrades[i].last_pos.screen_y = screen_y;

            if (screen_x >= -UPGRADE_RADIUS && screen_x <= SCREEN_WIDTH + UPGRADE_RADIUS &&
                screen_y >= -UPGRADE_RADIUS && screen_y <= SCREEN_HEIGHT + UPGRADE_RADIUS)
            {
                // Different colors for different upgrade types
                uint16_t upgrade_color;
                switch (upgrades[i].type)
                {
                case 0:
                    upgrade_color = Magenta;
                    break; // Fire rate
                case 1:
                    upgrade_color = Cyan;
                    break; // Speed
                case 2:
                    upgrade_color = Green;
                    break; // Multi-shot
                case 3:
                    upgrade_color = Purple;
                    break; // Projectile size
                default:
                    upgrade_color = White;
                }
                GLCD_DrawFilledCircle(screen_x, screen_y, UPGRADE_RADIUS, upgrade_color);
            }
        }
    }
}
void UpdateProjectiles(void)
{
    int i, j;
    int screen_x, screen_y;

    for (i = 0; i < MAX_PROJECTILES; i++)
    {
        if (projectiles[i].active)
        {
            // Clear old position
            if (projectiles[i].last_pos.screen_x >= -PROJECTILE_RADIUS &&
                projectiles[i].last_pos.screen_x <= SCREEN_WIDTH + PROJECTILE_RADIUS &&
                projectiles[i].last_pos.screen_y >= -PROJECTILE_RADIUS &&
                projectiles[i].last_pos.screen_y <= SCREEN_HEIGHT + PROJECTILE_RADIUS)
            {
                GLCD_DrawCircle(
                    projectiles[i].last_pos.screen_x,
                    projectiles[i].last_pos.screen_y,
                    PROJECTILE_RADIUS,
                    Black);
            }

            // Update position
            projectiles[i].x += projectiles[i].dx;
            projectiles[i].y += projectiles[i].dy;

            // Check lifetime
            if (game_time >= projectiles[i].lifetime)
            {
                projectiles[i].active = 0;
                continue;
            }

            // Check collision with obstacles
            if (CheckObstacleCollision(projectiles[i].x, projectiles[i].y, PROJECTILE_RADIUS))
            {
                projectiles[i].active = 0;
                continue;
            }

            // Check collision with enemies
            for (j = 0; j < MAX_ENEMIES; j++)
            {
                if (enemies[j].active)
                {
                    float dx = projectiles[i].x - enemies[j].x;
                    float dy = projectiles[i].y - enemies[j].y;
                    float distance = sqrtf(dx * dx + dy * dy);

                    if (distance < PROJECTILE_RADIUS + ENEMY_RADIUS)
                    {
                        enemies[j].active = 0;
                        projectiles[i].active = 0;
                        player.score += 10;
                        break;
                    }
                }
            }

            // Draw new position if active
            if (projectiles[i].active)
            {
                WorldToScreen(projectiles[i].x, projectiles[i].y, &screen_x, &screen_y);
                projectiles[i].last_pos.screen_x = screen_x;
                projectiles[i].last_pos.screen_y = screen_y;

                if (screen_x >= -PROJECTILE_RADIUS && screen_x <= SCREEN_WIDTH + PROJECTILE_RADIUS &&
                    screen_y >= -PROJECTILE_RADIUS && screen_y <= SCREEN_HEIGHT + PROJECTILE_RADIUS)
                {
                    GLCD_DrawFilledCircle(screen_x, screen_y, PROJECTILE_RADIUS, Yellow);
                }
            }
        }
    }
}

// Update Game Logic
void Game_Script_Update(uint32_t ticks)
{
    int i = 0;
    float enemy_newX, enemy_newY, dx, dy, distance;
    int player_visible = 1;

    static ScreenPos last_obstacle_pos[4] = {{0, 0}, {0, 0}, {0, 0}, {0, 0}};
		static ScreenPos last_mapBorder_pos = {0,0};
    int screen_x, screen_y;

    // Calculate obstacle positions in the center grid
    int center_grid_left = CENTER_GRID_X - OBSTACLE_SIZE / 2;
    int center_grid_right = CENTER_GRID_X + MAP_WIDTH / 3 - OBSTACLE_SIZE / 2;
    int center_grid_top = CENTER_GRID_Y - OBSTACLE_SIZE / 2;
    int center_grid_bottom = CENTER_GRID_Y + MAP_HEIGHT / 3 - OBSTACLE_SIZE / 2;

    
    score_str[0] = '\0';

    // Reset closest enemy tracking at the start of each update
    closest_enemy = NULL;
    closest_enemy_distance = INFINITY;

    game_time = ticks;

    // Add automatic firing at the beginning of the update function
    SpawnProjectile(); // Will only fire if enough time has passed since last shot

    // Update projectiles
    UpdateProjectiles();

    // Spawn coins periodically
    if (game_time - last_coin_spawn > COIN_SPAWN_RATE)
    {
        SpawnCoin();
        last_coin_spawn = game_time;
    }
    // Update coins before drawing other elements
    UpdateCoins();

    // Spawn upgrades periodically
    if (game_time - last_upgrade_spawn > UPGRADE_SPAWN_RATE) {
        SpawnUpgrade();
        last_upgrade_spawn = game_time;
    }
    // Update upgrades
    UpdateUpgrades();

    // Clear previous obstacle positions
    for (i = 0; i < 4; i++)
    {
        if (last_obstacle_pos[i].screen_x != 0 || last_obstacle_pos[i].screen_y != 0)
        {
            // Clear slightly larger area to ensure complete removal
            GLCD_DrawBox(
                last_obstacle_pos[i].screen_x,
                last_obstacle_pos[i].screen_y,
                OBSTACLE_SIZE,
                OBSTACLE_SIZE,
                Black);
        }
    }

    // Draw new obstacle positions
    // Top-left obstacle
    WorldToScreen(center_grid_left - 64, center_grid_top - 64, &screen_x, &screen_y);
    GLCD_DrawBox(screen_x, screen_y, OBSTACLE_SIZE, OBSTACLE_SIZE, White);
    last_obstacle_pos[0].screen_x = screen_x;
    last_obstacle_pos[0].screen_y = screen_y;

    // Top-right obstacle
    WorldToScreen(center_grid_right + 64, center_grid_top - 64, &screen_x, &screen_y);
    GLCD_DrawBox(screen_x, screen_y, OBSTACLE_SIZE, OBSTACLE_SIZE, White);
    last_obstacle_pos[1].screen_x = screen_x;
    last_obstacle_pos[1].screen_y = screen_y;

    // Bottom-left obstacle
    WorldToScreen(center_grid_left - 64, center_grid_bottom + 64, &screen_x, &screen_y);
    GLCD_DrawBox(screen_x, screen_y, OBSTACLE_SIZE, OBSTACLE_SIZE, White);
    last_obstacle_pos[2].screen_x = screen_x;
    last_obstacle_pos[2].screen_y = screen_y;

    // Bottom-right obstacle
    WorldToScreen(center_grid_right + 64, center_grid_bottom + 64, &screen_x, &screen_y);
    GLCD_DrawBox(screen_x, screen_y, OBSTACLE_SIZE, OBSTACLE_SIZE, White);
    last_obstacle_pos[3].screen_x = screen_x;
    last_obstacle_pos[3].screen_y = screen_y;
		
		// Map 
		WorldToScreen(0, 0, &screen_x, &screen_y);
		if (last_mapBorder_pos.screen_x != 0 || last_mapBorder_pos.screen_y != 0)
			GLCD_DrawBox(last_mapBorder_pos.screen_x, last_mapBorder_pos.screen_y, MAP_WIDTH, MAP_HEIGHT, Black);
    GLCD_DrawBox(screen_x, screen_y, MAP_WIDTH, MAP_HEIGHT, White);
		last_mapBorder_pos.screen_x = screen_x;
		last_mapBorder_pos.screen_y = screen_y;


    // Spawn Enemies if needed
    if (game_time - last_enemy_spawn > enemy_spawn_rate)
    {
        SpawnEnemy();
        last_enemy_spawn = game_time;
    }

    // Update and Draw Enemies
    for (i = 0; i < MAX_ENEMIES; i++)
    {
        if (enemies[i].active)
        {
            // Clear previous enemy position if it was on screen
            if (enemies[i].last_pos.screen_x >= -ENEMY_RADIUS &&
                enemies[i].last_pos.screen_x <= SCREEN_WIDTH + ENEMY_RADIUS &&
                enemies[i].last_pos.screen_y >= -ENEMY_RADIUS &&
                enemies[i].last_pos.screen_y <= SCREEN_HEIGHT + ENEMY_RADIUS)
            {
                // Clear old enemy position
                GLCD_DrawCircle(
                    enemies[i].last_pos.screen_x,
                    enemies[i].last_pos.screen_y,
                    ENEMY_RADIUS,
                    Black);
            }

            // Move towards player
            dx = (float)(player.x - enemies[i].x);
            dy = (float)(player.y - enemies[i].y);
            distance = sqrtf(dx * dx + dy * dy);

            // Check if this is the closest enemy
            if (distance < closest_enemy_distance)
            {
                closest_enemy = &enemies[i];
                closest_enemy_distance = distance;
            }

            if (distance > 0)
            {
                enemy_newX = enemies[i].x + (dx / distance) * enemies[i].speed;
                enemy_newY = enemies[i].y + (dy / distance) * enemies[i].speed;

                // Check for obstacle collision at new position
                if (!CheckObstacleCollision(enemy_newX, enemy_newY, ENEMY_RADIUS))
                {
                    enemies[i].x = enemy_newX;
                    enemies[i].y = enemy_newY;
                }
                else
                {
                    // If collision detected, try moving only horizontally or vertically
                    if (!CheckObstacleCollision(enemy_newX, enemies[i].y, ENEMY_RADIUS))
                    {
                        enemies[i].x = enemy_newX; // Horizontal movement ok
                    }
                    else if (!CheckObstacleCollision(enemies[i].x, enemy_newY, ENEMY_RADIUS))
                    {
                        enemies[i].y = enemy_newY; // Vertical movement ok
                    }
                    // If both blocked, enemy stays in place
                }
            }

            // Convert enemy world position to screen position
            WorldToScreen(enemies[i].x, enemies[i].y, &screen_x, &screen_y);

            // Store current screen position for next frame's clearing
            enemies[i].last_pos.screen_x = screen_x;
            enemies[i].last_pos.screen_y = screen_y;

            // Only draw if enemy would be visible on screen
            if (screen_x >= -ENEMY_RADIUS && screen_x <= SCREEN_WIDTH + ENEMY_RADIUS &&
                screen_y >= -ENEMY_RADIUS && screen_y <= SCREEN_HEIGHT + ENEMY_RADIUS)
            {
                GLCD_DrawCircle(screen_x, screen_y, ENEMY_RADIUS, Red);
            }

            // Check if enemy is touching player and player is not invulnerable
            if (!player.invulnerable &&
                abs(enemies[i].x - player.x) < PLAYER_RADIUS + ENEMY_RADIUS &&
                abs(enemies[i].y - player.y) < PLAYER_RADIUS + ENEMY_RADIUS)
            {
                player.health--;
                player.invulnerable = 1;
                player.last_hit_time = game_time;
            }
        }else{
					      // Clear old enemy position
                GLCD_DrawCircle(
                    enemies[i].last_pos.screen_x,
                    enemies[i].last_pos.screen_y,
                    ENEMY_RADIUS,
                    Black);
				}
    }

    // Clear previous player position if invulnerable (for flashing effect)
    if (player.invulnerable)
    {
        if (player_visible == 0)
        {
            GLCD_DrawCircle(SCREEN_CENTER_X, SCREEN_CENTER_Y, PLAYER_RADIUS, Black);
            player_visible = 1;
        }
        // Draw player (always in center of screen)
        else if (player_visible)
        {
            GLCD_DrawCircle(SCREEN_CENTER_X, SCREEN_CENTER_Y, PLAYER_RADIUS, Yellow);
            player_visible = 0;
        }

        // Update invulnerability
        if (game_time - player.last_hit_time > 5)
        {
            player.invulnerable = 0;
            GLCD_DrawCircle(SCREEN_CENTER_X, SCREEN_CENTER_Y, PLAYER_RADIUS, Blue);
        }
    }

    // Update HUD only when it changes

    if (player.score != last_score)
    {
        // Clear previous score area
        snprintf(score_str, sizeof(score_str), "Score: %d", last_score);
        //GLCD_DisplayStringCutout(0, 0, 1, (unsigned char *)score_str, Black);
			
        // Draw new score
        snprintf(score_str, sizeof(score_str), "Score: %d", last_score);
        //GLCD_DisplayStringCutout(0, 0, 1, (unsigned char *)score_str, White);
				GLCD_DisplayString(0, 0, 1, (unsigned char *)score_str);
        last_score = player.score;
    }

    if (player.health != last_health)
    {
        // Clear previous hearts area
        for (i = 2; i >= player.health; i--)
        {
            GLCD_DrawLine(305 - i * 20, 5, 305 - i * 20, 15, Black);
            GLCD_DrawLine(310 - i * 20, 10, 300 - i * 20, 10, Black);
        }

        // Draw Heart Icons
        for (i = 0; i < player.health; i++)
        {
            GLCD_DrawLine(305 - i * 20, 5, 305 - i * 20, 15, Red);
            GLCD_DrawLine(310 - i * 20, 10, 300 - i * 20, 10, Red);
        }
        last_health = player.health;
    }
		for (i = 0; i < player.health; i++)// Draw Heart Icons````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
		{
				GLCD_DrawLine(305 - i * 20, 5, 305 - i * 20, 15, Red);
				GLCD_DrawLine(310 - i * 20, 10, 300 - i * 20, 10, Red);
		}
}

// Handle Player Input
void Game_Script_Input(uint32_t key)
{
    int new_x = player.x;
    int new_y = player.y;
    float velocityX = player.speed;
    float velocityY = player.speed;

    int dir_x = 0, dir_y = 0;
    if (key & KBD_UP)
    {
        dir_y = -1;
    }
    if (key & KBD_DOWN)
    {
        dir_y = 1;
    }
    if (key & KBD_LEFT)
    {
        dir_x = -1;
    }
    if (key & KBD_RIGHT)
    {
        dir_x = 1;
    }

    if (dir_x != 0 && dir_y != 0)
    {
        // Normalize vector
        float length = sqrtf(dir_x * dir_x + dir_y * dir_y);
        dir_x /= length;
        dir_y /= length;
    }

    velocityX = player.speed * dir_x;
    velocityY = player.speed * dir_y;


    new_y = player.y + velocityY;
    new_x = player.x + velocityX;

    if (velocityX > 0)
    {
        velocityX *= 0.9f;
    }
    if (velocityY > 0)
    {
        velocityY *= 0.9f;
    }

    // Only update position if it's within bounds and not colliding with obstacles
    if (new_x >= 0 && new_x < MAP_WIDTH &&
        new_y >= 0 && new_y < MAP_HEIGHT &&
        !CheckObstacleCollision(new_x, new_y, PLAYER_RADIUS))
    {
        player.x = new_x;
        player.y = new_y;
    }

    if (player.health <= 0) {
        curr_state = STATE_MAIN_MENU;
    }
}



// Timer Tick Function (Called Every X Seconds by timer)
void Game_Script_TimerTick(void)
{
    if (timerCounter++ >= 250)
    {	
        if (difficulty_multiplier < MAX_DIFFICULTY)
            difficulty_multiplier++; // Increase difficulty

        if (enemy_spawn_rate > 10)
        {
            enemy_spawn_rate -= 1; // Spawn enemies faster
        }
        if (ENEMY_RADIUS < MAX_ENEMY_RADIUS)
        {
            ENEMY_RADIUS++; // Increase enemy size
        }
        timerCounter = 0;
    }
    player.score++;
}
