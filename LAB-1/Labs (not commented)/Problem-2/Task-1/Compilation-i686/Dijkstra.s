	.file	"Dijkstra.c"
	.text
	.globl	minDistance
	.type	minDistance, @function
minDistance:
.LFB6:
	.cfi_startproc
	endbr32
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	$2147483647, -12(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L2
.L4:
	movl	-4(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L3
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	%eax, -12(%ebp)
	jl	.L3
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, -8(%ebp)
.L3:
	addl	$1, -4(%ebp)
.L2:
	cmpl	$8, -4(%ebp)
	jle	.L4
	movl	-8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
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
	endbr32
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$12, %esp
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	movl	$0, -12(%ebp)
	jmp	.L7
.L8:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	-12(%ebp)
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	addl	$1, -12(%ebp)
.L7:
	cmpl	$8, -12(%ebp)
	jle	.L8
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	printSolution, .-printSolution
	.globl	dijkstra
	.type	dijkstra, @function
dijkstra:
.LFB8:
	.cfi_startproc
	endbr32
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	8(%ebp), %eax
	movl	%eax, -92(%ebp)
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	$0, -76(%ebp)
	jmp	.L10
.L11:
	movl	-76(%ebp), %eax
	movl	$2147483647, -48(%ebp,%eax,4)
	leal	-57(%ebp), %edx
	movl	-76(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	addl	$1, -76(%ebp)
.L10:
	cmpl	$8, -76(%ebp)
	jle	.L11
	movl	12(%ebp), %eax
	movl	$0, -48(%ebp,%eax,4)
	movl	$0, -72(%ebp)
	jmp	.L12
.L16:
	leal	-57(%ebp), %eax
	pushl	%eax
	leal	-48(%ebp), %eax
	pushl	%eax
	call	minDistance
	addl	$8, %esp
	movl	%eax, -64(%ebp)
	leal	-57(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movb	$1, (%eax)
	movl	$0, -68(%ebp)
	jmp	.L13
.L15:
	leal	-57(%ebp), %edx
	movl	-68(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L14
	movl	-64(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	-92(%ebp), %eax
	addl	%eax, %edx
	movl	-68(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	testl	%eax, %eax
	je	.L14
	movl	-64(%ebp), %eax
	movl	-48(%ebp,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	.L14
	movl	-64(%ebp), %eax
	movl	-48(%ebp,%eax,4), %ecx
	movl	-64(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	-92(%ebp), %eax
	addl	%eax, %edx
	movl	-68(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	leal	(%ecx,%eax), %edx
	movl	-68(%ebp), %eax
	movl	-48(%ebp,%eax,4), %eax
	cmpl	%eax, %edx
	jge	.L14
	movl	-64(%ebp), %eax
	movl	-48(%ebp,%eax,4), %ecx
	movl	-64(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	-92(%ebp), %eax
	addl	%eax, %edx
	movl	-68(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	leal	(%ecx,%eax), %edx
	movl	-68(%ebp), %eax
	movl	%edx, -48(%ebp,%eax,4)
.L14:
	addl	$1, -68(%ebp)
.L13:
	cmpl	$8, -68(%ebp)
	jle	.L15
	addl	$1, -72(%ebp)
.L12:
	cmpl	$7, -72(%ebp)
	jle	.L16
	subl	$8, %esp
	pushl	$9
	leal	-48(%ebp), %eax
	pushl	%eax
	call	printSolution
	addl	$16, %esp
	nop
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L17
	call	__stack_chk_fail_local
.L17:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
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
	endbr32
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	subl	$348, %esp
	call	__x86.get_pc_thunk.dx
	addl	$_GLOBAL_OFFSET_TABLE_, %edx
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	leal	-352(%ebp), %eax
	leal	.LC0@GOTOFF(%edx), %edx
	movl	$81, %ecx
	movl	%eax, %edi
	movl	%edx, %esi
	rep movsl
	subl	$8, %esp
	pushl	$0
	leal	-352(%ebp), %eax
	pushl	%eax
	call	dijkstra
	addl	$16, %esp
	movl	$0, %eax
	movl	-28(%ebp), %ecx
	xorl	%gs:20, %ecx
	je	.L20
	call	__stack_chk_fail_local
.L20:
	leal	-12(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB10:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE10:
	.section	.text.__x86.get_pc_thunk.dx,"axG",@progbits,__x86.get_pc_thunk.dx,comdat
	.globl	__x86.get_pc_thunk.dx
	.hidden	__x86.get_pc_thunk.dx
	.type	__x86.get_pc_thunk.dx, @function
__x86.get_pc_thunk.dx:
.LFB11:
	.cfi_startproc
	movl	(%esp), %edx
	ret
	.cfi_endproc
.LFE11:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB12:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE12:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 4
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 4
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 4
4:
