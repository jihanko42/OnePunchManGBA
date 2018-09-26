
//{{BLOCK(levelOne)

//======================================================================
//
//	levelOne, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 86 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 2752 + 8192 = 11456
//
//	Time-stamp: 2018-04-15, 03:35:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVELONE_H
#define GRIT_LEVELONE_H

#define levelOneTilesLen 2752
extern const unsigned short levelOneTiles[1376];

#define levelOneMapLen 8192
extern const unsigned short levelOneMap[4096];

#define levelOnePalLen 512
extern const unsigned short levelOnePal[256];

#endif // GRIT_LEVELONE_H

//}}BLOCK(levelOne)
