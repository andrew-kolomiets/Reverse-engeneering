	.file	"Dijkstra.c"
	.text
	.globl	minDistance
	.type	minDistance, @function
minDistance:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$2147483647, -12(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L4:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
.L3:
	addl	$1, -4(%rbp)
.L2:
	cmpl	$8, -4(%rbp)
	jle	.L4
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	minDistance, .-minDistance
	.section	.rodata
.LC1:
	.string	"Vertex Distance from Source"
.LC2:
	.string	"%d \t\t %d\n"
	.text
	.globl	printSolution
	.type	printSolution, @function
printSolution:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$0, -4(%rbp)
	jmp	.L7
.L8:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L7:
	cmpl	$8, -4(%rbp)
	jle	.L8
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	printSolution, .-printSolution
	.globl	dijkstra
	.type	dijkstra, @function
dijkstra:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movl	%esi, -92(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -76(%rbp)
	jmp	.L10
.L11:
	movl	-76(%rbp), %eax
	cltq
	movl	$2147483647, -48(%rbp,%rax,4)
	movl	-76(%rbp), %eax
	cltq
	movb	$0, -57(%rbp,%rax)
	addl	$1, -76(%rbp)
.L10:
	cmpl	$8, -76(%rbp)
	jle	.L11
	movl	-92(%rbp), %eax
	cltq
	movl	$0, -48(%rbp,%rax,4)
	movl	$0, -72(%rbp)
	jmp	.L12
.L16:
	leaq	-57(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	minDistance
	movl	%eax, -64(%rbp)
	movl	-64(%rbp), %eax
	cltq
	movb	$1, -57(%rbp,%rax)
	movl	$0, -68(%rbp)
	jmp	.L13
.L15:
	movl	-68(%rbp), %eax
	cltq
	movzbl	-57(%rbp,%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L14
	movl	-64(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-68(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	testl	%eax, %eax
	je	.L14
	movl	-64(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	cmpl	$2147483647, %eax
	je	.L14
	movl	-64(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %ecx
	movl	-64(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-68(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	leal	(%rcx,%rax), %edx
	movl	-68(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jge	.L14
	movl	-64(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %ecx
	movl	-64(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-68(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	leal	(%rcx,%rax), %edx
	movl	-68(%rbp), %eax
	cltq
	movl	%edx, -48(%rbp,%rax,4)
.L14:
	addl	$1, -68(%rbp)
.L13:
	cmpl	$8, -68(%rbp)
	jle	.L15
	addl	$1, -72(%rbp)
.L12:
	cmpl	$7, -72(%rbp)
	jle	.L16
	leaq	-48(%rbp), %rax
	movl	$9, %esi
	movq	%rax, %rdi
	call	printSolution
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	dijkstra, .-dijkstra
	.section	.rodata
	.align 32
.LC0:
	.long	0
	.long	4
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	8
	.long	0
	.long	4
	.long	0
	.long	8
	.long	0
	.long	0
	.long	0
	.long	0
	.long	11
	.long	0
	.long	0
	.long	8
	.long	0
	.long	7
	.long	0
	.long	4
	.long	0
	.long	0
	.long	2
	.long	0
	.long	0
	.long	7
	.long	0
	.long	9
	.long	14
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	9
	.long	0
	.long	10
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	4
	.long	14
	.long	10
	.long	0
	.long	2
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	2
	.long	0
	.long	1
	.long	6
	.long	8
	.long	11
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	0
	.long	7
	.long	0
	.long	0
	.long	2
	.long	0
	.long	0
	.long	0
	.long	6
	.long	7
	.long	0
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$336, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-336(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movl	$40, %ecx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	rep movsq
	movq	%rsi, %rdx
	movq	%rdi, %rax
	movl	(%rdx), %ecx
	movl	%ecx, (%rax)
	leaq	4(%rax), %rax
	leaq	4(%rdx), %rdx
	leaq	-336(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	dijkstra
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
