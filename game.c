#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"

#include "levelOne.h"
#include "levelOneCollision.h"
#include "levelOneBG.h"

#include "levelTwo.h"
#include "levelTwoBG.h"
#include "levelTwoCollision.h"

#include "levelThree.h"
#include "levelThreeBG.h"
#include "levelThreeCollision.h"

// Game variables
int vOff;
int hOff;
PLAYER player;
ENEMY enemies[5];
int enemiesRemaining;
int timeRemaining;
int tens;
int ones;
int frameCounter;
int enemyCount;

// Player Animate State
enum {STAND, PUNCH, WALK, JUMP, FALL};

// Sprite shadowOAM
OBJ_ATTR shadowOAM[128];




void initGame() {
    hOff = 0;
    vOff = MAPHEIGHT - SCREENHEIGHT;
    hideSprites();

    if (currentLevel == 1) {
        cheat = 0;
        initTime();
        enemyCount = 1;
    } else if (currentLevel == 2) {
        enemyCount = 3;
    } else if (currentLevel == 3) {
        enemyCount = 1;
    }

    enemiesRemaining = enemyCount;
    initPlayer();
    initEnemy();
}

void updateGame() {
    // Update Camera View
    // Adjust hOff and Voff later to account for player movement across map!!!
    updateEnemy();
    updatePlayer();
    if (cheat) {
        return;
    }
    updateTime();
}


void drawGame() {
    switch(currentLevel) {
        case 1:
            DMANow(3, levelOneBGPal, PALETTE, 256);

            //Background
            DMANow(3, levelOneBGTiles, &CHARBLOCK[0], levelOneBGTilesLen/2);
            DMANow(3, levelOneBGMap, &SCREENBLOCK[31], levelOneBGMapLen/2);


            // Playable Map
            DMANow(3, levelOneTiles, &CHARBLOCK[1], levelOneTilesLen/2);
            DMANow(3, levelOneMap, &SCREENBLOCK[26], levelOneMapLen/2);

            break;

        case 2:
            DMANow(3, levelTwoBGPal, PALETTE, 256);

            //Background
            DMANow(3, levelTwoBGTiles, &CHARBLOCK[0], levelTwoBGTilesLen/2);
            DMANow(3, levelTwoBGMap, &SCREENBLOCK[31], levelTwoBGMapLen/2);


            // Playable Map
            DMANow(3, levelTwoTiles, &CHARBLOCK[1], levelTwoTilesLen/2);
            DMANow(3, levelTwoMap, &SCREENBLOCK[26], levelTwoMapLen/2);

            break;

        case 3:
            DMANow(3, levelThreeBGPal, PALETTE, 256);

            //Background
            DMANow(3, levelThreeBGTiles, &CHARBLOCK[0], levelThreeBGTilesLen/2);
            DMANow(3, levelThreeBGMap, &SCREENBLOCK[31], levelThreeBGMapLen/2);


            // Playable Map
            DMANow(3, levelThreeTiles, &CHARBLOCK[1], levelThreeTilesLen/2);
            DMANow(3, levelThreeMap, &SCREENBLOCK[26], levelThreeMapLen/2);

            break;

    }


    drawTime();
    for (int i = 0; i < enemyCount; i++) {
        drawEnemy(&enemies[i]);
    }
    drawPlayer();

    waitForVBlank();

    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    REG_BG1HOFF = hOff/20;
    REG_BG1VOFF = vOff/5;
}

void initPlayer() {
    player.height = 30;
    player.width = 26;
    player.worldRow = ABSOLUTEGROUND - player.height;
    player.worldCol = 30;
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;
    player.jumping = 0;
    player.falling = 0;

    // Animate Variables
    player.curFrame = 0;
    player.aniCounter = 0;
    player.aniState = STAND;
    player.leftFaced = 0;
}

