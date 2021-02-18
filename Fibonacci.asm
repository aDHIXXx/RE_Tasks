extern printf
extern scanf

section .data
	fmt: db "%d", 0
	output: db "%d",10,0
	output1: db "Enter nth position: ",10,0

section .text
	global main

	main:
	push ebp
	mov ebp, esp
	sub esp, 0x10

	push output1
	call printf

	lea eax, [ebp-0x4]
	push eax
	push fmt
	call scanf

	mov eax, 2
	mov ecx, 1
	mov ebx, 0
	L1:
	mov edx, eax
	add ecx, ebx
	mov ebx, eax
	add eax, 1
		
	cmp eax,dword [ebp-0x4]
	jne L1

	push ecx
	push output
	call printf

	leave
	ret
