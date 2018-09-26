#include <stdio.h>
#include <stdlib.h>
#include "game.h"
#include "myLib.h"
#include "start.h"
#include "pause.h"
#include "instruction.h"
#include "spritesheet.h"
#include "levelOne.h"
#include "win.h"
#include "lose.h"
#include "sound.h"
#include "gameSong.h"
#include "startSong.h"
#include "winSong.h"
#include "loseSong.h"

#include "intro01.h"
#include "intro02.h"
#include "intro03.h"
#include "intro04.h"
#include "growlFX.h"
#include "introSong.h"

/*
M04 04/12
-Timer Clock implemented. Timeout leads to lose screen.
-Animation for Saitama implemented.
-All states have been refactored into Mode0
-Different background music for START, GAME, WIN, LOSE implemented.

Notes for final version:
- two more complex levels implemented.
- cutscenes implemented at intro and between each levels
- alpha blending attempt

*/


// Prototypes
void introAnimation();
void initialize();
void start();
void goToStart();
void instruction();
void goToInstruction();
void game();
void goToGame();
void pause();
void goToPause();
void win();
void goToWin();
void lose();
void goToLose();


// Variables
unsigned short buttons;
unsigned short oldButtons;
int cheat;

// State
enum {INTRO, START, INSTRUCTION, GAME, PAUSE, WIN, LOSE};
int state;

// Level
int currentLevel;

// Intro Frame Counter
int introCounter;
int intro = 1;



int main() {

    initialize();

    while (1337) {
        // Update Buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Check
        switch(state) {
            case INTRO:
                introAnimation();
                break;

            case START:
                start();
                break;

            case INSTRUCTION:
                instruction();
                break;

            case GAME:
                game();
                break;

            case PAUSE:
                pause();
                break;

            case WIN:
                win();
                break;

            case LOSE:
                lose();
                break;
        }
    }
}

void introAnimation() {
    switch(intro) {
        case 1:
            DMANow(3, intro01Pal, PALETTE, 256);

            REG_DISPCTL = 0;
            REG_DISPCTL = MODE0 | BG0_ENABLE;
            REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;


            DMANow(3, intro01Tiles, &CHARBLOCK[0], intro01TilesLen/2);
            DMANow(3, intro01Map, &SCREENBLOCK[31], intro01MapLen/2);

            if (introCounter < 0x80) {
                REG_BLDMOD = BG0_A | BG1_A | BG3_A | OBJ_A | NORMAL_TRANS | BLD_BLACK;

                REG_COLEY = WEIGHTOFA((0x80 - introCounter) / 8);
            } else if (introCounter + 0x80 >= 2500) {
                REG_BLDMOD = BG0_A | BG1_A | BG3_A | OBJ_A | NORMAL_TRANS | BLD_BLACK;

                REG_COLEY = WEIGHTOFA((introCounter) / 8);
            }

            REG_BG0HOFF = 0;
            REG_BG0VOFF = 0;

            break;

        case 2:
            DMANow(3, intro02Pal, PALETTE, 256);
            if (introCounter == 0x80) {
                playSoundB(growlFX, GROWLFXLEN, GROWLFXFREQ, 0);
            }

            REG_DISPCTL = 0;
            REG_DISPCTL = MODE0 | BG0_ENABLE;
            REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;


            DMANow(3, intro02Tiles, &CHARBLOCK[0], intro02TilesLen/2);
            DMANow(3, intro02Map, &SCREENBLOCK[31], intro02MapLen/2);

            if (introCounter < 0x80) {
                REG_BLDMOD = BG0_A | BG1_A | BG3_A | OBJ_A | NORMAL_TRANS | BLD_BLACK;

                REG_COLEY = WEIGHTOFA((0x80 - introCounter) / 8);
            } else if (introCounter + 0x80 >= 2500) {
                REG_BLDMOD = BG0_A | BG1_A | BG3_A | OBJ_A | NORMAL_TRANS | BLD_BLACK;

                REG_COLEY = WEIGHTOFA((introCounter) / 8);
            }

            REG_BG0HOFF = 0;
            REG_BG0VOFF = 0;

            break;

        case 3:
            DMANow(3, intro03Pal, PALETTE, 256);

            REG_DISPCTL = 0;
            REG_DISPCTL = MODE0 | BG0_ENABLE;
            REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;


            DMANow(3, intro03Tiles, &CHARBLOCK[0], intro03TilesLen/2);
            DMANow(3, intro03Map, &SCREENBLOCK[31], intro03MapLen/2);

            if (introCounter < 0x80) {
                REG_BLDMOD = BG0_A | BG1_A | BG3_A | OBJ_A | NORMAL_TRANS | BLD_BLACK;

                REG_COLEY = WEIGHTOFA((0x80 - introCounter) / 8);
            } else if (introCounter + 0x80 >= 2500) {
                REG_BLDMOD = BG0_A | BG1_A | BG3_A | OBJ_A | NORMAL_TRANS | BLD_BLACK;

                REG_COLEY = WEIGHTOFA((introCounter) / 8);
            }

            REG_BG0HOFF = 0;
            REG_BG0VOFF = 0;

            break;

        case 4:
            DMANow(3, intro04Pal, PALETTE, 256);

            REG_DISPCTL = 0;
            REG_DISPCTL = MODE0 | BG0_ENABLE;
            REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;


            DMANow(3, intro04Tiles, &CHARBLOCK[0], intro04TilesLen/2);
            DMANow(3, intro04Map, &SCREENBLOCK[31], intro04MapLen/2);

            if (introCounter < 0x80) {
                REG_BLDMOD = BG0_A | BG1_A | BG3_A | OBJ_A | NORMAL_TRANS | BLD_BLACK;

                REG_COLEY = WEIGHTOFA((0x80 - introCounter) / 8);
            } else if (introCounter + 0x80 >= 2500) {
                REG_BLDMOD = BG0_A | BG1_A | BG3_A | OBJ_A | NORMAL_TRANS | BLD_BLACK;

                REG_COLEY = WEIGHTOFA((introCounter) / 8);
            }

            REG_BG0HOFF = 0;
            REG_BG0VOFF = 0;


            break;

        case 5:
            REG_BLDMOD = 0;
            REG_COLEY = 0;
            goToStart();
            stopSound();
            playSoundA(startSong, STARTSONGLEN, STARTSONGFREQ, 1);
    }

    introCounter++;
    if (introCounter >= 2500) {
        introCounter = 0;
        intro++;
    }
}