void updatePlayer() {


    // Player Attacks Enemy
    for (int i = 0; i < enemyCount; i++) {
        if (collision(player.worldRow, player.worldCol - player.width/2, player.height, player.width + 10 ,
                enemies[i].worldRow, enemies[i].worldCol - enemies[i].width/2, enemies[i].height, enemies[i].width + 5)) {
            if (BUTTON_PRESSED(BUTTON_B)) {
                enemies[i].dead = 1;
                enemiesRemaining--;
                enemies[i].erased = 0;
            }
        }
    }

    // Player Jumping
    if (BUTTON_PRESSED(BUTTON_A) && !player.jumping && !player.falling) {
        player.jumping = 21;
        player.falling = 1;
    }
    if (player.jumping) {
        player.worldRow -= player.jumping / 3;
        player.jumping--;
    } else if (player.falling) {
        if (player.worldRow < ABSOLUTEGROUND - player.height) {
            // Checking for collision map conditions
            if (fallable()) {
                player.worldRow += fallPartially(player.falling / 3);
            }
        } else {
            // Player stops falling if player hits abs ground
            player.falling = 0;
        }
        player.falling++;
        if (!fallable()) {
            player.falling = 0;
        }
    } else if (fallable()) {
        // Dropping off of a platform. Gravity induced falling
        player.falling = 1;
    }

    if (vOff > 0 && player.screenRow <= SCREENHEIGHT/8) {
        vOff -= 5;
    } else if (vOff < MAPHEIGHT - SCREENHEIGHT &&
        player.screenRow >= SCREENHEIGHT/2) {
        vOff += 5;
    }

    // Player side-to-side movement
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        player.leftFaced = 1;
    } else if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        player.leftFaced = 0;
    }
    if (BUTTON_HELD(BUTTON_LEFT) && player.worldCol > 0 && leftMoveable()) {
        if (hOff > 0 && player.screenCol <= SCREENWIDTH/3) {
            hOff -= 2;
        }
        player.worldCol -= 2;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if ((player.worldCol + player.width < MAPWIDTH)){
            if (rightMoveable()){
                if (hOff < MAPWIDTH - SCREENWIDTH && player.screenCol >= SCREENWIDTH/3) {
                    hOff += 2;
                }
                player.worldCol += 2;
            }
        }


    }

    // Screen Row Update
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    animatePlayer();
}

void animatePlayer() {

    player.prevAniState = player.aniState;
    player.aniState = STAND;
    if (player.aniCounter % 5 == 0) {
        player.curFrame++;
    }

    if (BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_LEFT)) {
        player.aniState = WALK;
    }
    if (player.jumping) {
        player.aniState = JUMP;
    } else if (player.falling) {
        player.aniState = FALL;
    }

    if (BUTTON_HELD(BUTTON_B)) {
        player.aniState = PUNCH;
    }


    player.aniCounter++;

    if (player.aniState == WALK) {
        if (player.curFrame >= 8) {
            player.curFrame = 0;
        }
    } else if (player.aniState == PUNCH) {
        if (player.curFrame >= 6) {
            player.curFrame = 0;
        }
    } else {
        player.curFrame = 0;
    }

}

void drawPlayer() {
    shadowOAM[0].attr0 = ATTR0_SQUARE | player.screenRow;
    shadowOAM[0].attr1 = ATTR1_MEDIUM | player.screenCol | (player.leftFaced << 12);
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, player.curFrame * 4) | ATTR2_PALROW(0);
}

void initEnemy() {
    switch(currentLevel) {
        case 1:
            enemies[0].height = 52;
            enemies[0].width = 21;
            enemies[0].worldRow = ABSOLUTEGROUND - enemies[0].height;
            enemies[0].worldCol = 350;
            enemies[0].dead = 0;
            enemies[0].erased = 0;
            enemies[0].rightFaced = 0;
            break;

        case 2:
            enemies[0].worldRow = ABSOLUTEGROUND - 25;
            enemies[0].worldCol = 350;
            enemies[1].worldRow = MAPHEIGHT - 25*8;
            enemies[1].worldCol = 30;
            enemies[2].worldRow = MAPHEIGHT - 38*8;
            enemies[2].worldCol = 470;


            for (int i = 0; i < enemyCount; i++) {
                enemies[i].height = 20;
                enemies[i].width = 15;
                enemies[i].rightFaced = i % 2;
                enemies[i].dead = 0;
                enemies[i].erased = 0;
                enemies[i].jumping = 25;
                enemies[i].falling = 25;
                enemies[i].id = i;
            }

            break;

        case 3:
            enemies[0].height = 52;
            enemies[0].width = 22;
            enemies[0].worldRow = MAPHEIGHT - 44*8;
            enemies[0].worldCol = 450;
            enemies[0].dead = 0;
            enemies[0].erased = 0;
            enemies[0].rightFaced = 0;
            break;
    }
}

