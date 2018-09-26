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
	.file	"game.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy.part.1, %function
updateEnemy.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	ldr	r3, .L10+4
	add	r1, r1, r1, lsl #2
	mov	ip, #25
	add	r1, r3, r1, lsl #3
	b	.L6
.L9:
	ldr	r0, [r3]
	sub	r0, r0, #1
	str	r2, [r3, #24]
	str	r0, [r3]
.L4:
	add	r3, r3, #40
	cmp	r3, r1
	bxeq	lr
.L6:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	sub	r2, r2, #1
	bne	.L9
	ldr	r2, [r3, #28]
	cmp	r2, #0
	ldrne	r0, [r3]
	sub	r2, r2, #1
	addne	r0, r0, #1
	strne	r2, [r3, #28]
	strne	r0, [r3]
	streq	ip, [r3, #24]
	streq	ip, [r3, #28]
	b	.L4
.L11:
	.align	2
.L10:
	.word	enemyCount
	.word	enemies
	.size	updateEnemy.part.1, .-updateEnemy.part.1
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #30
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #26
	ldr	r1, .L14
	ldr	r3, .L14+4
	ldr	lr, .L14+8
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	r3, .L14+12
	sub	r0, lr, r0
	sub	r1, ip, r1
	str	lr, [r3, #8]
	str	r4, [r3, #20]
	str	r0, [r3]
	str	r1, [r3, #4]
	str	ip, [r3, #16]
	str	ip, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #44]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #48]
	pop	{r4, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	vOff
	.word	hOff
	.word	466
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	ldr	r3, .L39
	ldr	r1, .L39+4
	ldr	r2, [r3, #40]
	push	{r4, r5}
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr #1
	add	r1, r1, r1, lsl #2
	cmp	r2, r1
	ldreq	r1, [r3, #44]
	addeq	r1, r1, #1
	streq	r1, [r3, #44]
	ldr	r1, .L39+8
	ldr	ip, [r3, #32]
	str	r0, [r3, #32]
	ldrh	r0, [r1, #48]
	tst	r0, #16
	str	ip, [r3, #36]
	beq	.L18
	ldrh	r1, [r1, #48]
	tst	r1, #32
	beq	.L18
.L19:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	movne	r1, #3
	strne	r1, [r3, #32]
	bne	.L21
	ldr	r1, [r3, #28]
	cmp	r1, #0
	movne	r1, #4
	strne	r1, [r3, #32]
.L21:
	ldr	r1, .L39+8
	ldrh	r1, [r1, #48]
	tst	r1, #2
	beq	.L22
	ldr	r1, [r3, #32]
	add	r2, r2, #1
	cmp	r1, #2
	str	r2, [r3, #40]
	bne	.L38
	ldr	r2, [r3, #44]
	cmp	r2, #7
	movgt	r2, #0
	strgt	r2, [r3, #44]
.L16:
	pop	{r4, r5}
	bx	lr
.L18:
	mov	r1, #2
	str	r1, [r3, #32]
	b	.L19
.L22:
	mov	r1, #1
	add	r2, r2, r1
	str	r2, [r3, #40]
	str	r1, [r3, #32]
.L25:
	ldr	r2, [r3, #44]
	cmp	r2, #5
	movgt	r2, #0
	strgt	r2, [r3, #44]
	b	.L16
.L38:
	cmp	r1, #1
	beq	.L25
	mov	r2, #0
	str	r2, [r3, #44]
	b	.L16
.L40:
	.align	2
.L39:
	.word	player
	.word	1717986919
	.word	67109120
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L43
	ldr	r3, [r1, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	add	r2, r1, #44
	str	lr, [sp, #-4]!
	ldm	r2, {r2, ip}
	ldr	lr, [r1, #32]
	ldr	r0, [r1]
	add	r2, r2, lr, lsl #5
	ldr	r1, .L43+4
	orr	r3, r3, ip, lsl #12
	lsl	r2, r2, #2
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L44:
	.align	2
.L43:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L57
	ldr	r3, [r3]
	cmp	r3, #2
	push	{r4, r5, lr}
	beq	.L47
	cmp	r3, #3
	beq	.L48
	cmp	r3, #1
	beq	.L56
.L45:
	pop	{r4, r5, lr}
	bx	lr
.L56:
	mov	lr, #52
	mov	ip, #21
	mov	r0, #444
	mov	r2, #0
	ldr	r3, .L57+4
	ldr	r1, .L57+8
.L55:
	str	lr, [r3, #8]
	str	ip, [r3, #12]
	stm	r3, {r0, r1}
	str	r2, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #16]
	pop	{r4, r5, lr}
	bx	lr
.L47:
	mov	ip, #312
	mov	r0, #30
	mov	r1, #208
	ldr	r3, .L57+12
	ldr	r2, .L57+16
	ldr	lr, [r3]
	ldr	r3, .L57+4
	cmp	lr, #0
	str	ip, [r3, #40]
	str	r2, [r3]
	add	ip, ip, #38
	sub	r2, r2, #1
	str	ip, [r3, #4]
	str	r0, [r3, #44]
	str	r1, [r3, #80]
	str	r2, [r3, #84]
	ble	.L45
	mov	r2, #0
	mov	r5, #20
	mov	r0, r2
	mov	r4, #15
	mov	r1, #25
.L51:
	str	r2, [r3, #36]
	and	ip, r2, #1
	add	r2, r2, #1
	cmp	r2, lr
	str	r5, [r3, #8]
	str	r4, [r3, #12]
	str	r0, [r3, #20]
	str	r0, [r3, #32]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	ip, [r3, #16]
	add	r3, r3, #40
	bne	.L51
	pop	{r4, r5, lr}
	bx	lr
.L48:
	mov	lr, #52
	mov	ip, #22
	mov	r0, #160
	mov	r2, #0
	ldr	r3, .L57+4
	ldr	r1, .L57+20
	b	.L55
.L58:
	.align	2
.L57:
	.word	currentLevel
	.word	enemies
	.word	350
	.word	enemyCount
	.word	471
	.word	450
	.size	initEnemy, .-initEnemy
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #352
	mov	r4, #0
	ldr	r0, .L67
	ldr	r2, .L67+4
	ldr	r3, .L67+8
	str	r4, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L65
	cmp	r3, #2
	beq	.L66
	cmp	r3, #3
	moveq	r2, #1
	moveq	r3, r2
	ldrne	r3, .L67+16
	ldreq	r1, .L67+16
	ldrne	r3, [r3]
	streq	r2, [r1]
.L61:
	ldr	r2, .L67+20
	str	r3, [r2]
	bl	initPlayer
	pop	{r4, lr}
	b	initEnemy
.L66:
	mov	r2, #3
	ldr	r1, .L67+16
	mov	r3, r2
	str	r2, [r1]
	b	.L61
.L65:
	mov	ip, #60
	ldr	r2, .L67+24
	ldr	r0, .L67+28
	str	ip, [r2]
	ldr	r1, .L67+32
	ldr	r2, .L67+16
	str	r4, [r0]
	str	r4, [r1]
	str	r3, [r2]
	b	.L61
.L68:
	.align	2
.L67:
	.word	hOff
	.word	vOff
	.word	hideSprites
	.word	currentLevel
	.word	enemyCount
	.word	enemiesRemaining
	.word	timeRemaining
	.word	cheat
	.word	frameCounter
	.size	initGame, .-initGame
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L71
	ldr	r3, [r3]
	bic	r3, r3, #2
	cmp	r3, #1
	bxeq	lr
	b	updateEnemy.part.1
.L72:
	.align	2
.L71:
	.word	currentLevel
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bne	.L74
	ldr	r1, .L83
	ldr	r2, [r0]
	ldr	r3, [r0, #8]
	ldr	r1, [r1]
	add	r3, r2, r3
	ldr	ip, .L83+4
	cmp	r3, r1
	ldr	r3, [ip]
	blt	.L75
	add	ip, r1, #160
	cmp	r2, ip
	bgt	.L75
	sub	r2, r2, r1
	and	r2, r2, #255
	mvn	r2, r2, lsl #17
	sub	r1, r3, #1
	cmp	r1, #1
	push	{r4, r5, lr}
	movhi	lr, #8192
	movls	lr, #4096
	mvn	r2, r2, lsr #17
	ldr	r1, .L83+8
	ldr	ip, [r0, #36]
	ldr	r4, [r1]
	ldr	r1, [r0, #4]
	ldr	r5, [r0, #16]
	sub	r1, r1, r4
	add	r0, r3, ip
	ldr	ip, .L83+12
	ldr	r4, .L83+16
	lsl	r1, r1, #23
	orr	ip, ip, r5, lsl #12
	lsl	r0, r0, #3
	lsr	r1, r1, #23
	add	r3, r3, #160
	orr	r3, lr, r3, lsl #2
	orr	r1, r1, ip
	add	ip, r4, r0
	strh	r2, [r4, r0]	@ movhi
	strh	r1, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L74:
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxne	lr
	mov	ip, #512
	mov	r2, #1
	ldr	r1, .L83+4
	ldr	r3, [r0, #36]
	ldr	r1, [r1]
	add	r3, r3, r1
	ldr	r1, .L83+16
	lsl	r3, r3, #3
	strh	ip, [r1, r3]	@ movhi
	str	r2, [r0, #32]
	bx	lr
.L75:
	mov	r1, #512
	ldr	r0, [r0, #36]
	ldr	r2, .L83+16
	add	r3, r3, r0
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L84:
	.align	2
.L83:
	.word	vOff
	.word	currentLevel
	.word	hOff
	.word	-16384
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L94
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, [r3]
	cmp	r4, #2
	beq	.L87
	cmp	r4, #3
	beq	.L88
	cmp	r4, #1
	beq	.L89
	ldr	r6, .L94+4
.L86:
	ldr	r1, .L94+8
	mov	ip, #5
	mov	r0, r1
	ldr	r2, .L94+12
	ldr	r3, .L94+16
	ldr	r2, [r2]
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #2
	add	lr, r3, r3, lsl #2
	sub	r2, r2, lr, lsl #1
	ldr	lr, .L94+20
	str	r2, [lr]
	add	r2, r2, #4
	lsl	r2, r2, #1
	strh	r2, [r1, #12]	@ movhi
	ldr	r2, .L94+24
	ldr	r7, .L94+28
	str	r3, [r2]
	add	r3, r3, #4
	strh	ip, [r0, #8]!	@ movhi
	lsl	r3, r3, #1
	strh	ip, [r1]	@ movhi
	ldr	ip, [r7]
	ldr	r2, .L94+32
	strh	r3, [r1, #4]	@ movhi
	ldr	r3, .L94+36
	cmp	ip, #0
	strh	r2, [r1, #2]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	ble	.L90
	mov	r5, #0
	ldr	r4, .L94+40
.L91:
	mov	r0, r4
	bl	drawEnemy
	ldr	r3, [r7]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #40
	bgt	.L91
.L90:
	ldr	r1, .L94+44
	ldr	r3, [r1, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	add	r2, r1, #44
	ldr	lr, [r1, #32]
	ldm	r2, {r2, ip}
	ldr	r4, .L94+48
	ldr	r0, [r1]
	add	r2, r2, lr, lsl #5
	orr	r3, r3, ip, lsl #12
	lsl	r2, r2, #2
	strh	r3, [r4, #2]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	ldr	r1, .L94+52
	mov	lr, pc
	bx	r1
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r0, #67108864
	ldr	r3, .L94+56
	ldr	r3, [r3]
	ldr	r1, .L94+60
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	ldr	r1, [r1]
	strh	r2, [r0, #16]	@ movhi
	ldr	r2, .L94+16
	smull	r6, r7, r3, r2
	smull	r4, r5, r1, r2
	asr	r3, r3, #31
	asr	r2, r1, #31
	rsb	r3, r3, r7, asr #3
	rsb	r2, r2, r5, asr #1
	lsl	r1, r1, #16
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r1, r1, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strh	r1, [r0, #18]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r3, [r0, #20]	@ movhi
	strh	r2, [r0, #22]	@ movhi
	bx	lr
.L89:
	ldr	r6, .L94+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L94+64
	mov	r0, #3
	mov	lr, pc
	bx	r6
	ldr	r3, .L94+68
	mov	r2, #100663296
	ldr	r1, .L94+72
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	ldr	r2, .L94+76
	ldr	r1, .L94+80
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #1376
	ldr	r2, .L94+84
	ldr	r1, .L94+88
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #4096
	ldr	r2, .L94+92
	ldr	r1, .L94+96
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L86
.L88:
	ldr	r6, .L94+4
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L94+100
	mov	lr, pc
	bx	r6
	mov	r0, r4
	ldr	r3, .L94+104
	mov	r2, #100663296
	ldr	r1, .L94+108
	mov	lr, pc
	bx	r6
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L94+76
	ldr	r1, .L94+112
	mov	lr, pc
	bx	r6
	mov	r0, r4
	mov	r3, #928
	ldr	r2, .L94+84
	ldr	r1, .L94+116
	mov	lr, pc
	bx	r6
	mov	r0, r4
	mov	r3, #4096
	ldr	r2, .L94+92
	ldr	r1, .L94+120
	mov	lr, pc
	bx	r6
	b	.L86
.L87:
	ldr	r6, .L94+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L94+124
	mov	r0, #3
	mov	lr, pc
	bx	r6
	ldr	r3, .L94+128
	mov	r2, #100663296
	ldr	r1, .L94+132
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	ldr	r2, .L94+76
	ldr	r1, .L94+136
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #1280
	ldr	r2, .L94+84
	ldr	r1, .L94+140
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #4096
	ldr	r2, .L94+92
	ldr	r1, .L94+144
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L86
.L95:
	.align	2
.L94:
	.word	currentLevel
	.word	DMANow
	.word	shadowOAM+800
	.word	timeRemaining
	.word	1717986919
	.word	ones
	.word	tens
	.word	enemyCount
	.word	16488
	.word	16504
	.word	enemies
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.word	levelOneBGPal
	.word	7584
	.word	levelOneBGTiles
	.word	100726784
	.word	levelOneBGMap
	.word	100679680
	.word	levelOneTiles
	.word	100716544
	.word	levelOneMap
	.word	levelThreeBGPal
	.word	7136
	.word	levelThreeBGTiles
	.word	levelThreeBGMap
	.word	levelThreeTiles
	.word	levelThreeMap
	.word	levelTwoBGPal
	.word	7008
	.word	levelTwoBGTiles
	.word	levelTwoBGMap
	.word	levelTwoTiles
	.word	levelTwoMap
	.size	drawGame, .-drawGame
	.align	2
	.global	fallable
	.syntax unified
	.arm
	.fpu softvfp
	.type	fallable, %function
fallable:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L114
	ldr	r3, [r3]
	cmp	r3, #1
	str	lr, [sp, #-4]!
	beq	.L110
	cmp	r3, #2
	beq	.L111
	cmp	r3, #3
	movne	r0, #1
	beq	.L112
.L96:
	ldr	lr, [sp], #4
	bx	lr
.L111:
	ldr	r2, .L114+4
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #16]
	add	r3, r3, r1
	cmp	r3, #496
	bge	.L105
	add	r3, r3, #1
	ldr	lr, [r2, #12]
	lsl	r3, r3, #9
	add	r1, r3, lr
	ldr	ip, .L114+8
	lsl	r1, r1, #1
	ldrh	r0, [ip, r1]
	cmp	r0, #0
	bne	.L109
	b	.L96
.L110:
	ldr	r2, .L114+4
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #16]
	add	r3, r3, r1
	cmp	r3, #496
	blt	.L113
.L105:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L113:
	add	r3, r3, #1
	ldr	lr, [r2, #12]
	lsl	r3, r3, #9
	add	r1, r3, lr
	ldr	ip, .L114+12
	lsl	r1, r1, #1
	ldrh	r0, [ip, r1]
	cmp	r0, #0
	beq	.L96
.L109:
	ldr	r2, [r2, #20]
	add	r3, r3, r2
	add	r3, r3, lr
	add	r3, ip, r3, lsl #1
	ldrh	r0, [r3, #-2]
	adds	r0, r0, #0
	movne	r0, #1
	ldr	lr, [sp], #4
	bx	lr
.L112:
	ldr	r2, .L114+4
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #16]
	add	r3, r3, r1
	cmp	r3, #496
	bge	.L105
	add	r3, r3, #1
	ldr	lr, [r2, #12]
	lsl	r3, r3, #9
	add	r1, r3, lr
	ldr	ip, .L114+16
	lsl	r1, r1, #1
	ldrh	r0, [ip, r1]
	cmp	r0, #0
	beq	.L96
	b	.L109
.L115:
	.align	2
.L114:
	.word	currentLevel
	.word	player
	.word	levelTwoCollisionBitmap
	.word	levelOneCollisionBitmap
	.word	levelThreeCollisionBitmap
	.size	fallable, .-fallable
	.align	2
	.global	fallPartially
	.syntax unified
	.arm
	.fpu softvfp
	.type	fallPartially, %function
fallPartially:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	subs	lr, r0, #0
	ble	.L122
	ldr	ip, .L136
	ldr	r3, [ip, #12]
	ldr	r2, [ip, #20]
	ldr	r1, [ip, #8]
	ldr	ip, [ip, #16]
	add	r2, r3, r2
	add	r1, r1, ip
	add	r1, r1, lr
	sub	r2, r2, #512
	add	r3, r3, #-2147483648
	lsl	r1, r1, #9
	ldr	ip, .L136+4
	sub	r2, r2, #-2147483647
	sub	r3, r3, #512
	add	r2, r2, r1
	add	r3, r3, r1
	mov	r0, lr
	ldr	r1, [ip]
	ldr	r5, .L136+8
	ldr	r4, .L136+12
	ldr	lr, .L136+16
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	b	.L121
.L118:
	cmp	r1, #2
	beq	.L134
	cmp	r1, #3
	beq	.L135
.L119:
	subs	r0, r0, #1
	sub	r2, r2, #1024
	sub	r3, r3, #1024
	beq	.L116
.L121:
	cmp	r1, #1
	bne	.L118
	ldrh	ip, [r3, lr]
	cmp	ip, #0
	beq	.L119
	ldrh	ip, [r2, lr]
	cmp	ip, #0
	beq	.L119
.L116:
	pop	{r4, r5, lr}
	bx	lr
.L134:
	ldrh	ip, [r3, r4]
	cmp	ip, #0
	beq	.L119
	ldrh	ip, [r2, r4]
	cmp	ip, #0
	beq	.L119
	b	.L116
.L135:
	ldrh	ip, [r3, r5]
	cmp	ip, #0
	beq	.L119
	ldrh	ip, [r2, r5]
	cmp	ip, #0
	beq	.L119
	b	.L116
.L122:
	mov	r0, #0
	b	.L116
.L137:
	.align	2
.L136:
	.word	player
	.word	currentLevel
	.word	levelThreeCollisionBitmap
	.word	levelTwoCollisionBitmap
	.word	levelOneCollisionBitmap
	.size	fallPartially, .-fallPartially
	.align	2
	.global	leftMoveable
	.syntax unified
	.arm
	.fpu softvfp
	.type	leftMoveable, %function
leftMoveable:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L156
	ldr	r3, [r3]
	cmp	r3, #1
	str	lr, [sp, #-4]!
	beq	.L153
	cmp	r3, #2
	beq	.L154
	cmp	r3, #3
	movne	r0, #1
	beq	.L155
.L138:
	ldr	lr, [sp], #4
	bx	lr
.L154:
	ldr	r1, .L156+4
	ldr	r3, [r1, #12]
	ldr	lr, [r1, #8]
	add	r3, r3, #8
	add	r2, r3, lr, lsl #9
	ldr	ip, .L156+8
	lsl	r2, r2, #1
	ldrh	r0, [ip, r2]
	cmp	r0, #0
	beq	.L138
.L152:
	ldr	r1, [r1, #16]
	add	r2, lr, r1
	sub	r2, r2, #1
	add	r2, r3, r2, lsl #9
	lsl	r2, r2, #1
	ldrh	r0, [ip, r2]
	cmp	r0, #0
	beq	.L138
	add	r1, r1, r1, lsr #31
	add	r2, lr, r1, asr #1
	add	r3, r3, r2, lsl #9
	lsl	r3, r3, #1
	ldrh	r0, [ip, r3]
	adds	r0, r0, #0
	movne	r0, #1
	ldr	lr, [sp], #4
	bx	lr
.L153:
	ldr	r1, .L156+4
	ldr	r3, [r1, #12]
	ldr	lr, [r1, #8]
	add	r3, r3, #8
	add	r2, r3, lr, lsl #9
	ldr	ip, .L156+12
	lsl	r2, r2, #1
	ldrh	r0, [ip, r2]
	cmp	r0, #0
	bne	.L152
	b	.L138
.L155:
	ldr	r1, .L156+4
	ldr	r3, [r1, #12]
	ldr	ip, [r1, #8]
	add	r3, r3, #8
	add	r2, r3, ip, lsl #9
	ldr	lr, .L156+16
	lsl	r2, r2, #1
	ldrh	r0, [lr, r2]
	cmp	r0, #0
	beq	.L138
	ldr	r1, [r1, #16]
	add	r2, ip, r1
	sub	r2, r2, #1
	add	r2, r3, r2, lsl #9
	lsl	r2, r2, #1
	ldrh	r0, [lr, r2]
	cmp	r0, #0
	beq	.L138
	add	r1, r1, r1, lsr #31
	add	ip, ip, r1, asr #1
	add	r3, r3, ip, lsl #9
	lsl	r3, r3, #1
	ldrh	r0, [lr, r3]
	adds	r0, r0, #0
	movne	r0, #1
	b	.L138
.L157:
	.align	2
.L156:
	.word	currentLevel
	.word	player
	.word	levelTwoCollisionBitmap
	.word	levelOneCollisionBitmap
	.word	levelThreeCollisionBitmap
	.size	leftMoveable, .-leftMoveable
	.align	2
	.global	rightMoveable
	.syntax unified
	.arm
	.fpu softvfp
	.type	rightMoveable, %function
rightMoveable:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L176
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, lr}
	beq	.L173
	cmp	r3, #2
	beq	.L174
	cmp	r3, #3
	movne	r0, #1
	beq	.L175
.L158:
	pop	{r4, lr}
	bx	lr
.L174:
	ldr	r1, .L176+4
	ldr	r3, [r1, #12]
	ldr	lr, [r1, #20]
	ldr	r4, [r1, #8]
	add	r2, r3, lr
	add	r2, r2, #8
	add	r0, r2, r4, lsl #9
	ldr	ip, .L176+8
	lsl	r0, r0, #1
	ldrh	r0, [ip, r0]
	cmp	r0, #0
	beq	.L158
.L172:
	ldr	r1, [r1, #16]
	add	r0, r4, r1
	sub	r0, r0, #1
	add	r3, r3, r0, lsl #9
	add	r3, r3, lr
	add	r3, ip, r3, lsl #1
	ldrh	r0, [r3, #16]
	cmp	r0, #0
	beq	.L158
	add	r1, r1, r1, lsr #31
	add	r3, r4, r1, asr #1
	add	r2, r2, r3, lsl #9
	lsl	r2, r2, #1
	ldrh	r0, [ip, r2]
	adds	r0, r0, #0
	movne	r0, #1
	pop	{r4, lr}
	bx	lr
.L173:
	ldr	r1, .L176+4
	ldr	r3, [r1, #12]
	ldr	lr, [r1, #20]
	ldr	r4, [r1, #8]
	add	r2, r3, lr
	add	r2, r2, #8
	add	r0, r2, r4, lsl #9
	ldr	ip, .L176+12
	lsl	r0, r0, #1
	ldrh	r0, [ip, r0]
	cmp	r0, #0
	bne	.L172
	b	.L158
.L175:
	ldr	r1, .L176+4
	ldr	r3, [r1, #12]
	ldr	r4, [r1, #20]
	ldr	ip, [r1, #8]
	add	r2, r3, r4
	add	r2, r2, #8
	add	r0, r2, ip, lsl #9
	ldr	lr, .L176+16
	lsl	r0, r0, #1
	ldrh	r0, [lr, r0]
	cmp	r0, #0
	beq	.L158
	ldr	r1, [r1, #16]
	add	r0, ip, r1
	sub	r0, r0, #1
	add	r3, r3, r0, lsl #9
	add	r3, r3, r4
	add	r3, lr, r3, lsl #1
	ldrh	r0, [r3, #16]
	cmp	r0, #0
	beq	.L158
	add	r1, r1, r1, lsr #31
	add	ip, ip, r1, asr #1
	add	r2, r2, ip, lsl #9
	lsl	r2, r2, #1
	ldrh	r0, [lr, r2]
	adds	r0, r0, #0
	movne	r0, #1
	b	.L158
.L177:
	.align	2
.L176:
	.word	currentLevel
	.word	player
	.word	levelTwoCollisionBitmap
	.word	levelOneCollisionBitmap
	.word	levelThreeCollisionBitmap
	.size	rightMoveable, .-rightMoveable
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L235
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #20
	ble	.L234
	mov	r6, #0
	ldr	r4, .L235+4
	ldr	r5, .L235+8
	ldr	r8, .L235+12
	ldr	r9, .L235+16
	ldr	fp, .L235+20
	ldr	r10, .L235+24
.L181:
	ldr	lr, [r4, #12]
	ldr	r0, [r4, #4]
	add	r1, lr, lr, lsr #31
	add	lr, lr, #5
	str	lr, [sp, #12]
	ldr	r3, [r5, #20]
	sub	r1, r0, r1, asr #1
	ldr	lr, [r4, #8]
	ldr	ip, [r5, #12]
	str	r1, [sp, #4]
	add	r1, r3, r3, lsr #31
	sub	r1, ip, r1, asr #1
	ldr	ip, [r4]
	add	r3, r3, #10
	ldr	r2, [r5, #16]
	ldr	r0, [r5, #8]
	str	lr, [sp, #8]
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldr	r3, [r7]
	add	r6, r6, #1
	beq	.L180
	ldrh	r2, [r9]
	tst	r2, #2
	beq	.L180
	ldrh	r2, [fp]
	ands	r2, r2, #2
	bne	.L180
	mov	r0, #1
	ldr	r1, [r10]
	sub	r1, r1, #1
	str	r0, [r4, #20]
	str	r2, [r4, #32]
	str	r1, [r10]
.L180:
	cmp	r3, r6
	add	r4, r4, #40
	bgt	.L181
.L179:
	ldrh	r6, [r9]
	tst	r6, #1
	ldr	r3, [r5, #24]
	beq	.L182
	ldr	r2, .L235+20
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L182
	cmp	r3, #0
	bne	.L186
	ldr	r4, [r5, #28]
	cmp	r4, #0
	bne	.L184
	mov	r2, #1
	mov	r3, #20
	str	r2, [r5, #28]
	mvn	r4, #6
	b	.L200
.L182:
	cmp	r3, #0
	bne	.L186
	ldr	r4, [r5, #28]
	cmp	r4, #0
	ldr	r7, [r5, #8]
	bne	.L187
	bl	fallable
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r5, #28]
.L189:
	ldr	r3, .L235+28
	ldr	r4, [r3]
	cmp	r4, #0
	ldr	r2, [r5]
	ble	.L191
	cmp	r2, #20
	suble	r4, r4, #5
	strle	r4, [r3]
	ble	.L193
	cmp	r4, #352
	blt	.L191
.L193:
	tst	r6, #32
	beq	.L194
	ldr	r3, .L235+20
	ldrh	r3, [r3]
	tst	r3, #32
	moveq	r3, #1
	streq	r3, [r5, #48]
	beq	.L195
.L194:
	tst	r6, #16
	beq	.L195
	ldr	r3, .L235+20
	ldrh	r3, [r3]
	ands	r3, r3, #16
	streq	r3, [r5, #48]
.L195:
	ldr	r3, .L235+32
	ldrh	r3, [r3, #48]
	ldr	r9, .L235+36
	tst	r3, #32
	ldr	r8, [r9]
	ldr	r6, [r5, #12]
	bne	.L196
	cmp	r6, #0
	ble	.L196
	bl	leftMoveable
	cmp	r0, #0
	beq	.L196
	cmp	r8, #0
	ble	.L197
	ldr	r3, [r5, #4]
	cmp	r3, #80
	suble	r8, r8, #2
	strle	r8, [r9]
.L197:
	sub	r6, r6, #2
	str	r6, [r5, #12]
.L196:
	ldr	r3, .L235+32
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L198
	ldr	r3, [r5, #20]
	add	r3, r6, r3
	cmp	r3, #512
	bge	.L198
	bl	rightMoveable
	cmp	r0, #0
	beq	.L198
	cmp	r8, #272
	bge	.L199
	ldr	r3, [r5, #4]
	cmp	r3, #79
	addgt	r8, r8, #2
	strgt	r8, [r9]
.L199:
	add	r6, r6, #2
	str	r6, [r5, #12]
.L198:
	sub	r4, r7, r4
	sub	r6, r6, r8
	stm	r5, {r4, r6}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L186:
	ldr	r2, .L235+40
	smull	r0, r1, r3, r2
	rsb	r4, r1, r3, asr #31
	sub	r3, r3, #1
.L200:
	ldr	r2, [r5, #8]
	add	r7, r4, r2
	str	r3, [r5, #24]
	str	r7, [r5, #8]
	b	.L189
.L191:
	cmp	r2, #79
	addgt	r4, r4, #5
	strgt	r4, [r3]
	b	.L193
.L184:
	ldr	r7, [r5, #8]
.L187:
	ldr	r3, [r5, #16]
	rsb	r3, r3, #496
	cmp	r3, r7
	movle	r8, #1
	ble	.L190
	bl	fallable
	cmp	r0, #0
	add	r8, r4, #1
	beq	.L190
	ldr	r1, .L235+40
	smull	r2, r3, r4, r1
	sub	r0, r3, r4, asr #31
	bl	fallPartially
	add	r7, r7, r0
	str	r7, [r5, #8]
.L190:
	str	r8, [r5, #28]
	bl	fallable
	cmp	r0, #0
	streq	r0, [r5, #28]
	b	.L189
.L234:
	ldr	r5, .L235+8
	ldr	r9, .L235+16
	b	.L179
.L236:
	.align	2
.L235:
	.word	enemyCount
	.word	enemies
	.word	player
	.word	collision
	.word	oldButtons
	.word	buttons
	.word	enemiesRemaining
	.word	vOff
	.word	67109120
	.word	hOff
	.word	1431655766
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L248
	ldr	r3, [r3]
	bic	r3, r3, #2
	cmp	r3, #1
	push	{r4, lr}
	bne	.L247
.L238:
	bl	updatePlayer
	ldr	r3, .L248+4
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L237
	ldr	r1, .L248+8
	ldr	r3, [r1]
	add	r3, r3, #1
	cmp	r3, #59
	ldrgt	r0, .L248+12
	ldrgt	r3, [r0]
	subgt	r3, r3, #1
	strle	r3, [r1]
	strgt	r2, [r1]
	strgt	r3, [r0]
.L237:
	pop	{r4, lr}
	bx	lr
.L247:
	bl	updateEnemy.part.1
	b	.L238
.L249:
	.align	2
.L248:
	.word	currentLevel
	.word	cheat
	.word	frameCounter
	.word	timeRemaining
	.size	updateGame, .-updateGame
	.align	2
	.global	initTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTime, %function
initTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #60
	mov	r2, #0
	ldr	r1, .L251
	ldr	r3, .L251+4
	str	r0, [r1]
	str	r2, [r3]
	bx	lr
.L252:
	.align	2
.L251:
	.word	timeRemaining
	.word	frameCounter
	.size	initTime, .-initTime
	.align	2
	.global	updateTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTime, %function
updateTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L256
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #59
	movgt	r0, #0
	ldrgt	r1, .L256+4
	ldrgt	r3, [r1]
	subgt	r3, r3, #1
	strle	r3, [r2]
	strgt	r3, [r1]
	strgt	r0, [r2]
	bx	lr
.L257:
	.align	2
.L256:
	.word	frameCounter
	.word	timeRemaining
	.size	updateTime, .-updateTime
	.align	2
	.global	drawTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTime, %function
drawTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #5
	ldr	r3, .L260
	ldr	r2, .L260+4
	ldr	r3, [r3]
	smull	r0, r1, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r1, r2, r2, lsl #2
	push	{r4, lr}
	sub	r1, r3, r1, lsl #1
	ldr	lr, .L260+8
	ldr	r3, .L260+12
	add	r0, r1, #4
	lsl	r0, r0, #1
	str	r1, [lr]
	ldr	r4, .L260+16
	add	r1, r3, #812
	strh	r0, [r1]	@ movhi
	add	r1, r2, #4
	ldr	lr, .L260+20
	str	r2, [r4]
	lsl	r1, r1, #1
	add	r2, r3, #804
	ldr	r0, .L260+24
	strh	r1, [r2]	@ movhi
	add	r2, r3, #800
	add	r3, r3, #808
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L261:
	.align	2
.L260:
	.word	timeRemaining
	.word	1717986919
	.word	ones
	.word	shadowOAM
	.word	tens
	.word	16488
	.word	16504
	.size	drawTime, .-drawTime
	.comm	shadowOAM,1024,4
	.comm	enemyCount,4,4
	.comm	frameCounter,4,4
	.comm	ones,4,4
	.comm	tens,4,4
	.comm	timeRemaining,4,4
	.comm	enemiesRemaining,4,4
	.comm	enemies,200,4
	.comm	player,52,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
