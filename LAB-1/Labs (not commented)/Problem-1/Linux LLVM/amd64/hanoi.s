	.text
	.file	"hanoi.c"
	.globl	hanoi                   # -- Begin function hanoi
	.p2align	4, 0x90
	.type	hanoi,@function
hanoi:                                  # @hanoi
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
                                        # kill: def $cl killed $cl killed $ecx
                                        # kill: def $dl killed $dl killed $edx
                                        # kill: def $sil killed $sil killed $esi
	movl	%edi, -4(%rbp)
	movb	%sil, -5(%rbp)
	movb	%dl, -6(%rbp)
	movb	%cl, -7(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.LBB0_2
# %bb.1:
	movsbl	-5(%rbp), %esi
	movsbl	-6(%rbp), %edx
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	jmp	.LBB0_3
.LBB0_2:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movb	-5(%rbp), %cl
	movb	-7(%rbp), %dl
	movl	%eax, %edi
	movsbl	%cl, %esi
	movsbl	%dl, %edx
	movsbl	-6(%rbp), %ecx
	callq	hanoi
	movl	-4(%rbp), %esi
	movsbl	-5(%rbp), %edx
	movsbl	-6(%rbp), %ecx
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
	movl	-4(%rbp), %ecx
	subl	$1, %ecx
	movb	-7(%rbp), %r8b
	movb	-6(%rbp), %r9b
	movl	%ecx, %edi
	movsbl	%r8b, %esi
	movsbl	%r9b, %edx
	movsbl	-5(%rbp), %ecx
	movl	%eax, -12(%rbp)         # 4-byte Spill
	callq	hanoi
.LBB0_3:
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	hanoi, .Lfunc_end0-hanoi
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$3, %edi
	movl	$65, %esi
	movl	$67, %edx
	movl	$66, %ecx
	callq	hanoi
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Move disk 1 from %c to %c \n"
	.size	.L.str, 28

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"Move disk %d from %c to %c \n"
	.size	.L.str.1, 29

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym hanoi
	.addrsig_sym printf
