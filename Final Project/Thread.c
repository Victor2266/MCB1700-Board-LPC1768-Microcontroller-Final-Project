#include <stdio.h>
#include "cmsis_os.h" // CMSIS RTOS header file
#include "LPC17xx.h"
#include "GLCD.h"
#include "LED.h"

// #define DEMO_MODE

#define ITM_Port8(n) (*((volatile unsigned char *)(0xE0000000 + 4 * n)))
#define ITM_Port16(n) (*((volatile unsigned short *)(0xE0000000 + 4 * n)))
#define ITM_Port32(n) (*((volatile unsigned long *)(0xE0000000 + 4 * n)))

#define DEMCR (*((volatile unsigned long *)(0xE000EDFC)))
#define TRCENA 0x01000000

struct __FILE
{
  int handle;
};
FILE __stdout;
FILE __stdin;

int fputc(int ch, FILE *f)
{
  if (DEMCR & TRCENA)
  {
    while (ITM_Port32(0) == 0)
      ;                // Wait until the ITM port is ready
    ITM_Port8(0) = ch; // Send character to ITM
  }
  return ch;
}

/*----------------------------------------------------------------------------
 *      Sample threads
 *---------------------------------------------------------------------------*/
unsigned int counta = 0;
unsigned int countb = 0;
unsigned int countc = 0;

void Thread1(void const *argument); // Task 1: LED Blink
void Thread2(void const *argument); // Task 2: LCD Display
void Thread3(void const *argument); // Task 3: Counter

osThreadId tid_Thread1, tid_Thread2, tid_Thread3;

// osThreadDef() is a macro that declares a thread object. It is not a function.
// The parameters are:
//   1. The name of the thread function (Thread1)
//   2. The priority of the thread (osPriorityNormal)
//   3. The size of the stack required by the thread (1)
//   4. The number of bytes of extra memory required by the thread (0)
//
// This declaration is used by the RTOS to create a thread when osThreadCreate() is called.
osThreadDef(Thread1, osPriorityNormal, 1, 0);
osThreadDef(Thread2, osPriorityNormal, 1, 0);
osThreadDef(Thread3, osPriorityNormal, 200, 0);

int Init_Threads(void)
{
  tid_Thread1 = osThreadCreate(osThread(Thread1), NULL);
  tid_Thread2 = osThreadCreate(osThread(Thread2), NULL);
  tid_Thread3 = osThreadCreate(osThread(Thread3), NULL);

  if (!(tid_Thread1 && tid_Thread2 && tid_Thread3))
  {
    return -1; // Error if any thread couldn't be created
  }

  return 0;
}

void Terminate_Threads(void)
{
  osThreadTerminate(tid_Thread1);
  osThreadTerminate(tid_Thread2);
  osThreadTerminate(tid_Thread3);
}

// Task 1: 
void Thread1(void const *argument)
{
  LED_On(0); // Turn on LED
  for (counta = 0; counta < 10000; counta++)
  {
    char count_str[20];
    sprintf(count_str, "T1 Counter: %d", counta);
#ifdef DEMO_MODE
    GLCD_DisplayString(5, 0, 1, (unsigned char *)count_str);
#endif
  }
  LED_Off(0); // Turn off LED
}

// Task 2: 
void Thread2(void const *argument)
{
  LED_On(1); // Turn on LED
  for (countb = 0; countb < 7000; countb++)
  {
    char count_str[20];
    sprintf(count_str, "T2 Counter: %d", countb);
#ifdef DEMO_MODE
    GLCD_DisplayString(6, 0, 1, (unsigned char *)count_str);
#endif
  }
  LED_Off(1); // Turn off LED
}

// Task 3: 
void Thread3(void const *argument)
{
  LED_On(2); // Turn on LED
  for (countc = 0; countc < 5000; countc++)
  { // Count up to 20
    char count_str[20];
    sprintf(count_str, "T3 Counter: %d", countc);
#ifdef DEMO_MODE
    GLCD_DisplayString(7, 0, 1, (unsigned char *)count_str);
#endif
  }
  LED_Off(2); // Turn on LED
}
