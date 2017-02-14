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
	.file	"game.c"
	.text
	.align	2
	.global	updateFrogger
	.type	updateFrogger, %function
updateFrogger:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #0]
	ldr	r1, [r0, #4]
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	mov	r2, #67108864
	ldr	ip, [r2, #304]
	tst	ip, #16
	beq	.L2
	ldr	ip, [r2, #304]
	tst	ip, #32
	bne	.L3
.L2:
	sub	r2, r3, #64
	cmp	r2, #15
	movls	r2, #0
	movhi	r2, #1
	cmp	r3, #123
	movgt	r2, #0
	cmp	r2, #0
	bxeq	lr
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L5
	ldr	r3, [r0, #20]
	rsb	r3, r3, #240
	cmp	r1, r3
	ldrlt	r3, [r0, #28]
	addlt	r1, r3, r1
	strlt	r1, [r0, #4]
.L5:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bxne	lr
	ldr	r3, [r0, #4]
	cmp	r3, #0
	ldrgt	r2, [r0, #28]
	rsbgt	r3, r2, r3
	strgt	r3, [r0, #4]
	bx	lr
.L3:
	ldr	r2, [r2, #304]
	tst	r2, #64
	bxne	lr
	cmp	r3, #0
	ldrgt	r2, [r0, #24]
	rsbgt	r3, r2, r3
	strgt	r3, [r0, #0]
	bx	lr
	.size	updateFrogger, .-updateFrogger
	.align	2
	.global	updateLeftCar
	.type	updateLeftCar, %function
updateLeftCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #24]
	ldr	r1, [r0, #0]
	rsb	r3, r3, r2
	cmp	r3, #0
	mov	r4, r0
	str	r1, [r0, #8]
	str	r2, [r0, #12]
	str	r3, [r0, #4]
	blt	.L10
.L8:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L10:
	ldr	r3, [r0, #20]
	rsb	r3, r3, #239
	ldr	r7, .L11
	str	r3, [r0, #4]
	mov	lr, pc
	bx	r7
	mov	r5, r0
	mov	lr, pc
	bx	r7
	mov	r6, r0
	mov	lr, pc
	bx	r7
	mov	r3, #-2080374781
	add	r3, r3, #2162688
	add	r3, r3, #2112
	smull	r2, r1, r3, r0
	smull	ip, r2, r3, r6
	smull	ip, r3, r5, r3
	add	r1, r1, r0
	mov	r7, r0, asr #31
	mov	ip, r6, asr #31
	add	r2, r2, r6
	rsb	r1, r7, r1, asr #4
	rsb	r2, ip, r2, asr #4
	add	r3, r3, r5
	mov	ip, r5, asr #31
	rsb	r1, r1, r1, asl #5
	rsb	r2, r2, r2, asl #5
	rsb	r0, r1, r0
	rsb	r3, ip, r3, asr #4
	rsb	r6, r2, r6
	mov	r0, r0, asl #10
	rsb	r3, r3, r3, asl #5
	orr	r6, r0, r6, asl #5
	rsb	r5, r3, r5
	orr	r5, r6, r5
	strh	r5, [r4, #28]	@ movhi
	b	.L8
.L12:
	.align	2
.L11:
	.word	rand
	.size	updateLeftCar, .-updateLeftCar
	.align	2
	.global	updateRightCar
	.type	updateRightCar, %function
updateRightCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #24]
	mov	r4, r0
	ldr	r0, [r0, #20]
	add	r3, r2, r3
	ldr	r1, [r4, #0]
	add	r0, r3, r0
	cmp	r0, #239
	str	r1, [r4, #8]
	str	r2, [r4, #12]
	str	r3, [r4, #4]
	ble	.L13
	mov	r3, #0
	ldr	r7, .L15
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r7
	mov	r5, r0
	mov	lr, pc
	bx	r7
	mov	r6, r0
	mov	lr, pc
	bx	r7
	mov	r3, #-2080374781
	add	r3, r3, #2162688
	add	r3, r3, #2112
	smull	r2, r1, r3, r0
	smull	ip, r2, r3, r6
	smull	ip, r3, r5, r3
	add	r1, r1, r0
	mov	r7, r0, asr #31
	mov	ip, r6, asr #31
	add	r2, r2, r6
	rsb	r1, r7, r1, asr #4
	rsb	r2, ip, r2, asr #4
	add	r3, r3, r5
	mov	ip, r5, asr #31
	rsb	r1, r1, r1, asl #5
	rsb	r2, r2, r2, asl #5
	rsb	r0, r1, r0
	rsb	r3, ip, r3, asr #4
	rsb	r6, r2, r6
	mov	r0, r0, asl #10
	rsb	r3, r3, r3, asl #5
	orr	r6, r0, r6, asl #5
	rsb	r5, r3, r5
	orr	r5, r6, r5
	strh	r5, [r4, #28]	@ movhi
.L13:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	rand
	.size	updateRightCar, .-updateRightCar
	.align	2
	.global	drawFrogger
	.type	drawFrogger, %function
drawFrogger:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r0
	sub	sp, sp, #8
	ldr	r0, [r0, #8]
	cmp	r0, #128
	bgt	.L29
	cmp	r0, #123
	bgt	.L27
	sub	r3, r0, #72
	cmp	r3, #3
	bls	.L28
	sub	r3, r0, #66
	cmp	r3, #3
	bls	.L28
	sub	r3, r0, #16
	cmp	r3, #1
	bls	.L27
	cmp	r0, #14
	ble	.L30
	ldr	r5, .L31
	mov	r6, #0
	ldr	r1, [r4, #12]
	mov	r2, #8
	mov	r3, #6
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	sub	r1, r1, #3
	mov	r2, #2
	mov	r3, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r2, #2
	mov	r3, r2
	sub	r0, r0, #1
	sub	r1, r1, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	add	r1, r1, #6
	mov	r2, #2
	mov	r3, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r2, #2
	mov	r3, r2
	sub	r0, r0, #1
	add	r1, r1, #7
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r2, #3
	mov	r3, r2
	add	r0, r0, #5
	sub	r1, r1, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #4
	sub	r1, r1, #3
	mov	r2, #1
	mov	r3, #2
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r2, #3
	mov	r3, r2
	add	r0, r0, #5
	add	r1, r1, #6
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #4
	add	r1, r1, #7
	mov	r2, #1
	mov	r3, #2
	str	r6, [sp, #0]
	mov	r6, #992
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r2, #8
	mov	r3, #6
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	sub	r1, r1, #3
	mov	r2, #2
	mov	r3, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r2, #2
	mov	r3, r2
	sub	r0, r0, #1
	sub	r1, r1, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	add	r1, r1, #6
	mov	r2, #2
	mov	r3, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r2, #2
	mov	r3, r2
	sub	r0, r0, #1
	add	r1, r1, #7
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r2, #3
	mov	r3, r2
	add	r0, r0, #5
	sub	r1, r1, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r0, r0, #4
	sub	r1, r1, #3
	mov	r2, #1
	mov	r3, #2
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r2, #3
	mov	r3, r2
	add	r0, r0, #5
	add	r1, r1, #6
.L25:
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r0, r0, #4
	add	r1, r1, #7
	mov	r2, #1
	mov	r3, #2
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L28:
	mov	r6, #1020
	ldr	r1, [r4, #12]
	ldr	r5, .L31
	add	r6, r6, #3
.L26:
	mov	r2, #8
	mov	r3, #6
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	sub	r1, r1, #3
	mov	r2, #2
	mov	r3, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r2, #2
	mov	r3, r2
	sub	r0, r0, #1
	sub	r1, r1, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	add	r1, r1, #6
	mov	r2, #2
	mov	r3, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r2, #2
	mov	r3, r2
	sub	r0, r0, #1
	add	r1, r1, #7
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r2, #3
	mov	r3, r2
	add	r0, r0, #5
	sub	r1, r1, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #4
	sub	r1, r1, #3
	mov	r2, #1
	mov	r3, #2
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r2, #3
	mov	r3, r2
	add	r0, r0, #5
	add	r1, r1, #6
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, #4
	add	r1, r1, #7
	mov	r2, #1
	mov	r3, #2
	str	r6, [sp, #0]
	mov	r6, #992
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r2, #8
	mov	r3, #6
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	sub	r1, r1, #3
	mov	r2, #2
	mov	r3, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r2, #2
	mov	r3, r2
	sub	r0, r0, #1
	sub	r1, r1, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r0, r0, #1
	add	r1, r1, #6
	mov	r2, #2
	mov	r3, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r2, #2
	mov	r3, r2
	sub	r0, r0, #1
	add	r1, r1, #7
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r2, #3
	mov	r3, r2
	add	r0, r0, #5
	sub	r1, r1, #3
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r0, r0, #4
	sub	r1, r1, #3
	mov	r2, #1
	mov	r3, #2
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r0, r1}	@ phole ldm
	mov	r2, #3
	add	r0, r0, #5
	add	r1, r1, #6
	mov	r3, r2
	b	.L25
.L29:
	mov	r6, #324
	ldr	r1, [r4, #12]
	ldr	r5, .L31
	add	r6, r6, #1
	b	.L26
.L27:
	mov	r6, #32512
	ldr	r1, [r4, #12]
	ldr	r5, .L31
	add	r6, r6, #255
	b	.L26
.L30:
	ldr	r1, [r4, #12]
	ldr	r5, .L31
	mov	r6, #31744
	b	.L26
.L32:
	.align	2
.L31:
	.word	drawRect
	.size	drawFrogger, .-drawFrogger
	.align	2
	.global	drawLeftCar
	.type	drawLeftCar, %function
drawLeftCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #12
	mov	ip, #0
	add	r1, r4, #12
	ldmia	r1, {r1, r2, r3}	@ phole ldm
	ldr	r0, [r0, #8]
	ldr	r5, .L34
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #28]
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r2, r4, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	drawRect
	.size	drawLeftCar, .-drawLeftCar
	.align	2
	.global	drawRightCar
	.type	drawRightCar, %function
drawRightCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #12
	mov	ip, #0
	add	r1, r4, #12
	ldmia	r1, {r1, r2, r3}	@ phole ldm
	ldr	r0, [r0, #8]
	ldr	r5, .L37
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #28]
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r2, r4, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	drawRect
	.size	drawRightCar, .-drawRightCar
	.ident	"GCC: (devkitARM release 31) 4.5.0"
