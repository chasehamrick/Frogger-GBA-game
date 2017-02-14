#include <stdlib.h>
#include "main.h"
#include "myLib.h"
#include "game.h"

//updates froggers
void updateFrogger(FROGGER* frogger)
{
	//sets froggers old rows and column to the current ones
	frogger->oldRow = frogger->row;
	frogger->oldCol = frogger->col;

	//either button right or button left or button up can be used at one time, not same time (no diagonal movement)
	if (BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_LEFT))
	{
		//if frogger isnt in the grass or the middle of the road, and right button pressed, and he isnt off the screen, add column delta to col
		if (frogger->row < 124 && (frogger->row > 79 || frogger->row < 64))
		{
			if (BUTTON_HELD(BUTTON_RIGHT))
			{
				if (frogger->col < (240 - frogger->width))
				{
					frogger->col = (frogger->col + frogger->cd);
				}
			}
		}
		//if frogger isnt in the grass or middle of the right, and left button pressed, and he isnt off the screen, subtract column delta from col
		if (frogger->row < 124 && (frogger->row > 79 || frogger->row < 64))
		{
			if (BUTTON_HELD(BUTTON_LEFT))
			{
				if (frogger->col > 0)
				{
					frogger->col = (frogger->col - frogger->cd);
				}
			}
		}
	//if button up held, move frogger up by row delta
	} else if (BUTTON_HELD(BUTTON_UP))
	{
		if (frogger->row > 0)
		{
			frogger->row -= frogger->rd;
		}
	}
}

void updateLeftCar(LEFTCAR* car)
{
	//set left cars old row and column to current ones.
	car->oldRow = car->row;
	car->oldCol = car->col;
	//subtract column delta from col to move left
	car->col -= car->cd;
	//if car reaches end of screen, reset it to other side and change to random color
	if (car->col < 0)
	{
		car->col = (239 - car->width);
		car->color = COLOR(rand()%31, rand()%31, rand()%31);
	}
}

