extern printf
extern scanf

section .data
	fmt: db "%d", 0
	output: db "Enter the two numbers: " , 10,0
	output1: db "Sum = %d",10,0
	output2: db "Diff = %d",10,0
	output3: db "Prod = %d",10,0
	output4: db "Div = %d",10,0
	output5: db "Remainder = %d",10,0

section .text
	global main

	main:
	push ebp
	mov ebp, esp
	sub esp, 0x10
	
	push output
	call printf

	lea eax, [ebp-0x4]
	push eax
	push fmt
	call scanf

	lea edx, [ebp-0x8]
	push edx
	push fmt
	call scanf

	mov ebx, dword [ebp-0x4]
	mov eax, dword [ebp-0x8]
	add eax, ebx
	push eax
	push output1
	call printf

	mov ebx, dword [ebp-0x4]
	mov eax, dword [ebp-0x8]
	sub ebx, eax
	push ebx
	push output2
	call printf

	mov ebx, dword [ebp-0x4]
	mov eax, dword [ebp-0x8]
	imul eax, ebx
	push eax
	push output3
	call printf

	mov edx, 0
	mov eax, dword [ebp-0x4]
	mov ebx, dword [ebp-0x8]
	div ebx
	push eax
	push output4
	call printf

	mov edx, 0
	mov eax, dword [ebp-0x4]
	mov ebx, dword [ebp-0x8]
	div ebx
	push edx
	push output5
	call printf

	leave
	ret
