# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 74 "myLib.h"
typedef struct
{
 const volatile void *src;
 const volatile void *dst;
 unsigned int cnt;
} DMA_CONTROLLER;
# 112 "myLib.h"
void setPixel(int, int, unsigned short);
void drawRect(int row, int col, int height, int width, volatile unsigned short color);
void drawRectInBounds(int row, int col, int height, int width, volatile unsigned short color);
void waitForVBlank();
void fillScreen(unsigned short);
void delay();
# 2 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;


void setPixel(int row, int col, unsigned short color)
{
 videoBuffer[((row)*(240)+(col))] = color;
}

void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control)
{
    ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].src = source;
    ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].dst = destination;
    ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].cnt = control;

}


void drawRect(int row, int col, int height, int width, volatile unsigned short color)
{
 for (int r = 0; r < height; r++)
 {
  DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col))], width | (0 << 21) | (2 << 23) | (1 << 31));
 }
}
# 43 "myLib.c"
void waitForVBlank()
{
 while((*(volatile unsigned short *)0x4000006)>160);
 while((*(volatile unsigned short *)0x4000006)<160);
}


void fillScreen(volatile unsigned short color)
{
 DMANow(3, &color, videoBuffer, 38400|(1 << 31) | (0 << 21) | (2 << 23));
}


void delay() {
    int i;
    volatile int b;
    for(i=0;i<30000;i++) {
        b++;
    }
}
