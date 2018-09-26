	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #256
	push	{r4, lr}
	ldr	r3, .L4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	mov	ip, #0
	ldr	lr, .L4+8
	ldr	r4, .L4+12
	mov	r3, ip
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	ldr	r0, .L4+24
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	setupSounds
	.word	setupInterrupts
	.word	state
	.word	playSoundA
	.word	11025
	.word	262824
	.word	introSong
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r1, .L8
	ldr	r6, .L8+4
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r6
	mov	r4, #67108864
	mov	r5, #0
	mov	r2, #7936
	mov	r3, #256
	strh	r2, [r4, #8]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r5, [r4, #10]	@ movhi
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+12
	mov	r2, #100663296
	ldr	r1, .L8+16
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	ldr	r2, .L8+20
	ldr	r1, .L8+24
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r2, #1
	ldr	r3, .L8+28
	strh	r5, [r4, #16]	@ movhi
	strh	r5, [r4, #18]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	startPal
	.word	DMANow
	.word	hideSprites
	.word	4880
	.word	startTiles
	.word	100726784
	.word	startMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	introAnimation
	.syntax unified
	.arm
	.fpu softvfp
	.type	introAnimation, %function
introAnimation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L41
	ldr	r3, [r5]
	sub	r3, r3, #1
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L11
.L13:
	.word	.L12
	.word	.L14
	.word	.L15
	.word	.L16
	.word	.L17
.L17:
	mov	r2, #0
	mov	r3, #67108864
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r3, #84]	@ movhi
	bl	goToStart
	ldr	r4, .L41+4
	ldr	r3, .L41+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L41+12
	mov	r3, #1
	ldr	r2, .L41+16
	ldr	r1, .L41+20
	ldr	r0, .L41+24
	mov	lr, pc
	bx	r6
	ldr	r3, [r4]
.L18:
	ldr	r2, .L41+28
	add	r3, r3, #1
	cmp	r3, r2
	movgt	r2, #0
	ldrgt	r3, [r5]
	addgt	r3, r3, #1
	strle	r3, [r4]
	strgt	r3, [r5]
	strgt	r2, [r4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L12:
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L41+32
	mov	r0, #3
	ldr	r7, .L41+36
	mov	lr, pc
	bx	r7
	mov	r6, #67108864
	mov	r2, #256
	mov	r3, #7936
	strh	r2, [r6]	@ movhi
	strh	r3, [r6, #8]	@ movhi
	mov	r2, #100663296
	sub	r3, r3, #1328
	ldr	r1, .L41+40
	mov	r0, #3
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	ldr	r4, .L41+4
	ldr	r2, .L41+44
	ldr	r1, .L41+48
.L37:
	mov	r0, #3
	mov	lr, pc
	bx	r7
	ldr	r3, [r4]
	cmp	r3, #127
	bgt	.L26
	mov	r1, #219
	rsb	r2, r3, #128
	asr	r2, r2, #3
	strh	r2, [r6, #84]	@ movhi
	strh	r1, [r6, #80]	@ movhi
.L27:
	mov	r2, #67108864
	mov	r1, #0
	strh	r1, [r2, #16]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	b	.L18
.L14:
	ldr	r4, .L41+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L41+52
	mov	r0, #3
	ldr	r7, .L41+36
	mov	lr, pc
	bx	r7
	ldr	r3, [r4]
	cmp	r3, #128
	beq	.L40
.L21:
	mov	r6, #67108864
	mov	r2, #256
	mov	r3, #7936
	strh	r2, [r6]	@ movhi
	strh	r3, [r6, #8]	@ movhi
	mov	r2, #100663296
	sub	r3, r3, #1328
	ldr	r1, .L41+56
	mov	r0, #3
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	ldr	r2, .L41+44
	ldr	r1, .L41+60
	b	.L37
.L15:
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L41+64
	mov	r0, #3
	ldr	r7, .L41+36
	mov	lr, pc
	bx	r7
	mov	r6, #67108864
	mov	r2, #256
	mov	r3, #7936
	strh	r2, [r6]	@ movhi
	strh	r3, [r6, #8]	@ movhi
	mov	r2, #100663296
	sub	r3, r3, #1712
	ldr	r1, .L41+68
	mov	r0, #3
	mov	lr, pc
	bx	r7
	ldr	r4, .L41+4
	mov	r3, #1024
	ldr	r2, .L41+44
	ldr	r1, .L41+72
	b	.L37
.L16:
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L41+76
	mov	r0, #3
	ldr	r7, .L41+36
	mov	lr, pc
	bx	r7
	mov	r6, #67108864
	mov	r2, #256
	mov	r3, #7936
	strh	r2, [r6]	@ movhi
	strh	r3, [r6, #8]	@ movhi
	mov	r2, #100663296
	mov	r3, #8064
	ldr	r1, .L41+80
	mov	r0, #3
	mov	lr, pc
	bx	r7
	ldr	r4, .L41+4
	mov	r3, #1024
	ldr	r2, .L41+44
	ldr	r1, .L41+84
	b	.L37
.L26:
	ldr	r2, .L41+88
	cmp	r3, r2
	movgt	r1, #219
	asrgt	r2, r3, #3
	strhgt	r1, [r6, #80]	@ movhi
	strhgt	r2, [r6, #84]	@ movhi
	b	.L27
.L11:
	ldr	r4, .L41+4
	ldr	r3, [r4]
	b	.L18
.L40:
	mov	r3, #0
	ldr	r2, .L41+16
	ldr	r1, .L41+92
	ldr	r0, .L41+96
	ldr	r6, .L41+100
	mov	lr, pc
	bx	r6
	b	.L21
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.word	introCounter
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1428115
	.word	startSong
	.word	2499
	.word	intro01Pal
	.word	DMANow
	.word	intro01Tiles
	.word	100726784
	.word	intro01Map
	.word	intro02Pal
	.word	intro02Tiles
	.word	intro02Map
	.word	intro03Pal
	.word	intro03Tiles
	.word	intro03Map
	.word	intro04Pal
	.word	intro04Tiles
	.word	intro04Map
	.word	2371
	.word	47808
	.word	growlFX
	.word	playSoundB
	.size	introAnimation, .-introAnimation
	.align	2
	.global	instruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L48
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L49:
	.align	2
.L48:
	.word	oldButtons
	.word	buttons
	.size	instruction, .-instruction
	.align	2
	.global	goToInstruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r1, .L52
	ldr	r5, .L52+4
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r5
	mov	r4, #67108864
	mov	r2, #256
	mov	r3, #7936
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L52+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+12
	mov	r2, #100663296
	ldr	r1, .L52+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L52+20
	ldr	r1, .L52+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r1, #2
	ldr	r2, .L52+28
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	instructionPal
	.word	DMANow
	.word	hideSprites
	.word	4576
	.word	instructionTiles
	.word	100726784
	.word	instructionMap
	.word	state
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L56
	ldr	r2, .L56+4
	ldr	r1, .L56+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L56+12
	ldr	r1, .L56+16
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L56+20
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #4864
	mov	r1, #7936
	ldr	r2, .L56+24
	strh	r0, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L56+28
	strh	r1, [r3, #10]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r2, #3
	ldr	r3, .L56+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L57:
	.align	2
.L56:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	-9724
	.word	unpauseSound
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L70
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L59
	ldr	r2, .L70+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L68
.L59:
	tst	r3, #8
	beq	.L58
	ldr	r3, .L70+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
.L58:
	pop	{r4, lr}
	bx	lr
.L69:
	ldr	r1, .L70+8
	ldr	r0, .L70+12
	mov	r3, #1
	ldr	r2, .L70+16
	ldr	r4, .L70+20
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L70+24
	str	r2, [r3]
	bl	goToGame
	ldr	r3, .L70+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L68:
	bl	goToInstruction
	ldrh	r3, [r4]
	b	.L59
.L71:
	.align	2
.L70:
	.word	oldButtons
	.word	buttons
	.word	959904
	.word	gameSong
	.word	11025
	.word	playSoundA
	.word	currentLevel
	.word	initGame
	.size	start, .-start
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L84
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L73
	ldr	r2, .L84+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L82
.L73:
	tst	r3, #8
	beq	.L72
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L83
.L72:
	pop	{r4, lr}
	bx	lr
.L83:
	pop	{r4, lr}
	b	goToGame
.L82:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L73
.L85:
	.align	2
.L84:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L88
	mov	lr, pc
	bx	r6
	ldr	r5, .L88+4
	ldr	r1, .L88+8
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r5
	mov	r4, #67108864
	mov	r2, #256
	mov	r3, #7936
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r3, #2992
	mov	r2, #100663296
	ldr	r1, .L88+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L88+16
	ldr	r1, .L88+20
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L88+24
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #4
	ldr	r2, .L88+28
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	hideSprites
	.word	DMANow
	.word	pausePal
	.word	pauseTiles
	.word	100726784
	.word	pauseMap
	.word	pauseSound
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L99
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L99+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L99+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L99+12
	bl	goToStart
	mov	r3, #1
	ldr	r2, .L99+16
	ldr	r1, .L99+20
	ldr	r0, .L99+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1428115
	.word	startSong
	.size	win, .-win
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r1, .L103
	ldr	r6, .L103+4
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r6
	mov	r4, #67108864
	mov	r5, #0
	mov	r2, #7936
	mov	r3, #256
	strh	r2, [r4, #8]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r5, [r4, #10]	@ movhi
	ldr	r3, .L103+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+12
	mov	r2, #100663296
	ldr	r1, .L103+16
	mov	r0, #3
	mov	lr, pc
	bx	r6
	ldr	r2, .L103+20
	ldr	r1, .L103+24
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r6
	strh	r5, [r4, #16]	@ movhi
	ldr	r3, .L103+28
	strh	r5, [r4, #18]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L103+32
	mov	r3, #1
	ldr	r2, .L103+36
	ldr	r1, .L103+40
	ldr	r0, .L103+44
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L103+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L104:
	.align	2
.L103:
	.word	winPal
	.word	DMANow
	.word	hideSprites
	.word	8496
	.word	winTiles
	.word	100726784
	.word	winMap
	.word	stopSound
	.word	playSoundA
	.word	44100
	.word	5817769
	.word	winSong
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r1, .L108
	ldr	r6, .L108+4
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r6
	mov	r4, #67108864
	mov	r5, #0
	mov	r2, #7936
	mov	r3, #256
	strh	r2, [r4, #8]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r5, [r4, #10]	@ movhi
	ldr	r3, .L108+8
	mov	lr, pc
	bx	r3
	mov	r3, #2864
	mov	r2, #100663296
	ldr	r1, .L108+12
	mov	r0, #3
	mov	lr, pc
	bx	r6
	ldr	r2, .L108+16
	ldr	r1, .L108+20
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r6
	ldr	r3, .L108+24
	mov	lr, pc
	bx	r3
	ldr	r6, .L108+28
	mov	r3, #1
	ldr	r2, .L108+32
	ldr	r1, .L108+36
	ldr	r0, .L108+40
	mov	lr, pc
	bx	r6
	mov	r2, #6
	ldr	r3, .L108+44
	strh	r5, [r4, #16]	@ movhi
	strh	r5, [r4, #18]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L109:
	.align	2
.L108:
	.word	losePal
	.word	DMANow
	.word	hideSprites
	.word	loseTiles
	.word	100726784
	.word	loseMap
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	797075
	.word	loseSong
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L126
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L111
	ldr	r3, .L126+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L122
.L111:
	ldr	r3, .L126+16
	ldrh	r2, [r3, #48]
	tst	r2, #1
	bne	.L112
	ldrh	r2, [r3, #48]
	tst	r2, #2
	beq	.L123
.L112:
	ldr	r2, .L126+20
	ldr	r3, [r2, #12]
	ldr	r2, [r2, #20]
	add	r3, r3, r2
	cmp	r3, #496
	ble	.L113
	ldr	r3, .L126+24
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L124
.L113:
	ldr	r3, .L126+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L125
	pop	{r4, lr}
	bx	lr
.L123:
	ldrh	r3, [r3, #48]
	tst	r3, #4
	moveq	r2, #1
	ldreq	r3, .L126+32
	streq	r2, [r3]
	b	.L112
.L125:
	pop	{r4, lr}
	b	goToLose
.L124:
	ldr	r2, .L126+36
	ldr	r3, [r2]
	cmp	r3, #2
	beq	.L114
	cmp	r3, #3
	beq	.L115
	cmp	r3, #1
	bne	.L113
	mov	r1, #2
	ldr	r3, .L126+40
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	b	.L113
.L122:
	bl	goToPause
	b	.L111
.L115:
	bl	goToWin
	b	.L113
.L114:
	mov	r1, #3
	ldr	r3, .L126+40
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	b	.L113
.L127:
	.align	2
.L126:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	player
	.word	enemiesRemaining
	.word	timeRemaining
	.word	cheat
	.word	currentLevel
	.word	initGame
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L142
	mov	lr, pc
	bx	r3
	ldr	r7, .L142+4
	ldr	r5, .L142+8
	ldr	fp, .L142+12
	ldr	r10, .L142+16
	ldr	r9, .L142+20
	ldr	r8, .L142+24
	ldr	r6, .L142+28
	ldr	r4, .L142+32
.L129:
	ldrh	ip, [r7]
	strh	ip, [r5]	@ movhi
	ldr	r0, [fp]
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r0, #6
	ldrls	pc, [pc, r0, asl #2]
	b	.L129
.L132:
	.word	.L131
	.word	.L133
	.word	.L134
	.word	.L135
	.word	.L136
	.word	.L137
	.word	.L137
.L137:
	mov	lr, pc
	bx	r6
	b	.L129
.L136:
	ldr	r3, .L142+36
	mov	lr, pc
	bx	r3
	b	.L129
.L135:
	mov	lr, pc
	bx	r8
	b	.L129
.L134:
	tst	ip, #8
	beq	.L129
	tst	r3, #8
	bne	.L129
	ldr	r3, .L142+40
	mov	lr, pc
	bx	r3
	b	.L129
.L133:
	mov	lr, pc
	bx	r9
	b	.L129
.L131:
	mov	lr, pc
	bx	r10
	b	.L129
.L143:
	.align	2
.L142:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	state
	.word	introAnimation
	.word	start
	.word	game
	.word	win
	.word	67109120
	.word	pause
	.word	goToStart
	.size	main, .-main
	.global	intro
	.comm	introCounter,4,4
	.comm	currentLevel,4,4
	.comm	state,4,4
	.comm	cheat,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	intro, %object
	.size	intro, 4
intro:
	.word	1
	.ident	"GCC: (devkitARM release 47) 7.1.0"
