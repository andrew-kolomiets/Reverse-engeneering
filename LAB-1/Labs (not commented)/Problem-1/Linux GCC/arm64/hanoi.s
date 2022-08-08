	.arch armv8-a
	.file	"hanoi.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"Move disk 1 from %c to %c \n"
	.align	3
.LC1:
	.string	"Move disk %d from %c to %c \n"
	.text
	.align	2
	.global	hanoi
	.type	hanoi, %function
hanoi:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	strb	w1, [sp, 27]
	strb	w2, [sp, 26]
	strb	w3, [sp, 25]
	ldr	w0, [sp, 28]
	cmp	w0, 1
	bne	.L2
	ldrb	w0, [sp, 27]
	ldrb	w1, [sp, 26]
	mov	w2, w1
	mov	w1, w0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	b	.L4
.L2:
	ldr	w0, [sp, 28]
	sub	w0, w0, #1
	ldrb	w3, [sp, 26]
	ldrb	w2, [sp, 25]
	ldrb	w1, [sp, 27]
	bl	hanoi
	ldrb	w0, [sp, 27]
	ldrb	w1, [sp, 26]
	mov	w3, w1
	mov	w2, w0
	ldr	w1, [sp, 28]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	ldr	w0, [sp, 28]
	sub	w0, w0, #1
	ldrb	w3, [sp, 27]
	ldrb	w2, [sp, 26]
	ldrb	w1, [sp, 25]
	bl	hanoi
.L4:
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	hanoi, .-hanoi
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	mov	w3, 66
	mov	w2, 67
	mov	w1, 65
	mov	w0, 3
	bl	hanoi
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
