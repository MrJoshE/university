
# Example Vigener Cipher Problem

## Question: 

Claude wants to encrypt some 10 letter words from the list at http://www.bestwordlist.com/
10letterwords.htm by using the Vigenere cipher.
He chooses two 10 letter words: w1 and w2. He also chooses a random string k of 10
characters and use it as his keyword for the Vigenere cipher.
He encrypts each of these two words with the key to produce two ciphertexts c1 and c2.
You are provided with these two ciphertexts.
c1: LRDUQHSOKQ
c2: XXJGAOGZDP
The fact that he has used the key more than once means that there is an opportunity to
crack the encryption. This question asks you to work out how this can be done.

Solution:
If the plaintexts are p1, p2 then we can write p1 + k = c1, p2 + k = c2, where + is pointwise addition on strings modulo 26.
k = c1 - p1
k = c2 - p2
c1 - p1 = c2 - p2
c1 - c2 = p1 - p2
We are given c1, c2 so:

LRDUQHSOKQ - XXJGAOGZDP = p1 - p2
OUUOQTMPHB = p1 - p2
p2 = p1 - OUUOQTMPHB

So now we try each possible p1 from the dictionary / list until we have a word (p1 - OUUOQTMPHB).
Eventually we reach CONJUGABLE - OUUOQTMPHB = OUTVENOMED
So, two plaintexts are CONJUGABLE and OUTVENOMED.
Finally, this allows the construction of c1 − p1 = k = jdqlwbsnzm.