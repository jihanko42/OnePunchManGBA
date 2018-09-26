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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	str	lr, [sp, #-4]!
	ldr	lr, .L13
	add	r2, r0, r2
	rsb	ip, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [lr]
	add	ip, r1, ip, lsl #4
	sub	sp, sp, #12
	add	r1, r1, r0, lsl #4
	ldr	r0, [lr, #4]
	add	ip, r2, ip, lsl #1
	add	r1, r2, r1, lsl #1
	orr	r3, r3, #-2130706432
	add	r2, sp, #6
.L7:
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	add	r1, r1, #480
	cmp	r1, ip
	str	r3, [r0, #44]
	bne	.L7
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	cmp	r3, #0
	ldr	lr, [sp, #8]
	ble	.L15
	ldr	r4, .L20
	add	r3, r1, r3
	rsb	ip, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r4]
	add	ip, r2, ip, lsl #4
	add	r2, r2, r1, lsl #4
	add	ip, r3, ip, lsl #1
	ldr	r1, [r4, #4]
	add	r2, r3, r2, lsl #1
	orr	r4, lr, #-2147483648
	lsl	r3, lr, #1
.L17:
	str	r0, [r1, #36]
	str	r2, [r1, #40]
	add	r2, r2, #480
	cmp	r2, ip
	str	r4, [r1, #44]
	add	r0, r0, r3
	bne	.L17
.L15:
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	ldr	r1, .L24
	add	r2, sp, #8
	strh	r0, [r2, #-2]!	@ movhi
	ldm	r1, {r0, r3}
	ldr	r1, .L24+4
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L29
	add	r3, r1, r1, lsr #31
	asr	r3, r3, #1
	rsb	r0, r0, r0, lsl #4
	add	r0, r3, r0, lsl #3
	ldr	ip, [ip]
	lsl	r0, r0, #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	andne	r3, r3, #255
	biceq	r3, r3, #255
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r0]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #28
	ldrb	r7, [sp, #64]	@ zero_extendqisi2
	lsl	r8, r7, #24
	subs	r6, r2, #0
	orr	r2, r7, r8, lsr #16
	strh	r2, [sp, #22]	@ movhi
	ble	.L31
	ldr	r9, .L45
	add	r6, r0, r6
	add	r5, r1, r1, lsr #31
	add	lr, r1, #1
	add	r4, r3, r3, lsr #31
	asr	r5, r5, #1
	sub	ip, r3, #1
	rsb	r2, r0, r0, lsl #4
	add	lr, lr, lr, lsr #31
	asr	r4, r4, #1
	rsb	r6, r6, r6, lsl #4
	ldr	r10, [r9]
	add	ip, ip, r1
	add	r6, r5, r6, lsl #3
	add	r2, r5, r2, lsl #3
	rsb	fp, r5, r5, lsl #31
	rsb	r5, r5, lr, asr #1
	sub	lr, r4, #1
	ldr	r0, [r9, #4]
	orr	lr, lr, #-2130706432
	add	r9, ip, ip, lsr #31
	and	ip, ip, #1
	add	r2, r10, r2, lsl #1
	add	r6, r10, r6, lsl #1
	asr	r8, r8, #16
	lsl	fp, fp, #1
	lsl	r5, r5, #1
	str	lr, [sp, #8]
	orr	r4, r4, #-2130706432
	and	r1, r1, #1
	and	r3, r3, #1
	bic	r9, r9, #1
	str	ip, [sp, #4]
	add	r10, sp, #22
	str	r7, [sp, #12]
	b	.L38
.L44:
	mov	lr, r2
	ldrb	ip, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	orr	ip, r8, ip
	strh	ip, [lr], r5	@ movhi
	beq	.L34
	str	r10, [r0, #36]
	str	lr, [r0, #40]
	str	r4, [r0, #44]
.L35:
	add	r2, r2, #240
	cmp	r6, r2
	beq	.L31
.L38:
	cmp	r1, #0
	bne	.L44
	cmp	r3, #0
	str	r10, [r0, #36]
	str	r2, [r0, #40]
	str	r4, [r0, #44]
	beq	.L35
	ldr	ip, [sp, #4]
	add	lr, fp, r2
	cmp	ip, #0
	ldrh	ip, [lr, r9]
	ldreq	r7, [sp, #12]
	andne	ip, ip, #255
	biceq	ip, ip, #255
	add	r2, r2, #240
	orrne	ip, r8, ip
	orreq	ip, ip, r7
	cmp	r6, r2
	strh	ip, [lr, r9]	@ movhi
	bne	.L38
.L31:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L34:
	ldr	ip, [sp, #4]
	ldr	r7, [sp, #8]
	cmp	ip, #0
	add	ip, fp, r2
	str	r10, [r0, #36]
	str	lr, [r0, #40]
	ldrh	lr, [ip, r9]
	str	r7, [r0, #44]
	ldreq	r7, [sp, #12]
	andne	lr, lr, #255
	biceq	lr, lr, #255
	orrne	lr, r8, lr
	orreq	lr, lr, r7
	strh	lr, [ip, r9]	@ movhi
	b	.L35
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	ldr	r1, .L49
	add	r2, sp, #8
	orr	r0, r0, r0, lsl #8
	strh	r0, [r2, #-2]!	@ movhi
	ldm	r1, {r0, r3}
	ldr	r1, .L49+4
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L53
	str	lr, [sp, #-4]!
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip, #4]
	lsl	r0, r0, #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	ldr	lr, [sp], #4
	str	r3, [ip, #8]
	bx	lr
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L56:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L56
	mov	r2, #67108864
.L57:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L57
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L68
	mov	r1, #512
	mov	r3, r0
	add	r2, r0, #1024
.L62:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L62
	mov	r2, #67108864
.L63:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L63
	mov	r2, #67108864
.L64:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L64
	mov	r1, #117440512
	ldr	r3, .L68+4
	ldr	r2, .L68+8
	ldr	r3, [r3, #4]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L69:
	.align	2
.L68:
	.word	shadowOAM
	.word	.LANCHOR0
	.word	-2147483136
	.size	hideSprites, .-hideSprites
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #12]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r0
	ble	.L74
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, lr
	bgt	.L76
.L74:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L76:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #16]
	add	r2, r2, r0
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L74
	add	r0, r1, r3
	ldr	r3, [sp, #8]
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	flipPage, .-flipPage
	.global	dma
	.global	backBuffer
	.global	frontBuffer
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 47) 7.1.0"
