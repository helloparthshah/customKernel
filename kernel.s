	.file	"kernel.c"
	.text
	.globl	vga_buffer
	.bss
	.align 8
	.type	vga_buffer, @object
	.size	vga_buffer, 8
vga_buffer:
	.zero	8
	.text
	.globl	vga_entry
	.type	vga_entry, @function
vga_entry:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%esi, %ecx
	movl	%edx, %eax
	movl	%edi, %edx
	movb	%dl, -20(%rbp)
	movl	%ecx, %edx
	movb	%dl, -24(%rbp)
	movb	%al, -28(%rbp)
	movw	$0, -2(%rbp)
	movb	$0, -4(%rbp)
	movb	$0, -3(%rbp)
	movzbl	-28(%rbp), %eax
	movb	%al, -4(%rbp)
	salb	$4, -4(%rbp)
	movzbl	-24(%rbp), %eax
	orb	%al, -4(%rbp)
	movzbl	-4(%rbp), %eax
	movw	%ax, -2(%rbp)
	salw	$8, -2(%rbp)
	movzbl	-20(%rbp), %eax
	movb	%al, -3(%rbp)
	movzbl	-3(%rbp), %eax
	orw	%ax, -2(%rbp)
	movzwl	-2(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	vga_entry, .-vga_entry
	.globl	clear_vga_buffer
	.type	clear_vga_buffer, @function
clear_vga_buffer:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -32(%rbp)
	movl	%esi, %ecx
	movl	%edx, %eax
	movl	%ecx, %edx
	movb	%dl, -36(%rbp)
	movb	%al, -40(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L4
.L5:
	movzbl	-40(%rbp), %edx
	movzbl	-36(%rbp), %eax
	movq	-32(%rbp), %rcx
	movq	(%rcx), %rsi
	movl	-12(%rbp), %ecx
	addq	%rcx, %rcx
	leaq	(%rsi,%rcx), %rbx
	movl	%eax, %esi
	movl	$0, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	addl	$1, -12(%rbp)
.L4:
	cmpl	$2199, -12(%rbp)
	jbe	.L5
	nop
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	clear_vga_buffer, .-clear_vga_buffer
	.globl	init_vga
	.type	init_vga, @function
init_vga:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -4(%rbp)
	movb	%al, -8(%rbp)
	movq	$753664, vga_buffer(%rip)
	movzbl	-8(%rbp), %edx
	movzbl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	vga_buffer(%rip), %rdi
	call	clear_vga_buffer
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	init_vga, .-init_vga
	.globl	kernel_entry
	.type	kernel_entry, @function
kernel_entry:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movl	$0, %esi
	movl	$15, %edi
	call	init_vga
	movq	vga_buffer(%rip), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$72, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	movq	vga_buffer(%rip), %rax
	leaq	2(%rax), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$101, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	movq	vga_buffer(%rip), %rax
	leaq	4(%rax), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$108, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	movq	vga_buffer(%rip), %rax
	leaq	6(%rax), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$108, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	movq	vga_buffer(%rip), %rax
	leaq	8(%rax), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$111, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	movq	vga_buffer(%rip), %rax
	leaq	10(%rax), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$32, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	movq	vga_buffer(%rip), %rax
	leaq	12(%rax), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$87, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	movq	vga_buffer(%rip), %rax
	leaq	14(%rax), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$111, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	movq	vga_buffer(%rip), %rax
	leaq	16(%rax), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$114, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	movq	vga_buffer(%rip), %rax
	leaq	18(%rax), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$108, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	movq	vga_buffer(%rip), %rax
	leaq	20(%rax), %rbx
	movl	$0, %edx
	movl	$15, %esi
	movl	$100, %edi
	call	vga_entry
	movw	%ax, (%rbx)
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	kernel_entry, .-kernel_entry
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1) 10.3.0"
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
