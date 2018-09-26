
//{{BLOCK(levelThree)

//======================================================================
//
//	levelThree, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 58 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 1856 + 8192 = 10560
//
//	Time-stamp: 2018-04-15, 15:12:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVELTHREE_H
#define GRIT_LEVELTHREE_H

#define levelThreeTilesLen 1856
extern const unsigned short levelThreeTiles[928];

#define levelThreeMapLen 8192
extern const unsigned short levelThreeMap[4096];

#define levelThreePalLen 512
extern const unsigned short levelThreePal[256];

#endif // GRIT_LEVELTHREE_H

//}}BLOCK(levelThree)