void updateEnemy() {
    if (currentLevel == 1 || currentLevel == 3) {
        return;
    }
    //
    for (int i = 0; i < enemyCount; i++) {
        if (enemies[i].jumping) {
            enemies[i].worldRow--;
            enemies[i].jumping--;
        } else if (enemies[i].falling) {
            enemies[i].worldRow++;
            enemies[i].falling--;
        } else {
            enemies[i].jumping = 25;
            enemies[i].falling = 25;
        }
    }
}

void drawEnemy(ENEMY *e) {
    if (!e->dead) {
        if ((e->worldRow + e->height >= vOff) && (e->worldRow <= vOff + SCREENHEIGHT)) {
            int palRow;
            if (currentLevel == 1 || currentLevel == 2) {
                palRow = 1;
            } else {
                palRow = 2;
            }
            shadowOAM[currentLevel + e->id].attr0 = ATTR0_TALL | ((e->worldRow - vOff) & ROWMASK);
            shadowOAM[currentLevel + e->id].attr1 = ATTR1_LARGE | ((e->worldCol - hOff) & COLMASK) | ((e->rightFaced)<<12);
            shadowOAM[currentLevel + e->id].attr2 = ATTR2_TILEID(20, currentLevel * 4) | ATTR2_PALROW(palRow);
        } else {
            shadowOAM[currentLevel + e->id].attr0 = ATTR0_HIDE;
        }
    } else if (!e->erased) {
        shadowOAM[currentLevel + e->id].attr0 = ATTR0_HIDE;
        e-> erased = 1;
    }
}

int fallable() {
    if (currentLevel == 1) {
        return (player.worldRow + player.height < ABSOLUTEGROUND
            && levelOneCollisionBitmap[OFFSET(player.worldRow + player.height + 1, player.worldCol, MAPWIDTH)]
            && levelOneCollisionBitmap[OFFSET(player.worldRow + player.height + 1, player.worldCol + player.width - 1, MAPWIDTH)]);
    } else if (currentLevel == 2) {
        return (player.worldRow + player.height < ABSOLUTEGROUND
            && levelTwoCollisionBitmap[OFFSET(player.worldRow + player.height + 1, player.worldCol, MAPWIDTH)]
            && levelTwoCollisionBitmap[OFFSET(player.worldRow + player.height + 1, player.worldCol + player.width - 1, MAPWIDTH)]);
    } else if (currentLevel == 3) {
        return (player.worldRow + player.height < ABSOLUTEGROUND
            && levelThreeCollisionBitmap[OFFSET(player.worldRow + player.height + 1, player.worldCol, MAPWIDTH)]
            && levelThreeCollisionBitmap[OFFSET(player.worldRow + player.height + 1, player.worldCol + player.width - 1, MAPWIDTH)]);
    }
    return 1;
}

int fallPartially(int ahead) {
    // Calculates how much to fall without falling below collision map limits
    for (int i = ahead; i > 0; i--) {
        if (currentLevel == 1) {
            if (levelOneCollisionBitmap[OFFSET(player.worldRow + player.height + i - 1, player.worldCol, MAPWIDTH)] &&
                levelOneCollisionBitmap[OFFSET(player.worldRow + player.height + i - 1, player.worldCol + player.width - 1, MAPWIDTH)]) {
                return i;
            }
        } else if (currentLevel == 2) {
            if (levelTwoCollisionBitmap[OFFSET(player.worldRow + player.height + i - 1, player.worldCol, MAPWIDTH)] &&
                levelTwoCollisionBitmap[OFFSET(player.worldRow + player.height + i - 1, player.worldCol + player.width - 1, MAPWIDTH)]) {
                return i;
            }
        } else if (currentLevel == 3) {
            if (levelThreeCollisionBitmap[OFFSET(player.worldRow + player.height + i - 1, player.worldCol, MAPWIDTH)] &&
                levelThreeCollisionBitmap[OFFSET(player.worldRow + player.height + i - 1, player.worldCol + player.width - 1, MAPWIDTH)]) {
                return i;
            }
        }
    }
    return 0;
}

