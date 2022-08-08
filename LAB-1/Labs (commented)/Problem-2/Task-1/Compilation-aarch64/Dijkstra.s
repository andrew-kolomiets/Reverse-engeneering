	.arch armv8-a
	.file	"Dijkstra.c"
	.text
	.align	2
	.global	minDistance
	.type	minDistance, %function
minDistance:
.LFB6:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, 8]
	str	x1, [sp]
	mov	w0, 2147483647
	str	w0, [sp, 20]
	str	wzr, [sp, 28]
	b	.L2
.L4:
	ldrsw	x0, [sp, 28]
	ldr	x1, [sp]
	add	x0, x1, x0
	ldrb	w0, [x0]
	eor	w0, w0, 1
	and	w0, w0, 255
	cmp	w0, 0
	beq	.L3
	ldrsw	x0, [sp, 28]
	lsl	x0, x0, 2
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldr	w0, [x0]
	ldr	w1, [sp, 20]
	cmp	w1, w0
	blt	.L3
	ldrsw	x0, [sp, 28]
	lsl	x0, x0, 2
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldr	w0, [x0]
	str	w0, [sp, 20]
	ldr	w0, [sp, 28]
	str	w0, [sp, 24]
.L3:
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 8
	ble	.L4
	ldr	w0, [sp, 24]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	minDistance, .-minDistance
	.section	.rodata
	.align	3
.LC1:
	.string	"Vertex Distance from Source"
	.align	3
.LC2:
	.string	"%d \t\t %d\n"
	.text
	.align	2
	.global	printSolution
	.type	printSolution, %function
printSolution:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	w1, [sp, 20]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	puts
	str	wzr, [sp, 44]
	b	.L7
.L8:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	w0, [x0]
	mov	w2, w0
	ldr	w1, [sp, 44]
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
.L7:
	ldr	w0, [sp, 44]
	cmp	w0, 8
	ble	.L8
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	printSolution, .-printSolution
	.align	2
	.global	dijkstra
	.type	dijkstra, %function
dijkstra:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	str	x0, [sp, 24]
	str	w1, [sp, 20]
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 104]
	mov	x1,0
	str	wzr, [sp, 32]
	b	.L10
.L11:
	ldrsw	x0, [sp, 32]
	lsl	x0, x0, 2
	add	x1, sp, 64
	mov	w2, 2147483647
	str	w2, [x1, x0]
	ldrsw	x0, [sp, 32]
	add	x1, sp, 48
	strb	wzr, [x1, x0]
	ldr	w0, [sp, 32]
	add	w0, w0, 1
	str	w0, [sp, 32]
.L10:
	ldr	w0, [sp, 32]
	cmp	w0, 8
	ble	.L11
	ldrsw	x0, [sp, 20]
	lsl	x0, x0, 2
	add	x1, sp, 64
	str	wzr, [x1, x0]
	str	wzr, [sp, 36]
	b	.L12
.L16:
	add	x1, sp, 48
	add	x0, sp, 64
	bl	minDistance
	str	w0, [sp, 44]
	ldrsw	x0, [sp, 44]
	add	x1, sp, 48
	mov	w2, 1
	strb	w2, [x1, x0]
	str	wzr, [sp, 40]
	b	.L13
.L15:
	ldrsw	x0, [sp, 40]
	add	x1, sp, 48
	ldrb	w0, [x1, x0]
	eor	w0, w0, 1
	and	w0, w0, 255
	cmp	w0, 0
	beq	.L14
	ldrsw	x1, [sp, 44]
	mov	x0, x1
	lsl	x0, x0, 3
	add	x0, x0, x1
	lsl	x0, x0, 2
	mov	x1, x0
	ldr	x0, [sp, 24]
	add	x0, x0, x1
	ldrsw	x1, [sp, 40]
	ldr	w0, [x0, x1, lsl 2]
	cmp	w0, 0
	beq	.L14
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	add	x1, sp, 64
	ldr	w1, [x1, x0]
	mov	w0, 2147483647
	cmp	w1, w0
	beq	.L14
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	add	x1, sp, 64
	ldr	w2, [x1, x0]
	ldrsw	x1, [sp, 44]
	mov	x0, x1
	lsl	x0, x0, 3
	add	x0, x0, x1
	lsl	x0, x0, 2
	mov	x1, x0
	ldr	x0, [sp, 24]
	add	x0, x0, x1
	ldrsw	x1, [sp, 40]
	ldr	w0, [x0, x1, lsl 2]
	add	w1, w2, w0
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 2
	add	x2, sp, 64
	ldr	w0, [x2, x0]
	cmp	w1, w0
	bge	.L14
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	add	x1, sp, 64
	ldr	w2, [x1, x0]
	ldrsw	x1, [sp, 44]
	mov	x0, x1
	lsl	x0, x0, 3
	add	x0, x0, x1
	lsl	x0, x0, 2
	mov	x1, x0
	ldr	x0, [sp, 24]
	add	x0, x0, x1
	ldrsw	x1, [sp, 40]
	ldr	w0, [x0, x1, lsl 2]
	add	w2, w2, w0
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 2
	add	x1, sp, 64
	str	w2, [x1, x0]
.L14:
	ldr	w0, [sp, 40]
	add	w0, w0, 1
	str	w0, [sp, 40]
.L13:
	ldr	w0, [sp, 40]
	cmp	w0, 8
	ble	.L15
	ldr	w0, [sp, 36]
	add	w0, w0, 1
	str	w0, [sp, 36]
.L12:
	ldr	w0, [sp, 36]
	cmp	w0, 7
	ble	.L16
	add	x0, sp, 64
	mov	w1, 9
	bl	printSolution
	nop
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x1, [sp, 104]
	ldr	x2, [x0]
	subs	x1, x1, x2
	mov	x2, 0
	beq	.L17
	bl	__stack_chk_fail
.L17:
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	dijkstra, .-dijkstra
	.align	2
	.global	main
	.type	main, %function
main:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -352]!
	.cfi_def_cfa_offset 352
	.cfi_offset 29, -352
	.cfi_offset 30, -344
	mov	x29, sp
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 344]
	mov	x1,0
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	add	x0, sp, 16
	mov	x3, x1
	mov	x1, 324
	mov	x2, x1
	mov	x1, x3
	bl	memcpy
	add	x0, sp, 16
	mov	w1, 0
	bl	dijkstra
	mov	w0, 0
	mov	w1, w0
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 344]
	ldr	x3, [x0]
	subs	x2, x2, x3
	mov	x3, 0
	beq	.L20
	bl	__stack_chk_fail
.L20:
	mov	w0, w1
	ldp	x29, x30, [sp], 352
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.align	3
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
	.text
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
