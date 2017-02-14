//structures

typedef struct
{
	int row;
	int col;
	int oldRow;
	int oldCol;
	int height;
	int width;
	int rd;
	int cd;
	char dead;
} FROGGER;

typedef struct
{
	int row;
	int col;
	int oldRow;
	int oldCol;
	int height;
	int width;
	int cd;
	unsigned short color;
} LEFTCAR;

typedef struct
{
	int row;
	int col;
	int oldRow;
	int oldCol;
	int height;
	int width;
	int cd;
	unsigned short color;
} RIGHTCAR;

// Prototypes
void initialize();
void update();
void draw();
void drawLives();
void goToStart();
void updateStart();
void goToInstructions();
void updateInstructions();
void goToGame();
void initializeGame();
void updateGame();
void goToPause();
void updatePause();
void goToWin();
void updateWin();
void goToLose();
void updateLose();

// Num Cars
#define NUMLEFTCARS 3
#define NUMRIGHTCARS 4