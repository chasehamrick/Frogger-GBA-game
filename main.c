#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "main.h"
#include "game.h"
#include "font.h"

//car object holders
LEFTCAR leftCars[NUMLEFTCARS];
RIGHTCAR rightCars[NUMRIGHTCARS];
//player object
FROGGER player;
//game states
enum {START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
//life variables
int life, oldLife;
//buffer to hold the text to show lives left
char lifeBuffer[41];
//current state
int state;
//button variables
unsigned int buttons;
unsigned int oldButtons;
//main game loop
int main() {
	//initialize game and go go start screen
	initialize();
	goToStart();
	//main while loop
	while(1)
	{
		//setting buttons
		oldButtons = buttons;
		buttons = BUTTONS;
		//switch statement to determine game state
		switch(state)
		{
			case START:
				updateStart();
				break;
			case INSTRUCTIONS:
				updateInstructions();
				break;
			case GAME:
				updateGame();
				break;
			case PAUSE:
				updatePause();
				break;
			case WIN:
				updateWin();
				break;
			case LOSE:
				updateLose();
				break;
		}
	}

	return 0;
}

//initialize GBA
void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    waitForVBlank();
}
//fills screen blue and shows text and frogger
void goToStart()
{
	fillScreen(BLUE);
	drawString(20, 10, "To Play, Press START", GREEN);
	drawString(30, 10, "For Instructions, Press SELECT", GREEN);
	drawRect(80, 100, 8, 6, GREEN);
	drawRect((80 + 1), (100 - 3), 2, 3, GREEN);
	drawRect(((80+1)-2),(100-3), 2, 2, GREEN);
	drawRect((80 + 1), (100 + 6), 2, 3, GREEN);
	drawRect(((80 + 1) - 2), ((100 + 6) + 1), 2, 2, GREEN);
	drawRect((80 + 5), (100 - 3), 3, 3, GREEN);
	drawRect(((80 + 5) - 1), (100 - 3), 1, 2, GREEN);
	drawRect((80 + 5), (100 + 6), 3, 3, GREEN);
	drawRect(((80 + 5) - 1), ((100 + 6) + 1), 1, 2, GREEN);
	//sets current state to start
	state = START;
}
//checks for button presses at start screen (start to begin select for instructions)
void updateStart()
{
	if (BUTTON_PRESSED(BUTTON_START))
	{
		//calls goToGame
		goToGame();
	}
	if (BUTTON_PRESSED(BUTTON_SELECT))
	{
		//calls goToInstructions
		goToInstructions();
	}
}
//sets up instruction screen black with instructions written in green as well as a frogger,  and sets state to instructions
void goToInstructions()
{
	//Instructions
	fillScreen(BLACK);
	drawString(10, 2, "To play: Use arrow keys to move frogger.", GREEN);
	drawString(25, 8, "Cross the street without getting hit.", GREEN);
	drawString(40, 16, "If you're hit 3 times, GAME OVER!", GREEN);
	drawString(55, 10, "Must look both ways before crossing!", GREEN);
	drawString(70, 16, "Therefore, cannot move sideways on", GREEN);
	drawString(85, 50, "yellow lines in middle.", GREEN);
	drawString(100, 25, "To Pause the game, press START!", GREEN);
	//Frogger and STart to Begin line
	drawRect(120, 120, 8, 6, GREEN);
	drawRect((120 + 1), (120 - 3), 2, 3, GREEN);
	drawRect(((120+1)-2),(120-3), 2, 2, GREEN);
	drawRect((120 + 1), (120 + 6), 2, 3, GREEN);
	drawRect(((120 + 1) - 2), ((120 + 6) + 1), 2, 2, GREEN);
	drawRect((120 + 5), (120 - 3), 3, 3, GREEN);
	drawRect(((120 + 5) - 1), (120 - 3), 1, 2, GREEN);
	drawRect((120 + 5), (120 + 6), 3, 3, GREEN);
	drawRect(((120 + 5) - 1), ((120 + 6) + 1), 1, 2, GREEN);
	drawString(150, 40, "Press START to Begin now.", GREEN);
	//setting state to instructions
	state = INSTRUCTIONS;
}
//checks for start button to start game
void updateInstructions()
{
	if (BUTTON_PRESSED(BUTTON_START))
	{
		//goes to game
		goToGame();
	}
}
//calls initialize game which sets up the game and sets the state to game
void goToGame()
{
	initializeGame();
	state = GAME;

}
//initializes game play
void initializeGame()
{
	//sets up the background (grass, river and road)
	fillScreen(BLACK);
	drawRect(20, 0, 5, 240, WHITE);
	drawRect(130, 0, 6, 240, WHITE);
	drawRect(73, 0, 4, 240, YELLOW);
	drawRect(79, 0, 4, 240, YELLOW);
	drawRect(136, 0, 23, 240, DARKGREEN);
	drawRect(0, 0, 20, 240, BLUE);
	//two for loops to set height, width, and column delta of right and left moving cars
	for (int i = 0; i < NUMLEFTCARS; i++)
	{
		leftCars[i].height = 6;
		leftCars[i].width = 9;
		leftCars[i].cd = 2;
	}

	for (int i = 0; i < NUMRIGHTCARS; i++)
	{
		rightCars[i].height = 6;
		rightCars[i].width = 9;
		rightCars[i].cd = 2;
	}
	//sets position and color of each of the left/right moving cars
	leftCars[0].row = 30;
	leftCars[0].col = 220;
	leftCars[0].color = BLUE;

	leftCars[1].row = 50;
	leftCars[1].col = 100;
	leftCars[1].color = RED;

	leftCars[2].row = 60;
	leftCars[2].col = 200;
	leftCars[2].color = PURPLE;

	rightCars[0].row = 85;
	rightCars[0].col = 5;
	rightCars[0].color = ORANGE;

	rightCars[1].row = 90;
	rightCars[1].col = 140;
	rightCars[1].color = LIGHTYELLOW;

	rightCars[2].row = 115;
	rightCars[2].col = 185;
	rightCars[2].color = CYAN;

	rightCars[3].row = 125;
	rightCars[3].col = 65;
	rightCars[3].color = MAGENTA;
	//sets up frogger/ the player characters position, size, move speed, and lives
	player.height = 7;
	player.width = 12;
	player.row = 140;
	player.col = 120;
	player.rd = 1;
	player.cd = 1;
	life = 3;
	oldLife = 0;
}
//update function for game state
void updateGame()
{
	//checks for start button to pause
	if (BUTTON_PRESSED(BUTTON_START))
	{
		//goes to Pause
		goToPause();
	}
	//calls update function to update cars/frogger, waits for VBlank, and then draws frogger/cars/text
	update();
	waitForVBlank();
	draw();
	//checks if player has made it to the goal with lives left, if so goes to win state
	if ((player.row + player.height < 20) && (life > 0))
	{
		//goes to Win
		goToWin();
	}
	//steps through all the left moving cars
	for (int i = 0; i < NUMLEFTCARS; i++)
	{
		//checks all left cars if they collide with player- (player.row+1)-2),(player.col-3) is top left furthest point on frogger
		// and froggers width / height is the length from top of hand to bottom of body and left most point of hand/arm to right most
		//point of hand/arm
		if (((((player.row + 1) - 2) <= (leftCars[i].row + leftCars[i].height)) && ((player.col - 3) <= (leftCars[i].col + leftCars[i].width))) &&
			((((player.row + 1) - 2) + player.height) > leftCars[i].row) && (((player.col - 3) + player.width) >= leftCars[i].col))
		{
			//take a life away if hit
			life--;
			//redraw background
			drawRect(136, 0, 23, 240, DARKGREEN);
			drawRect(0, 0, 20, 240, BLUE);
			drawRect(20, 0, 5, 240, WHITE);
			drawRect(130, 0, 6, 240, WHITE);
			drawRect(73, 0, 4, 240, YELLOW);
			drawRect(79, 0, 4, 240, YELLOW);
			drawRect(83, 0, (130 - 83), 240, BLACK);
			drawRect(25, 0, (73 - 25), 240, BLACK);
			//draw lives after hit
			drawLives();
			//if lives make it to zero, go to lose state, if still have lives left set frogger to starting position
			if (life == 0)
			{
				//goes to lose
				goToLose();
			} else
			{
				//resets position
				player.row = 140;
				player.col = 120;
			}
		}
	}
	//steps through all the right moving cars
	for (int i = 0; i < NUMRIGHTCARS; i++)
	{
		//checks all left cars if they collide with player- (player.row+1)-2),(player.col-3) is top left furthest point on frogger
		// and froggers width / height is the length from top of hand to bottom of body and left most point of hand/arm to right most
		//point of hand/arm
		if (((((player.row + 1) - 2) <= (rightCars[i].row + rightCars[i].height)) && ((player.col - 3) <= (rightCars[i].col + rightCars[i].width))) &&
			((((player.row + 1) - 2) + player.height) > rightCars[i].row) && (((player.col - 3) + player.width) >= rightCars[i].col))
		{
			//take a life away if hit
			life--;
			//redraw background
			drawRect(136, 0, 23, 240, DARKGREEN);
			drawRect(0, 0, 20, 240, BLUE);
			drawRect(20, 0, 5, 240, WHITE);
			drawRect(130, 0, 6, 240, WHITE);
			drawRect(73, 0, 4, 240, YELLOW);
			drawRect(79, 0, 4, 240, YELLOW);
			drawRect(83, 0, (130 - 83), 240, BLACK);
			drawRect(25, 0, (73 - 25), 240, BLACK);
			//draw lives text since life lost
			drawLives();
			//if lives make it to zero, go to lose state, if still have lives left set frogger to starting position
			if (life == 0)
			{
				//go to lose
				goToLose();
			} else
			{
				//reset frogger position
				player.row = 140;
				player.col = 120;
			}
		}
	}
}
//update position calls the update functions for all left cars, right cars, and the player frogger
void update()
{
	for (int i = 0; i < NUMLEFTCARS; i++)
	{
		updateLeftCar(&leftCars[i]);
	}
	for (int i = 0; i < NUMRIGHTCARS; i++)
	{
		updateRightCar(&rightCars[i]);
	}

	updateFrogger(&player);
}
//draw function calls the draw functions for all left cars, right cars, frogger, as well as drawLives function.
void draw()
{
	for (int i = 0; i<NUMLEFTCARS; i++)
	{
		drawLeftCar(&leftCars[i]);
	}

	for (int i = 0; i < NUMRIGHTCARS; i++)
	{
		drawRightCar(&rightCars[i]);
	}
	drawFrogger(&player);
	drawLives();
}
//if the number of lives change, change text of lives left
void drawLives()
{
	if (oldLife == life) return;
	sprintf(lifeBuffer, "Lives: %d", life);
	drawString(10, 12, lifeBuffer, WHITE);
	oldLife = life;

}
//writes pause text and sets state to pause
void goToPause()
{
	drawString(148, 10, "Your Paused! Press START to continue", ORANGE);
	state = PAUSE;
}
//during pause state, if start button pressed, redraw green grass and lives left text to erase pause text and set state to game
void updatePause()
{
	if (BUTTON_PRESSED(BUTTON_START))
	{
		//sets oldLife to zero to redraw lives text after unpause
		oldLife = 0;
		//redraw grass/water
		drawRect(136, 0, 23, 240, DARKGREEN);
		drawRect(0, 0, 20, 240, BLUE);
		//draw lives left
		drawLives();
		//set state to game
		state = GAME;
	}
}
//sets up green win screen and orange win text, changes state to win
void goToWin()
{
	fillScreen(GREEN);
	drawString(55, 40, "YOU WIN! CONGRATS!!", ORANGE);
	drawString(65, 40, "PRESS START TO PLAY AGAIN!", ORANGE);
	state = WIN;
}
//checks for start button press, and if so goes from win screen to start screen
void updateWin()
{
	if (BUTTON_PRESSED(BUTTON_START))
	{
		goToStart();
	}
}
//sets up red lose screen and orange lose text, changes state to lose
void goToLose()
{
	fillScreen(RED);
	drawString(55, 40, "YOU LOSE! TRY AGAIN!!", ORANGE);
	drawString(65, 40, "PRESS START TO PLAY AGAIN!", ORANGE);
	state = LOSE;
}
//checks for start button press, and if so goes from lose screen to start screen
void updateLose()
{
	if (BUTTON_PRESSED(BUTTON_START))
	{
		goToStart();
	}
}