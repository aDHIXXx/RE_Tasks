# RE_Tasks_2
CRACKME

Crackme0x01

At <main+71> there was a cmp that checks our input with ‘0x149a’.  0x149a
=5274. So if we give 5274 as input, we will get ‘Password OK :)’.

Crackme0x02

From pd main, we get that:
1. 0x5a and 0x1ec is moved to [ebp-0x8] and [ebp-0xc].
2. [ebp-0xc] is now moved to edx and the adress of [ebp-0x8] is moved to eax.
3. eax and edx is added: 0x5a+0x1ec = 90+492=582
4. [ebp-0x8] is now moved to eax and imul =582*582=338724
5. eax is now moved to [ebp-0xc]  and [ebp-0x4], which had our input ,is moved to eax
6. Now our input is compared with 338724.

So if we give our input as 338724, we will get ‘Password OK :)’.

  
Crackme0x03

Here in main, it only prints out the introductory statements and scans our input. Though it follows the same order of commands as the previous crackme0x02, in the main function it calls test function.
Here in test, it just compares the input is same or not and then calls shift function.
Here in shift, there is a <strlen@plt> . If we break there ,we will get the passing argument as ‘Sdvvzrug#RN$$$#=,’. The loop runs through the string and as there is an inc eax cmd, if we break at the point when it comes out of loop, we will find eax=17 , which is the length of the string.

If we give input as 338724, we will get ‘Password OK!!! :)’.

Crackme0x04

Honestly, I gave a sample input of 12345 and it worked :)
But coming to the actual solution:
Breaking at <scanf@plt>, it shows we have to give a string as input. Main function now calls the check function.Breaking at <sscanf@plt>, shows that each alaphet of the string that we inputted is taken an converted to a %d and then stored at edx and then added and compared to 0xf(15).The process runs in a loop through the length of outr input string. 
So basically what this code does is to take our input , let’s say 12345 and and add it’s digits (1+2+3+4+5) and checks if it’s final sum=15.
If we give 54321, we will get ‘Password OK!’


Crackme0x05

Everything is same as crackme0x04 except that we compare the sum with 16 and there is a new function parell being called. 
In parell:
The LSB is taken and is fed through a add eax,0x1 command . As we know that even number’s binary always end with 0; so after this command works we have to get 0 . 
How I checked if my thinking of how parell work is correct: When i entered 64321 , it showed error. But when i entered all even cobinations , it worked.


Crackme0x00a

By breaking at <strcmp@plt>, we will get our flag as the argument passed ,which was ‘g00dJ0B!’.

Crackme0x00b

By breaking at <wcscmp@plt>, we get that the first alphabet of our input is  compared to ‘w’. This w is stored in ‘0x804a040 ‘(we can get this from stack), which made me think that other alaphbets to be compared will be in nearby memory loactions . So I x/s all adjacent memory locations to get : ‘w0wgreat’ and this was the required password.