void updateRightCar(RIGHTCAR* car)
{
	//set right cars old row and column to current ones
	car->oldRow = car->row;
	car->oldCol = car->col;
	//add column delta to col to move right
	car->col += car-> cd;
	//if car reaches end of screen, reset it to other side and change to random color
	if ((car->col + car->width) > 239)
	{
		car->col = 0;
		car->color = COLOR(rand()%31, rand()%31, rand()%31);
	}
}
//draw frogger
void drawFrogger(FROGGER* frogger)
{
	//if frogger is on the grass, set old position to dark green and new to green
	//if frogger is on one of the white lines, set old position to white and new to green
	//if frogger is on one of the yellow lines, set old position to yellow and new to white
	//anywhere else in the road sets old position to black and new to white
	if (frogger->oldRow > 128)
	{
		drawRect(frogger->oldRow, frogger->oldCol, 8, 6, DARKGREEN);
		drawRect((frogger->oldRow + 1), (frogger->oldCol - 3), 2, 3, DARKGREEN);
		drawRect(((frogger->oldRow+1)-2),(frogger->oldCol-3), 2, 2, DARKGREEN);
		drawRect((frogger->oldRow + 1), (frogger->oldCol + 6), 2, 3, DARKGREEN);
		drawRect(((frogger->oldRow + 1) - 2), ((frogger->oldCol + 6) + 1), 2, 2, DARKGREEN);
		drawRect((frogger->oldRow + 5), (frogger->oldCol - 3), 3, 3, DARKGREEN);
		drawRect(((frogger->oldRow + 5) - 1), (frogger->oldCol - 3), 1, 2, DARKGREEN);
		drawRect((frogger->oldRow + 5), (frogger->oldCol + 6), 3, 3, DARKGREEN);
		drawRect(((frogger->oldRow + 5) - 1), ((frogger->oldCol + 6) + 1), 1, 2, DARKGREEN);

		drawRect(frogger->row, frogger->col, 8, 6, GREEN);
		drawRect((frogger->row + 1), (frogger->col - 3), 2, 3, GREEN);
		drawRect(((frogger->row+1)-2),(frogger->col-3), 2, 2, GREEN);
		drawRect((frogger->row + 1), (frogger->col + 6), 2, 3, GREEN);
		drawRect(((frogger->row + 1) - 2), ((frogger->col + 6) + 1), 2, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col - 3), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), (frogger->col - 3), 1, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col + 6), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), ((frogger->col + 6) + 1), 1, 2, GREEN);

		/*
		drawRect(frogger->oldRow, frogger->oldCol, frogger->height, frogger->width, DARKGREEN);
		drawRect(frogger->row, frogger->col, frogger->height, frogger->width, GREEN);
		*/
	} else if (frogger->oldRow > 123)
	{
		drawRect(frogger->oldRow, frogger->oldCol, 8, 6, WHITE);
		drawRect((frogger->oldRow + 1), (frogger->oldCol - 3), 2, 3, WHITE);
		drawRect(((frogger->oldRow+1)-2),(frogger->oldCol-3), 2, 2, WHITE);
		drawRect((frogger->oldRow + 1), (frogger->oldCol + 6), 2, 3, WHITE);
		drawRect(((frogger->oldRow + 1) - 2), ((frogger->oldCol + 6) + 1), 2, 2, WHITE);
		drawRect((frogger->oldRow + 5), (frogger->oldCol - 3), 3, 3, WHITE);
		drawRect(((frogger->oldRow + 5) - 1), (frogger->oldCol - 3), 1, 2, WHITE);
		drawRect((frogger->oldRow + 5), (frogger->oldCol + 6), 3, 3, WHITE);
		drawRect(((frogger->oldRow + 5) - 1), ((frogger->oldCol + 6) + 1), 1, 2, WHITE);

		drawRect(frogger->row, frogger->col, 8, 6, GREEN);
		drawRect((frogger->row + 1), (frogger->col - 3), 2, 3, GREEN);
		drawRect(((frogger->row+1)-2),(frogger->col-3), 2, 2, GREEN);
		drawRect((frogger->row + 1), (frogger->col + 6), 2, 3, GREEN);
		drawRect(((frogger->row + 1) - 2), ((frogger->col + 6) + 1), 2, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col - 3), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), (frogger->col - 3), 1, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col + 6), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), ((frogger->col + 6) + 1), 1, 2, GREEN);

		/*
		drawRect(frogger->oldRow, frogger->oldCol, frogger->height, frogger->width, WHITE);
		drawRect(frogger->row, frogger->col, frogger->height, frogger->width, GREEN);
		*/
	} else if (frogger->oldRow < 76 && frogger->oldRow > 71)
	{
		drawRect(frogger->oldRow, frogger->oldCol, 8, 6, YELLOW);
		drawRect((frogger->oldRow + 1), (frogger->oldCol - 3), 2, 3, YELLOW);
		drawRect(((frogger->oldRow+1)-2),(frogger->oldCol-3), 2, 2, YELLOW);
		drawRect((frogger->oldRow + 1), (frogger->oldCol + 6), 2, 3, YELLOW);
		drawRect(((frogger->oldRow + 1) - 2), ((frogger->oldCol + 6) + 1), 2, 2, YELLOW);
		drawRect((frogger->oldRow + 5), (frogger->oldCol - 3), 3, 3, YELLOW);
		drawRect(((frogger->oldRow + 5) - 1), (frogger->oldCol - 3), 1, 2, YELLOW);
		drawRect((frogger->oldRow + 5), (frogger->oldCol + 6), 3, 3, YELLOW);
		drawRect(((frogger->oldRow + 5) - 1), ((frogger->oldCol + 6) + 1), 1, 2, YELLOW);

		drawRect(frogger->row, frogger->col, 8, 6, GREEN);
		drawRect((frogger->row + 1), (frogger->col - 3), 2, 3, GREEN);
		drawRect(((frogger->row+1)-2),(frogger->col-3), 2, 2, GREEN);
		drawRect((frogger->row + 1), (frogger->col + 6), 2, 3, GREEN);
		drawRect(((frogger->row + 1) - 2), ((frogger->col + 6) + 1), 2, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col - 3), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), (frogger->col - 3), 1, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col + 6), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), ((frogger->col + 6) + 1), 1, 2, GREEN);

		/*
		drawRect(frogger->oldRow, frogger->oldCol, frogger->height, frogger->width, YELLOW);
		drawRect(frogger->row, frogger->col, frogger->height, frogger->width, GREEN);
		*/
	} else if (frogger->oldRow < 70 && frogger->oldRow > 65)
	{
		drawRect(frogger->oldRow, frogger->oldCol, 8, 6, YELLOW);
		drawRect((frogger->oldRow + 1), (frogger->oldCol - 3), 2, 3, YELLOW);
		drawRect(((frogger->oldRow+1)-2),(frogger->oldCol-3), 2, 2, YELLOW);
		drawRect((frogger->oldRow + 1), (frogger->oldCol + 6), 2, 3, YELLOW);
		drawRect(((frogger->oldRow + 1) - 2), ((frogger->oldCol + 6) + 1), 2, 2, YELLOW);
		drawRect((frogger->oldRow + 5), (frogger->oldCol - 3), 3, 3, YELLOW);
		drawRect(((frogger->oldRow + 5) - 1), (frogger->oldCol - 3), 1, 2, YELLOW);
		drawRect((frogger->oldRow + 5), (frogger->oldCol + 6), 3, 3, YELLOW);
		drawRect(((frogger->oldRow + 5) - 1), ((frogger->oldCol + 6) + 1), 1, 2, YELLOW);

		drawRect(frogger->row, frogger->col, 8, 6, GREEN);
		drawRect((frogger->row + 1), (frogger->col - 3), 2, 3, GREEN);
		drawRect(((frogger->row+1)-2),(frogger->col-3), 2, 2, GREEN);
		drawRect((frogger->row + 1), (frogger->col + 6), 2, 3, GREEN);
		drawRect(((frogger->row + 1) - 2), ((frogger->col + 6) + 1), 2, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col - 3), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), (frogger->col - 3), 1, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col + 6), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), ((frogger->col + 6) + 1), 1, 2, GREEN);

		/*
		drawRect(frogger->oldRow, frogger->oldCol, frogger->height, frogger->width, YELLOW);
		drawRect(frogger->row, frogger->col, frogger->height, frogger->width, GREEN);
		*/
	} else if (frogger->oldRow < 18 && frogger->oldRow > 15)
	{
		drawRect(frogger->oldRow, frogger->oldCol, 8, 6, WHITE);
		drawRect((frogger->oldRow + 1), (frogger->oldCol - 3), 2, 3, WHITE);
		drawRect(((frogger->oldRow+1)-2),(frogger->oldCol-3), 2, 2, WHITE);
		drawRect((frogger->oldRow + 1), (frogger->oldCol + 6), 2, 3, WHITE);
		drawRect(((frogger->oldRow + 1) - 2), ((frogger->oldCol + 6) + 1), 2, 2, WHITE);
		drawRect((frogger->oldRow + 5), (frogger->oldCol - 3), 3, 3, WHITE);
		drawRect(((frogger->oldRow + 5) - 1), (frogger->oldCol - 3), 1, 2, WHITE);
		drawRect((frogger->oldRow + 5), (frogger->oldCol + 6), 3, 3, WHITE);
		drawRect(((frogger->oldRow + 5) - 1), ((frogger->oldCol + 6) + 1), 1, 2, WHITE);

		drawRect(frogger->row, frogger->col, 8, 6, GREEN);
		drawRect((frogger->row + 1), (frogger->col - 3), 2, 3, GREEN);
		drawRect(((frogger->row+1)-2),(frogger->col-3), 2, 2, GREEN);
		drawRect((frogger->row + 1), (frogger->col + 6), 2, 3, GREEN);
		drawRect(((frogger->row + 1) - 2), ((frogger->col + 6) + 1), 2, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col - 3), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), (frogger->col - 3), 1, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col + 6), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), ((frogger->col + 6) + 1), 1, 2, GREEN);

		/*
		drawRect(frogger->oldRow, frogger->oldCol, frogger->height, frogger->width, WHITE);
		drawRect(frogger->row, frogger->col, frogger->height, frogger->width, GREEN);
		*/
	} else if (frogger->oldRow < 15)
	{
		drawRect(frogger->oldRow, frogger->oldCol, 8, 6, BLUE);
		drawRect((frogger->oldRow + 1), (frogger->oldCol - 3), 2, 3, BLUE);
		drawRect(((frogger->oldRow+1)-2),(frogger->oldCol-3), 2, 2, BLUE);
		drawRect((frogger->oldRow + 1), (frogger->oldCol + 6), 2, 3, BLUE);
		drawRect(((frogger->oldRow + 1) - 2), ((frogger->oldCol + 6) + 1), 2, 2, BLUE);
		drawRect((frogger->oldRow + 5), (frogger->oldCol - 3), 3, 3, BLUE);
		drawRect(((frogger->oldRow + 5) - 1), (frogger->oldCol - 3), 1, 2, BLUE);
		drawRect((frogger->oldRow + 5), (frogger->oldCol + 6), 3, 3, BLUE);
		drawRect(((frogger->oldRow + 5) - 1), ((frogger->oldCol + 6) + 1), 1, 2, BLUE);

		drawRect(frogger->row, frogger->col, 8, 6, GREEN);
		drawRect((frogger->row + 1), (frogger->col - 3), 2, 3, GREEN);
		drawRect(((frogger->row+1)-2),(frogger->col-3), 2, 2, GREEN);
		drawRect((frogger->row + 1), (frogger->col + 6), 2, 3, GREEN);
		drawRect(((frogger->row + 1) - 2), ((frogger->col + 6) + 1), 2, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col - 3), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), (frogger->col - 3), 1, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col + 6), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), ((frogger->col + 6) + 1), 1, 2, GREEN);
	} else
	{
		drawRect(frogger->oldRow, frogger->oldCol, 8, 6, BLACK);
		drawRect((frogger->oldRow + 1), (frogger->oldCol - 3), 2, 3, BLACK);
		drawRect(((frogger->oldRow+1)-2),(frogger->oldCol-3), 2, 2, BLACK);
		drawRect((frogger->oldRow + 1), (frogger->oldCol + 6), 2, 3, BLACK);
		drawRect(((frogger->oldRow + 1) - 2), ((frogger->oldCol + 6) + 1), 2, 2, BLACK);
		drawRect((frogger->oldRow + 5), (frogger->oldCol - 3), 3, 3, BLACK);
		drawRect(((frogger->oldRow + 5) - 1), (frogger->oldCol - 3), 1, 2, BLACK);
		drawRect((frogger->oldRow + 5), (frogger->oldCol + 6), 3, 3, BLACK);
		drawRect(((frogger->oldRow + 5) - 1), ((frogger->oldCol + 6) + 1), 1, 2, BLACK);

		drawRect(frogger->row, frogger->col, 8, 6, GREEN);
		drawRect((frogger->row + 1), (frogger->col - 3), 2, 3, GREEN);
		drawRect(((frogger->row+1)-2),(frogger->col-3), 2, 2, GREEN);
		drawRect((frogger->row + 1), (frogger->col + 6), 2, 3, GREEN);
		drawRect(((frogger->row + 1) - 2), ((frogger->col + 6) + 1), 2, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col - 3), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), (frogger->col - 3), 1, 2, GREEN);
		drawRect((frogger->row + 5), (frogger->col + 6), 3, 3, GREEN);
		drawRect(((frogger->row + 5) - 1), ((frogger->col + 6) + 1), 1, 2, GREEN);

		/*
		drawRect(frogger->oldRow, frogger->oldCol, frogger->height, frogger->width, BLACK);
		drawRect(frogger->row, frogger->col, frogger->height, frogger->width, GREEN);
		*/
	}
	
}
//draws left car, old position turns black and new the current color of the car
void drawLeftCar(LEFTCAR* car)
{
	drawRect(car->oldRow, car->oldCol, car->height, car->width, BLACK);
	drawRect(car->row, car->col, car->height, car->width, car->color);	
}
//draws right car, old position turns black and new the current color of the car
void drawRightCar(RIGHTCAR* car)
{
	drawRect(car->oldRow, car->oldCol, car->height, car->width, BLACK);
	drawRect(car->row, car->col, car->height, car->width, car->color);
}