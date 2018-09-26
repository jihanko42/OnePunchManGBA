
//{{BLOCK(levelTwo)

//======================================================================
//
//	levelTwo, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 80 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 2560 + 8192 = 11264
//
//	Time-stamp: 2018-04-15, 15:11:16
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVELTWO_H
#define GRIT_LEVELTWO_H

#define levelTwoTilesLen 2560
extern const unsigned short levelTwoTiles[1280];

#define levelTwoMapLen 8192
extern const unsigned short levelTwoMap[4096];

#define levelTwoPalLen 512
extern const unsigned short levelTwoPal[256];

#endif // GRIT_LEVELTWO_H

//}}BLOCK(levelTwo)
