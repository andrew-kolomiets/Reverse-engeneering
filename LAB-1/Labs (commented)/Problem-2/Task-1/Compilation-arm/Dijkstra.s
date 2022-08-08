	.arch armv5t
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"Dijkstra.c"
	.text
	.align	2
	.global	minDistance
	.syntax unified
	.arm
	.fpu softvfp
	.type	minDistance, %function
minDistance:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mvn	r3, #-2147483648
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L4:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	eor	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	blt	.L3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
.L3:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #8
	ble	.L4
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	minDistance, .-minDistance
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Vertex Distance from Source\000"
	.align	2
.LC2:
	.ascii	"%d \011\011 %d\012\000"
	.text
	.align	2
	.global	printSolution
	.syntax unified
	.arm
	.fpu softvfp
	.type	printSolution, %function
printSolution:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, .L9
	bl	puts
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L7
.L8:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r1, [fp, #-8]
	ldr	r0, .L9+4
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L7:
	ldr	r3, [fp, #-8]
	cmp	r3, #8
	ble	.L8
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L10:
	.align	2
.L9:
	.word	.LC1
	.word	.LC2
	.size	printSolution, .-printSolution
	.section	.rodata
	.align	2
.LC3:
	.word	__stack_chk_guard
	.text
	.align	2
	.global	dijkstra
	.syntax unified
	.arm
	.fpu softvfp
	.type	dijkstra, %function
dijkstra:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #80
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	ldr	r3, .L20
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	mov	r3,#0
	mov	r3, #0
	str	r3, [fp, #-72]
	b	.L12
.L13:
	ldr	r3, [fp, #-72]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	mvn	r2, #-2147483648
	str	r2, [r3, #-40]
	sub	r2, fp, #56
	ldr	r3, [fp, #-72]
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, [fp, #-72]
	add	r3, r3, #1
	str	r3, [fp, #-72]
.L12:
	ldr	r3, [fp, #-72]
	cmp	r3, #8
	ble	.L13
	ldr	r3, [fp, #-84]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #-40]
	mov	r3, #0
	str	r3, [fp, #-68]
	b	.L14
.L18:
	sub	r2, fp, #56
	sub	r3, fp, #44
	mov	r1, r2
	mov	r0, r3
	bl	minDistance
	str	r0, [fp, #-60]
	sub	r2, fp, #56
	ldr	r3, [fp, #-60]
	add	r3, r2, r3
	mov	r2, #1
	strb	r2, [r3]
	mov	r3, #0
	str	r3, [fp, #-64]
	b	.L15
.L17:
	sub	r2, fp, #56
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	eor	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L16
	ldr	r2, [fp, #-60]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r3, r3, r2
	ldr	r2, [fp, #-64]
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	beq	.L16
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-40]
	cmn	r3, #-2147483647
	beq	.L16
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r1, [r3, #-40]
	ldr	r2, [fp, #-60]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r3, r3, r2
	ldr	r2, [fp, #-64]
	ldr	r3, [r3, r2, lsl #2]
	add	r2, r1, r3
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-40]
	cmp	r2, r3
	bge	.L16
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r1, [r3, #-40]
	ldr	r2, [fp, #-60]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r3, r3, r2
	ldr	r2, [fp, #-64]
	ldr	r3, [r3, r2, lsl #2]
	add	r2, r1, r3
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-40]
.L16:
	ldr	r3, [fp, #-64]
	add	r3, r3, #1
	str	r3, [fp, #-64]
.L15:
	ldr	r3, [fp, #-64]
	cmp	r3, #8
	ble	.L17
	ldr	r3, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-68]
.L14:
	ldr	r3, [fp, #-68]
	cmp	r3, #7
	ble	.L18
	sub	r3, fp, #44
	mov	r1, #9
	mov	r0, r3
	bl	printSolution
	nop
	ldr	r3, .L20
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L19
	bl	__stack_chk_fail
.L19:
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L21:
	.align	2
.L20:
	.word	.LC3
	.size	dijkstra, .-dijkstra
	.section	.rodata
	.align	2
.LC0:
	.word	0
	.word	4
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	8
	.word	0
	.word	4
	.word	0
	.word	8
	.word	0
	.word	0
	.word	0
	.word	0
	.word	11
	.word	0
	.word	0
	.word	8
	.word	0
	.word	7
	.word	0
	.word	4
	.word	0
	.word	0
	.word	2
	.word	0
	.word	0
	.word	7
	.word	0
	.word	9
	.word	14
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	9
	.word	0
	.word	10
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	4
	.word	14
	.word	10
	.word	0
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	2
	.word	0
	.word	1
	.word	6
	.word	8
	.word	11
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	7
	.word	0
	.word	0
	.word	2
	.word	0
	.word	0
	.word	0
	.word	6
	.word	7
	.word	0
	.align	2
.LC4:
	.word	__stack_chk_guard
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 328
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #328
	ldr	r3, .L25
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	mov	r3,#0
	ldr	r2, .L25+4
	sub	r3, fp, #332
	mov	r1, r2
	mov	r2, #324
	mov	r0, r3
	bl	memcpy
	sub	r3, fp, #332
	mov	r1, #0
	mov	r0, r3
	bl	dijkstra
	mov	r3, #0
	ldr	r2, .L25
	ldr	r1, [r2]
	ldr	r2, [fp, #-8]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L24
	bl	__stack_chk_fail
.L24:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L26:
	.align	2
.L25:
	.word	.LC4
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",%progbits
