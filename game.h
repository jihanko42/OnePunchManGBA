// PLayer Struct
typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int height;
    int width;
    int jumping;
    int falling;

    int aniState;
    int prevAniState;
    int aniCounter;
    int curFrame;
    int leftFaced;
} PLAYER;

// Enemy Struct
typedef struct {
    int worldRow;
    int worldCol;
    int height;
    int width;
    int rightFaced;
    int dead;
    int jumping;
    int falling;
    int erased;
    int id;
} ENEMY;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void initEnemy();
void updateEnemy();
void drawEnemy(ENEMY *);
int fallable();
int fallPartially(int);
int leftMoveable();
int rightMoveable();
void initTime();
void updateTime();
void drawTime();


// Game Variables
extern PLAYER player;
extern int vOff;
extern int hOff;
extern int enemiesRemaining;
extern ENEMY enemies[];
extern int timeRemaining;
extern int frameCounter;
extern int currentLevel;
extern int enemyCount;
extern int cheat;


// Game Macros
#define MAPHEIGHT 512
#define MAPWIDTH 512
#define ABSOLUTEGROUND (MAPHEIGHT - 16)
#define DEFAULTTIME 60

#define PLAYERSPRITE 0
#define ONEENEMYCOUNT 1
#define TWOENEMYCOUNT 3
#define THREEENEMYCOUNT 1
#define ENEMYSPRITE 1
#define NUMBERSPRITE 8

#define NUMBEROAM 100