void initialize() {
    // Set up Mode 0
    REG_DISPCTL = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    setupSounds();
    setupInterrupts();

    state = INTRO;
    playSoundA(introSong, INTROSONGLEN, INTROSONGFREQ, 0);


}

void start() {
    // Button Reacts
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstruction();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundA(gameSong, GAMESONGLEN, GAMESONGFREQ, 1);
        currentLevel = 1;
        goToGame();
        initGame();
    }
}

void goToStart() {
    //Set up Splash Art
    DMANow(3, startPal, PALETTE, 256);

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;
    REG_BG1CNT = 0;
    hideSprites();

    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen/2);
    DMANow(3, startMap, &SCREENBLOCK[31], startMapLen/2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = START;

}

void instruction() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToInstruction() {
    DMANow(3, instructionPal, PALETTE, 256);

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;
    hideSprites();

    DMANow(3, instructionTiles, &CHARBLOCK[0], instructionTilesLen/2);
    DMANow(3, instructionMap, &SCREENBLOCK[31], instructionMapLen/2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = INSTRUCTION;
}

void game() {
    updateGame();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_HELD(BUTTON_A) && BUTTON_HELD(BUTTON_B) && BUTTON_HELD(BUTTON_SELECT)) {
        cheat = 1;
    }

    if ((player.worldCol + player.width + 15 >= MAPWIDTH) && enemiesRemaining <= 0) {
        switch(currentLevel) {
            case 1:
                currentLevel = 2;
                initGame();
                break;

            case 2:
                currentLevel = 3;
                initGame();
                break;

            case 3:
                goToWin();
                break;
        }

    }
    if (timeRemaining == 0) {
        goToLose();
    }
}

void goToGame() {
    // Game state is in Mode 0
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    hideSprites();

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(26) | BG_SIZE_LARGE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;

    unpauseSound();


    state = GAME;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

void goToPause() {
    hideSprites();

    DMANow(3, pausePal, PALETTE, 256);

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;
    hideSprites();

    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen/2);
    DMANow(3, pauseMap, &SCREENBLOCK[31], pauseMapLen/2);

    pauseSound();

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;


    state = PAUSE;
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        goToStart();
        playSoundA(startSong, STARTSONGLEN, STARTSONGFREQ, 1);
    }
}

void goToWin() {
    DMANow(3, winPal, PALETTE, 256);

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;
    REG_BG1CNT = 0;
    hideSprites();

    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/2);
    DMANow(3, winMap, &SCREENBLOCK[31], winMapLen/2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    stopSound();
    playSoundA(winSong, WINSONGLEN, WINSONGFREQ, 1);

    state = WIN;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        goToStart();
        playSoundA(startSong, STARTSONGLEN, STARTSONGFREQ, 1);
    }
}

void goToLose() {
    DMANow(3, losePal, PALETTE, 256);

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;
    REG_BG1CNT = 0;
    hideSprites();

    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen/2);
    DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen/2);

    stopSound();
    playSoundA(loseSong, LOSESONGLEN, LOSESONGFREQ, 1);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = LOSE;
}
