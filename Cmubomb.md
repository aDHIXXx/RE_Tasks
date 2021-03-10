CMUBOMB

From doing strings ./cmubomb and pd main, I understood that it has different phases and check has to be cleared.

PHASE_1

From pd phase_1, we see <strings_not_equal>function is called but before that ‘0x80497c0’ is pushed into the stack. If we do x/s 0x80497c0 , we will get ‘Public speaking is very easy.’, which is the first flag.

PHASE_2

From pd phase_2, we will see that it calls <read_six_numbers>. In pd read_six_numbers, when we put a break at <sscanf@plt>, we can see that our input has to be in format :"%d %d %d %d %d %d"
In pd phase_2, we can see that:
1. cmp    DWORD PTR [ebp-0x18],0x1, we can see that our first entry is compared to 1.
2. If true then, 1 is moved to ebx and [ebp-0x18] ,which contains now 1 , is moved to esi. [ebx+0x1] , which is 1+1, is moved to eax.
3. eax is multiplied by [esi+ebx*4-0x4] and stored in eax, so eax has a value of 2 now.
4. Now our second input is compared to eax.
5. Then the ebx is incremmented so it becomes 2 and then compared with 0x5, so as to check if the loop is over or not.(
6. Then this cmd comes: jle    0x8048b76 <phase_2+46>, which makes us go again in loop (if lebx<6). The eax is again increased to 3 and then multiplied with our second input and checked and this goes one.

The numbers are:
    • 1
    • 1*2=2
    • 2*3 =6
    • 6*4=24
    • 24*5=120
    • 120*6=720
Our flag is 1 2 6 24 120 720

PHASE_3

From pd phase_3, we break at <sscanf@plt> and we can see that our input shouuld be of format:   "%d %c %d". 
So in this our first input is checked if it is <=7 or not--->cmp    DWORD PTR [ebp-0xc],0x7
                                                                                                     ja     0x8048c88 <phase_3+240>
If it is less than 8:
 0x08048bd3 <+59>:	mov    eax,DWORD PTR [ebp-0xc]
 0x08048bd6 <+62>:	jmp    DWORD PTR [eax*4+0x80497e8]
What I have infered is that it is like if switch case. 
Like if our first input =0, then it will jump to thi particular memory location .
Like:
If 0, then it jumps to '0x8048be0' and bl =0x71 and our last inputted integer is compared to 0x309, which is 777. Then we jumps to +247, where our bl is compared to our character input.
||ly for all numbers till 7. The series is:
0 q 777
1 b 214
2 b 755
3 k 251
4 o 160
5 t 458
6 v 780
7 b 524
Any one can be inputted as the flag.
