	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #1024
	add	r3, r3, #3
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L2
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	waitForVBlank
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r0, #31744
	sub	sp, sp, #8
	ldr	r3, .L5
	mov	lr, pc
	bx	r3
	ldr	r6, .L5+4
	mov	r0, #20
	mov	r1, #10
	ldr	r2, .L5+8
	mov	r3, #992
	mov	lr, pc
	bx	r6
	mov	r3, #992
	mov	r0, #30
	mov	r1, #10
	ldr	r2, .L5+12
	mov	r5, r3
	ldr	r4, .L5+16
	mov	lr, pc
	bx	r6
	mov	r0, #80
	mov	r1, #100
	mov	r2, #8
	mov	r3, #6
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r0, #81
	mov	r1, #97
	mov	r2, #2
	mov	r3, #3
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r2, #2
	mov	r3, r2
	mov	r0, #79
	mov	r1, #97
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r0, #81
	mov	r1, #106
	mov	r2, #2
	mov	r3, #3
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r2, #2
	mov	r3, r2
	mov	r0, #79
	mov	r1, #107
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r2, #3
	mov	r3, r2
	mov	r0, #85
	mov	r1, #97
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r0, #84
	mov	r1, #97
	mov	r2, #1
	mov	r3, #2
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r2, #3
	mov	r3, r2
	mov	r0, #85
	mov	r1, #106
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mov	r3, #2
	mov	r0, #84
	mov	r1, #107
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L5+20
	mov	r2, #0
	str	r2, [r3, #0]
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.word	.LC1
	.word	drawRect
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r0, #0
	sub	sp, sp, #8
	ldr	r3, .L8
	ldr	r6, .L8+4
	mov	lr, pc
	bx	r3
	mov	r0, #10
	mov	r1, #2
	ldr	r2, .L8+8
	mov	r3, #992
	mov	lr, pc
	bx	r6
	mov	r0, #25
	mov	r1, #8
	ldr	r2, .L8+12
	mov	r3, #992
	mov	lr, pc
	bx	r6
	mov	r0, #40
	mov	r1, #16
	ldr	r2, .L8+16
	mov	r3, #992
	mov	lr, pc
	bx	r6
	mov	r0, #55
	mov	r1, #10
	ldr	r2, .L8+20
	mov	r3, #992
	mov	lr, pc
	bx	r6
	mov	r0, #70
	mov	r1, #16
	ldr	r2, .L8+24
	mov	r3, #992
	mov	lr, pc
	bx	r6
	mov	r0, #85
	mov	r1, #50
	ldr	r2, .L8+28
	mov	r3, #992
	mov	lr, pc
	bx	r6
	mov	r0, #100
	mov	r1, #25
	ldr	r2, .L8+32
	mov	r3, #992
	mov	lr, pc
	bx	r6
	mov	r0, #120
	mov	r4, #992
	ldr	r5, .L8+36
	mov	r1, r0
	mov	r2, #8
	mov	r3, #6
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	mov	r0, #121
	mov	r1, #117
	mov	r2, #2
	mov	r3, #3
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	mov	r2, #2
	mov	r3, r2
	mov	r0, #119
	mov	r1, #117
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	mov	r0, #121
	mov	r1, #126
	mov	r2, #2
	mov	r3, #3
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	mov	r2, #2
	mov	r3, r2
	mov	r0, #119
	mov	r1, #127
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	mov	r2, #3
	mov	r3, r2
	mov	r0, #125
	mov	r1, #117
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	mov	r0, #124
	mov	r1, #117
	mov	r2, #1
	mov	r3, #2
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	mov	r2, #3
	mov	r3, r2
	mov	r0, #125
	mov	r1, #126
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	mov	r0, #124
	mov	r1, #127
	mov	r2, #1
	mov	r3, #2
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	ldr	r2, .L8+40
	mov	r3, r4
	mov	r0, #150
	mov	r1, #40
	mov	lr, pc
	bx	r6
	ldr	r3, .L8+44
	mov	r2, #1
	str	r2, [r3, #0]
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	fillScreen
	.word	drawString
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	drawRect
	.word	.LC9
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r6, #32512
	sub	sp, sp, #8
	mov	r0, #0
	ldr	r3, .L14
	add	r6, r6, #255
	mov	lr, pc
	bx	r3
	ldr	r4, .L14+4
	mov	r0, #20
	mov	r1, #0
	mov	r2, #5
	mov	r3, #240
	str	r6, [sp, #0]
	mov	r5, #1020
	mov	lr, pc
	bx	r4
	add	r5, r5, #3
	mov	r0, #130
	mov	r1, #0
	mov	r2, #6
	mov	r3, #240
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r0, #73
	mov	r1, #0
	mov	r2, #4
	mov	r3, #240
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r0, #79
	mov	r1, #0
	mov	r2, #4
	mov	r3, #240
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	ip, #324
	add	ip, ip, #1
	mov	r0, #136
	mov	r1, #0
	mov	r2, #23
	mov	r3, #240
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	ip, #31744
	mov	r1, r0
	mov	r2, #20
	mov	r3, #240
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	r2, .L14+8
	mov	r4, #6
	mov	ip, #9
	mov	r0, #2
	ldr	r1, .L14+12
	str	r4, [r2, #16]
	str	ip, [r2, #20]
	str	r0, [r2, #24]
	str	r4, [r2, #48]
	str	ip, [r2, #52]
	str	r0, [r2, #56]
	str	r4, [r2, #80]
	str	ip, [r2, #84]
	str	r0, [r2, #88]
	mov	r3, r1
	add	r5, r1, #128
.L11:
	str	r4, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	add	r3, r3, #32
	cmp	r3, r5
	bne	.L11
	mov	r4, #660
	add	r4, r4, #3
	strh	r4, [r1, #28]	@ movhi
	mov	r5, #17408
	mov	r4, #90
	mov	ip, #32512
	add	r5, r5, #236
	add	ip, ip, #224
	str	r4, [r1, #32]
	mvn	r4, #48128
	strh	r4, [r1, #60]	@ movhi
	strh	ip, [r1, #92]	@ movhi
	mov	r4, #115
	mov	ip, #125
	mov	r0, #31744
	strh	r5, [r2, #92]	@ movhi
	mov	r5, #85
	ldr	r3, .L14+16
	mov	r7, #140
	str	r5, [r1, #0]
	str	r4, [r1, #64]
	str	ip, [r1, #96]
	add	r0, r0, #31
	mov	r5, #5
	mov	r4, #185
	mov	ip, #65
	str	r5, [r1, #4]
	str	r7, [r1, #36]
	str	r4, [r1, #68]
	str	ip, [r1, #100]
	strh	r0, [r1, #124]	@ movhi
	mov	r1, #7
	str	r1, [r3, #16]
	mov	r1, #12
	mov	r6, #1
	str	r1, [r3, #20]
	mov	r1, #120
	str	r7, [r3, #0]
	mov	r8, #30
	str	r1, [r3, #4]
	str	r6, [r3, #24]
	str	r6, [r3, #28]
	ldr	r3, .L14+20
	mov	r1, #3
	str	r8, [r2, #0]
	mov	r8, #220
	str	r1, [r3, #0]
	str	r8, [r2, #4]
	ldr	r3, .L14+24
	mov	r8, #50
	str	r8, [r2, #32]
	mov	r1, #0
	mov	r8, #100
	str	r8, [r2, #36]
	str	r1, [r3, #0]
	mov	r8, #60
	mov	r3, #31744	@ movhi
	str	r8, [r2, #64]
	strh	r3, [r2, #28]	@ movhi
	mov	r8, #200
	mov	r3, #31	@ movhi
	str	r8, [r2, #68]
	strh	r3, [r2, #60]	@ movhi
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	fillScreen
	.word	drawRect
	.word	leftCars
	.word	rightCars
	.word	player
	.word	life
	.word	oldLife
	.size	initializeGame, .-initializeGame
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	initializeGame
	ldr	r3, .L17
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	updateInstructions
	.type	updateInstructions, %function
updateInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L21
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L21+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L22:
	.align	2
.L21:
	.word	oldButtons
	.word	buttons
	.size	updateInstructions, .-updateInstructions
	.align	2
	.global	updateStart
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L28
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L24
	ldr	r2, .L28+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L26
.L24:
	tst	r3, #4
	beq	.L23
	ldr	r3, .L28+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L27
.L23:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L27:
	ldmfd	sp!, {r4, lr}
	b	goToInstructions
.L26:
	bl	goToGame
	ldr	r3, [r4, #0]
	b	.L24
.L29:
	.align	2
.L28:
	.word	oldButtons
	.word	buttons
	.size	updateStart, .-updateStart
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L33
	ldr	r4, .L33+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L33+8
	mov	lr, pc
	bx	r4
	ldr	r6, .L33+12
	ldr	r0, .L33+16
	ldr	r5, .L33+20
	mov	lr, pc
	bx	r4
	mov	r4, #0
.L31:
	add	r0, r6, r4, asl #5
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #4
	bne	.L31
	ldr	r0, .L33+24
	ldr	r3, .L33+28
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	leftCars
	.word	updateLeftCar
	.word	leftCars+32
	.word	rightCars
	.word	leftCars+64
	.word	updateRightCar
	.word	player
	.word	updateFrogger
	.size	update, .-update
	.align	2
	.global	drawLives
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L37
	ldr	r4, .L37+4
	ldr	r2, [r5, #0]
	ldr	r3, [r4, #0]
	cmp	r3, r2
	beq	.L35
	ldr	r1, .L37+8
	ldr	r3, .L37+12
	ldr	r0, .L37+16
	mov	lr, pc
	bx	r3
	mov	r3, #32512
	add	r3, r3, #255
	mov	r0, #10
	mov	r1, #12
	ldr	r2, .L37+16
	ldr	ip, .L37+20
	mov	lr, pc
	bx	ip
	ldr	r3, [r5, #0]
	str	r3, [r4, #0]
.L35:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	life
	.word	oldLife
	.word	.LC10
	.word	sprintf
	.word	lifeBuffer
	.word	drawString
	.size	drawLives, .-drawLives
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L42
	ldr	r4, .L42+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L42+8
	mov	lr, pc
	bx	r4
	ldr	r6, .L42+12
	ldr	r0, .L42+16
	ldr	r5, .L42+20
	mov	lr, pc
	bx	r4
	mov	r4, #0
.L40:
	add	r0, r6, r4, asl #5
	add	r4, r4, #1
	mov	lr, pc
	bx	r5
	cmp	r4, #4
	bne	.L40
	ldr	r0, .L42+24
	ldr	r3, .L42+28
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, lr}
	b	drawLives
.L43:
	.align	2
.L42:
	.word	leftCars
	.word	drawLeftCar
	.word	leftCars+32
	.word	rightCars
	.word	leftCars+64
	.word	drawRightCar
	.word	player
	.word	drawFrogger
	.size	draw, .-draw
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #660
	ldr	r2, .L45
	add	r3, r3, #3
	mov	r0, #148
	mov	r1, #10
	ldr	ip, .L45+4
	mov	lr, pc
	bx	ip
	ldr	r3, .L45+8
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LC11
	.word	drawString
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r3, .L50
	sub	sp, sp, #12
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L47
	ldr	r3, .L50+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L49
.L47:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L49:
	ldr	lr, .L50+8
	mov	ip, #324
	str	r4, [lr, #0]
	add	ip, ip, #1
	mov	r0, #136
	mov	r1, r4
	mov	r2, #23
	mov	r3, #240
	ldr	r5, .L50+12
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	mov	r2, #20
	mov	r3, #240
	mov	ip, #31744
	mov	r0, r4
	mov	r1, r4
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	bl	drawLives
	ldr	r3, .L50+16
	mov	r2, #2
	str	r2, [r3, #0]
	b	.L47
.L51:
	.align	2
.L50:
	.word	oldButtons
	.word	buttons
	.word	oldLife
	.word	drawRect
	.word	state
	.size	updatePause, .-updatePause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r4, #660
	mov	r0, #992
	add	r4, r4, #3
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	ldr	r5, .L53+4
	mov	r0, #55
	mov	r1, #40
	ldr	r2, .L53+8
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldr	r2, .L53+12
	mov	r3, r4
	mov	r0, #65
	mov	r1, #40
	mov	lr, pc
	bx	r5
	ldr	r3, .L53+16
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	fillScreen
	.word	drawString
	.word	.LC12
	.word	.LC13
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L57
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L57+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L58:
	.align	2
.L57:
	.word	oldButtons
	.word	buttons
	.size	updateWin, .-updateWin
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r4, #660
	mov	r0, #31
	add	r4, r4, #3
	ldr	r3, .L60
	mov	lr, pc
	bx	r3
	ldr	r5, .L60+4
	mov	r0, #55
	mov	r1, #40
	ldr	r2, .L60+8
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldr	r2, .L60+12
	mov	r3, r4
	mov	r0, #65
	mov	r1, #40
	mov	lr, pc
	bx	r5
	ldr	r3, .L60+16
	mov	r2, #5
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	fillScreen
	.word	drawString
	.word	.LC14
	.word	.LC13
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L78
	sub	sp, sp, #20
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L63
	ldr	r3, .L78+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L73
.L63:
	ldr	r5, .L78+8
	bl	update
	ldr	r3, .L78+12
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, [r5, #0]
	ldr	r2, [r5, #16]
	add	r2, r3, r2
	cmp	r2, #19
	bgt	.L64
	ldr	r2, .L78+16
	ldr	r2, [r2, #0]
	cmp	r2, #0
	ble	.L64
	bl	goToWin
	ldr	r3, [r5, #0]
.L64:
	ldr	r4, .L78+20
	mov	fp, #324
	mov	r8, #32512
	mov	sl, #1020
	ldr	r7, .L78+8
	add	r6, r4, #96
	add	fp, fp, #1
	add	r8, r8, #255
	add	sl, sl, #3
.L68:
	ldr	r2, [r4, #0]
	ldr	r0, [r4, #16]
	sub	r1, r3, #1
	add	r0, r2, r0
	cmp	r1, r0
	bgt	.L65
	ldr	r0, [r4, #4]
	ldr	r9, [r4, #20]
	ldr	ip, [r5, #4]
	add	r9, r0, r9
	sub	ip, ip, #3
	cmp	ip, r9
	bgt	.L65
	ldr	r9, [r7, #16]
	add	r1, r1, r9
	cmp	r2, r1
	blt	.L74
.L65:
	add	r4, r4, #32
	cmp	r4, r6
	ldrne	r3, [r5, #0]
	bne	.L68
.L67:
	ldr	r4, .L78+24
	mov	r9, #324
	mov	r8, #32512
	mov	sl, #1020
	ldr	r7, .L78+8
	ldr	fp, .L78+28
	add	r6, r4, #128
	add	r9, r9, #1
	add	r8, r8, #255
	add	sl, sl, #3
.L72:
	ldr	r2, [r4, #0]
	ldr	r1, [r4, #16]
	sub	r3, r3, #1
	add	r1, r2, r1
	cmp	r3, r1
	bgt	.L69
	ldr	r1, [r4, #4]
	ldr	ip, [r4, #20]
	ldr	r0, [r5, #4]
	add	ip, r1, ip
	sub	r0, r0, #3
	cmp	r0, ip
	bgt	.L69
	ldr	ip, [r7, #16]
	add	r3, r3, ip
	cmp	r2, r3
	bge	.L69
	ldr	r3, [r7, #20]
	add	r0, r0, r3
	cmp	r1, r0
	ble	.L75
.L69:
	add	r4, r4, #32
	cmp	r4, r6
	ldrne	r3, [r5, #0]
	bne	.L72
.L62:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L74:
	ldr	r2, [r7, #20]
	add	ip, ip, r2
	cmp	r0, ip
	bgt	.L65
	ldr	r2, .L78+16
	ldr	ip, [r2, #0]
	ldr	lr, .L78+16
	sub	ip, ip, #1
	str	ip, [lr, #0]
	mov	r0, #136
	mov	r1, #0
	mov	r2, #23
	mov	r3, #240
	ldr	ip, .L78+28
	str	fp, [sp, #0]
	mov	lr, pc
	bx	ip
	mov	lr, #31744
	mov	r0, #0
	str	lr, [sp, #0]
	mov	r1, r0
	mov	r2, #20
	mov	r3, #240
	ldr	ip, .L78+28
	mov	lr, pc
	bx	ip
	mov	r0, #20
	mov	r1, #0
	mov	r2, #5
	mov	r3, #240
	ldr	ip, .L78+28
	str	r8, [sp, #0]
	mov	lr, pc
	bx	ip
	mov	r0, #130
	mov	r1, #0
	mov	r2, #6
	mov	r3, #240
	ldr	ip, .L78+28
	str	r8, [sp, #0]
	mov	lr, pc
	bx	ip
	mov	r1, #0
	mov	r9, r1
	mov	r0, #73
	mov	r2, #4
	mov	r3, #240
	ldr	ip, .L78+28
	str	sl, [sp, #0]
	mov	lr, pc
	bx	ip
	mov	r0, #79
	mov	r1, r9
	mov	r2, #4
	mov	r3, #240
	ldr	ip, .L78+28
	str	sl, [sp, #0]
	mov	lr, pc
	bx	ip
	mov	r1, r9
	mov	r0, #83
	mov	r2, #47
	mov	r3, #240
	ldr	ip, .L78+28
	str	r9, [sp, #0]
	mov	lr, pc
	bx	ip
	mov	r2, #48
	mov	r3, #240
	mov	r0, #25
	mov	r1, r9
	ldr	ip, .L78+28
	str	r9, [sp, #0]
	mov	lr, pc
	bx	ip
	bl	drawLives
	ldr	r2, .L78+16
	ldr	r3, [r2, #0]
	cmp	r3, r9
	beq	.L76
	mov	r3, #140
	str	r3, [r7, #0]
	mov	r3, #120
	str	r3, [r7, #4]
	mov	r3, #140
	b	.L65
.L73:
	bl	goToPause
	b	.L63
.L75:
	ldr	lr, .L78+16
	ldr	ip, [lr, #0]
	sub	ip, ip, #1
	str	ip, [lr, #0]
	mov	r0, #136
	mov	r1, #0
	mov	r2, #23
	mov	r3, #240
	str	r9, [sp, #0]
	mov	lr, pc
	bx	fp
	mov	ip, #31744
	mov	r0, #0
	str	ip, [sp, #0]
	mov	r1, r0
	mov	r2, #20
	mov	r3, #240
	mov	lr, pc
	bx	fp
	mov	r0, #20
	mov	r1, #0
	mov	r2, #5
	mov	r3, #240
	str	r8, [sp, #0]
	mov	lr, pc
	bx	fp
	mov	r0, #130
	mov	r1, #0
	mov	r2, #6
	mov	r3, #240
	str	r8, [sp, #0]
	mov	lr, pc
	bx	fp
	mov	r1, #0
	mov	r0, #73
	mov	r2, #4
	mov	r3, #240
	str	r1, [sp, #12]
	str	sl, [sp, #0]
	mov	lr, pc
	bx	fp
	mov	r0, #79
	mov	r1, #0
	mov	r2, #4
	mov	r3, #240
	str	sl, [sp, #0]
	mov	lr, pc
	bx	fp
	ldr	ip, [sp, #12]
	mov	r0, #83
	mov	r1, ip
	mov	r2, #47
	mov	r3, #240
	str	ip, [sp, #0]
	mov	lr, pc
	bx	fp
	ldr	ip, [sp, #12]
	mov	r2, #48
	mov	r3, #240
	mov	r0, #25
	mov	r1, ip
	str	ip, [sp, #0]
	mov	lr, pc
	bx	fp
	bl	drawLives
	ldr	r2, .L78+16
	ldr	r3, [r2, #0]
	cmp	r3, #0
	beq	.L77
	mov	r3, #140
	mov	ip, #120
	stmia	r7, {r3, ip}	@ phole stm
	b	.L69
.L77:
	bl	goToLose
	b	.L69
.L76:
	bl	goToLose
	ldr	r3, [r7, #0]
	b	.L65
.L79:
	.align	2
.L78:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	waitForVBlank
	.word	life
	.word	leftCars
	.word	rightCars
	.word	drawRect
	.size	updateGame, .-updateGame
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L82
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L82+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L83:
	.align	2
.L82:
	.word	oldButtons
	.word	buttons
	.size	updateLose, .-updateLose
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	initialize
	bl	goToStart
	ldr	r4, .L97
	ldr	r7, .L97+4
	ldr	r6, .L97+8
	mov	r5, #67108864
.L96:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L86:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L86
.L93:
	.word	.L87
	.word	.L88
	.word	.L89
	.word	.L90
	.word	.L91
	.word	.L92
.L92:
	bl	updateLose
	b	.L96
.L91:
	bl	updateWin
	b	.L96
.L90:
	bl	updatePause
	b	.L96
.L89:
	bl	updateGame
	b	.L96
.L88:
	bl	updateInstructions
	b	.L96
.L87:
	bl	updateStart
	b	.L96
.L98:
	.align	2
.L97:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.comm	leftCars,96,4
	.comm	rightCars,128,4
	.comm	player,36,4
	.comm	life,4,4
	.comm	oldLife,4,4
	.comm	lifeBuffer,41,4
	.comm	state,4,4
	.comm	buttons,4,4
	.comm	oldButtons,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"To Play, Press START\000"
	.space	3
.LC1:
	.ascii	"For Instructions, Press SELECT\000"
	.space	1
.LC2:
	.ascii	"To play: Use arrow keys to move frogger.\000"
	.space	3
.LC3:
	.ascii	"Cross the street without getting hit.\000"
	.space	2
.LC4:
	.ascii	"If you're hit 3 times, GAME OVER!\000"
	.space	2
.LC5:
	.ascii	"Must look both ways before crossing!\000"
	.space	3
.LC6:
	.ascii	"Therefore, cannot move sideways on\000"
	.space	1
.LC7:
	.ascii	"yellow lines in middle.\000"
.LC8:
	.ascii	"To Pause the game, press START!\000"
.LC9:
	.ascii	"Press START to Begin now.\000"
	.space	2
.LC10:
	.ascii	"Lives: %d\000"
	.space	2
.LC11:
	.ascii	"Your Paused! Press START to continue\000"
	.space	3
.LC12:
	.ascii	"YOU WIN! CONGRATS!!\000"
.LC13:
	.ascii	"PRESS START TO PLAY AGAIN!\000"
	.space	1
.LC14:
	.ascii	"YOU LOSE! TRY AGAIN!!\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"
