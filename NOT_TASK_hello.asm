extern printf
extern scanf
section .data
   msg: db " Hello x86 Assembly!",10, 0 ;msg that we want to display
section .text
global main ;global is a keyword in assembly lang
main:
     push ebp
     mov ebp,esp ; create a stack frame
     
     push msg
     call printf
     
     mov esp,ebp
     pop ebp
     ret ;destroys the stack

