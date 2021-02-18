extern printf
extern scanf

section .data
	fmt: db "%d", 0
	output: db "%d",10,0

section .text
	global main

	main:
	push ebp
	mov ebp, esp
	sub esp, 0x10

	lea eax, [ebp-0x4]
	push eax
	push fmt
	call scanf

	mov edx, dword [ebp-0x4]
	
	mov ecx,1
	mov ebx,0
	L:
	add ebx,1
	imul ecx,ebx

		
	cmp ebx,edx
	jl L

	push ecx
	push output
	call printf

	leave
	ret
