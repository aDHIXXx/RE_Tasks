# RE_Tasks
RE-Challenge

There was a <strcmp@plt> and the string being used to compare was stored in 0x8b6.
When we x/s 0x8b6 , we get " _eZ`tr)nX@)0X*mv "
From pd main, we 0x00000000000007b8 <+78>:	sub    eax,0x7. It means that whatever input we give , each byte is taken and subtracted by 7 .
We also found that what we have to input is string as it was stored in %s format.
Now, i created a .py to reverse the func and convert _eZ`tr)nX@)0X*mv abck to the desired input.

The pgm:

string='_eZ`tr)nX@)0X*mv'
crypt=''
for x in string:
     crypt=crypt+(chr(ord(x)+7))
print(crypt)

Output:flag{y0u_G07_1t}

We can confirm if this is the flag or not by putting it back to the ELF, where it wouls show like the below:

Enter the key:
flag{y0u_G07_1t}
Correct




