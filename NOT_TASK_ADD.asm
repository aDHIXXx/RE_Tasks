extern printf

section .data
fmt:db "%d", 10, 0

section .text
global main
main:
    push ebp
    mov ebp,esp 
     
    mov     eax, 1
    mov     ebx, 2
    add     eax, ebx

    push    eax
    push    fmt
    call    printf

    
    mov esp,ebp
    pop ebp
    ret 

