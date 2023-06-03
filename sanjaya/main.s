	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d%d%d%d%d%d%d"
	.text
	.globl	task_start
	.type	task_start, @function
task_start:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -8[rbp], rdi
	mov	DWORD PTR -12[rbp], esi
	mov	DWORD PTR -16[rbp], edx
	mov	DWORD PTR -20[rbp], ecx
	mov	DWORD PTR -24[rbp], r8d
	mov	DWORD PTR -28[rbp], r9d
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	rdx
	mov	r8d, DWORD PTR -28[rbp]
	mov	edi, DWORD PTR -24[rbp]
	mov	ecx, DWORD PTR -20[rbp]
	mov	edx, DWORD PTR -16[rbp]
	mov	eax, DWORD PTR -12[rbp]
	mov	esi, DWORD PTR 24[rbp]
	push	rsi
	mov	esi, DWORD PTR 16[rbp]
	push	rsi
	mov	r9d, r8d
	mov	r8d, edi
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	rsp, 16
	nop
	leave
	ret
	.size	task_start, .-task_start
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -56[rbp], 32
	mov	QWORD PTR -48[rbp], 0
	mov	QWORD PTR -40[rbp], 0
	mov	QWORD PTR -32[rbp], 0
	mov	rax, QWORD PTR worker1@GOTPCREL[rip]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, -48[rbp]
	push	50
	push	20
	mov	r9d, 10
	mov	r8d, 3
	mov	ecx, 2
	mov	edx, 1
	mov	esi, 3
	mov	rdi, rax
	call	task_start
	add	rsp, 16
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