int leftMoveable() {
    if (currentLevel == 1) {
        return (levelOneCollisionBitmap[OFFSET(player.worldRow, player.worldCol + 8, MAPWIDTH)]
            && levelOneCollisionBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + 8, MAPWIDTH)]
            && levelOneCollisionBitmap[OFFSET(player.worldRow + player.height/2, player.worldCol + 8, MAPWIDTH)]);
    } else if (currentLevel == 2) {
        return (levelTwoCollisionBitmap[OFFSET(player.worldRow, player.worldCol + 8, MAPWIDTH)]
            && levelTwoCollisionBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + 8, MAPWIDTH)]
            && levelTwoCollisionBitmap[OFFSET(player.worldRow + player.height/2, player.worldCol + 8, MAPWIDTH)]);
    } else if (currentLevel == 3) {
        return (levelThreeCollisionBitmap[OFFSET(player.worldRow, player.worldCol + 8, MAPWIDTH)]
            && levelThreeCollisionBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + 8, MAPWIDTH)]
            && levelThreeCollisionBitmap[OFFSET(player.worldRow + player.height/2, player.worldCol + 8, MAPWIDTH)]);
    }
    return 1;
}

int rightMoveable() {
    if (currentLevel == 1) {
        return (levelOneCollisionBitmap[OFFSET(player.worldRow, player.worldCol + player.width + 8, MAPWIDTH)]
            && levelOneCollisionBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + 8 + player.width, MAPWIDTH)]
            && levelOneCollisionBitmap[OFFSET(player.worldRow + player.height/2, player.worldCol + player.width + 8, MAPWIDTH)]);
    } else if (currentLevel == 2) {
        return (levelTwoCollisionBitmap[OFFSET(player.worldRow, player.worldCol + player.width + 8, MAPWIDTH)]
            && levelTwoCollisionBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + 8 + player.width, MAPWIDTH)]
            && levelTwoCollisionBitmap[OFFSET(player.worldRow + player.height/2, player.worldCol + player.width + 8, MAPWIDTH)]);
    } else if (currentLevel == 3) {
        return (levelThreeCollisionBitmap[OFFSET(player.worldRow, player.worldCol + player.width + 8, MAPWIDTH)]
            && levelThreeCollisionBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + 8 + player.width, MAPWIDTH)]
            && levelThreeCollisionBitmap[OFFSET(player.worldRow + player.height/2, player.worldCol + player.width + 8, MAPWIDTH)]);
    }
    return 1;
}

void initTime() {
    timeRemaining = DEFAULTTIME;
    frameCounter = 0;
}

void updateTime() {
    frameCounter++;
    if (frameCounter >= 60) {
        frameCounter = 0;
        timeRemaining--;
    }
}

void drawTime() {
    tens = timeRemaining / 10;
    ones = timeRemaining % 10;
    shadowOAM[NUMBEROAM].attr0 = ATTR0_SQUARE | (5);
    shadowOAM[NUMBEROAM].attr1 = ATTR1_SMALL | (104);
    shadowOAM[NUMBEROAM].attr2 = ATTR2_TILEID(0, NUMBERSPRITE + tens * 2) | ATTR2_PALROW(0);
    shadowOAM[NUMBEROAM + 1].attr0 = ATTR0_SQUARE | (5);
    shadowOAM[NUMBEROAM + 1].attr1 = ATTR1_SMALL | (120);
    shadowOAM[NUMBEROAM + 1].attr2 = ATTR2_TILEID(0, NUMBERSPRITE + ones * 2) | ATTR2_PALROW(0);

}
