extern printf
extern scanf
section .data
         fmt: db "%d", 0
         output: db "sum is %d", 10, 0

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
  
  lea edx, [ebp-0x4]
  push edx
  push fmt
  call scanf
  
  mov ebx, dword [ebp-0x4]
  mov eax, dword [ebp-0x4]
  add eax, ebx
  mov dword [ebp-0x8], eax
  
  push dword [ebp-0x8]
  push output
  call printf
  
  leave
  ret
