
//{{BLOCK(instruction)

//======================================================================
//
//	instruction, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 286 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 9152 + 2048 = 11712
//
//	Time-stamp: 2018-04-15, 11:56:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTION_H
#define GRIT_INSTRUCTION_H

#define instructionTilesLen 9152
extern const unsigned short instructionTiles[4576];

#define instructionMapLen 2048
extern const unsigned short instructionMap[1024];

#define instructionPalLen 512
extern const unsigned short instructionPal[256];

#endif // GRIT_INSTRUCTION_H

//}}BLOCK(instruction)
