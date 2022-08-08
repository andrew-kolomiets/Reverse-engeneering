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
	.file	"hanoi.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Move disk 1 from %c to %c \012\000"
	.align	2
.LC1:
	.ascii	"Move disk %d from %c to %c \012\000"
	.text
	.align	2
	.global	hanoi
	.syntax unified
	.arm
	.fpu softvfp
	.type	hanoi, %function
hanoi:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r0
	strb	r3, [fp, #-9]
	mov	r3, r1
	strb	r3, [fp, #-10]
	mov	r3, r2
	strb	r3, [fp, #-11]
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne	.L2
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	ldrb	r2, [fp, #-10]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, .L5
	bl	printf
	b	.L4
.L2:
	ldr	r3, [fp, #-8]
	sub	r0, r3, #1
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	ldrb	r2, [fp, #-11]	@ zero_extendqisi2
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	bl	hanoi
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	ldr	r1, [fp, #-8]
	ldr	r0, .L5+4
	bl	printf
	ldr	r3, [fp, #-8]
	sub	r0, r3, #1
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	ldrb	r2, [fp, #-10]	@ zero_extendqisi2
	ldrb	r1, [fp, #-11]	@ zero_extendqisi2
	bl	hanoi
.L4:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L6:
	.align	2
.L5:
	.word	.LC0
	.word	.LC1
	.size	hanoi, .-hanoi
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r3, #66
	mov	r2, #67
	mov	r1, #65
	mov	r0, #3
	bl	hanoi
	mov	r3, #0
	mov	r0, r3
	pop	{fp, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",%progbits
