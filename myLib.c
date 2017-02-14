#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

// sets pixel a certain color
void setPixel(int row, int col, unsigned short color)
{
	videoBuffer[OFFSET(row, col, 240)] = color;
}
//DMANow sets a dma channels source, destination and control.
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control)
{
    DMA[channel].src = source;
    DMA[channel].dst = destination;
    DMA[channel].cnt = control;

}

// draw rect on part of screen using offset in DMANow
void drawRect(int row, int col, int height, int width, volatile unsigned short color)
{
	for (int r = 0; r < height; r++)
	{
		DMANow(3, &color, &videoBuffer[OFFSET(row+r, col, 240)], width | DMA_DESTINATION_INCREMENT | DMA_SOURCE_FIXED | DMA_ON);
	}
}
/*
// A less efficient draw rect function that takes the bounds of the screen into consideration
void drawRectInBounds(int row, int col, int height, int width, unsigned short color)
{
	for(int r = 0; r < height; r++)
	{
		if(col + c > 0 && col + c < 240 && row + r > 0 && row + r < 160) // If the pixel is on the screen
		{
			DMA[3].src = &color;
			DMA[3].dst = &VIDEO_BUFFER[OFFSET(row+r, col, 240)];
			DMA[3].cnt = width | DMA_DESTINATION_INCREMENT | DMA_SOURCE_FIXED | DMA_ON;
		}
	}
}
*/
// waits for end of row
void waitForVBlank()
{
	while(SCANLINECOUNTER>160);
	while(SCANLINECOUNTER<160);
}

// fills screen with a color
void fillScreen(volatile unsigned short color)
{
	DMANow(3, &color, videoBuffer, 38400|DMA_ON | DMA_DESTINATION_INCREMENT | DMA_SOURCE_FIXED);
}

// delays
void delay() {
    int i;
    volatile int b;
    for(i=0;i<30000;i++) {
        b++;
    }
}