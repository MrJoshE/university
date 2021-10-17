**Advanced Algorithms Week 2**



***

**Integer Multiplication**



**KARATSUBA’S Multiplication**

- Rule - Works on even digit numbers only. Therefore if there is an odd number of digits a 0 can be added to the front to make it an even number of digits.



**Example of the Algorithm.**

- a = 5432, b = 1678.

- n = 4 as there are 4 digits.

- $a=(54*10^2)+32$

- $b = (16*10^2)+78$
- $a_h = 54, a_l = 32$
- $b_h = 16, b_l = 78$
- $c_0 = a_l * b_l = 32 * 78 = 2496$
- $c_1 = a_h * b_h = 54 * 16 = 864$
- $c_2 = (a_l + a_h) * (b_l + b_h) - c_0 - c_1 = (86) * (94) - 2496 - 864 = 4724$
- $a*b = c_1 * 10^(n/2) + c_2*10^n + c_0$

- $= 864 * 10^4 + 4724*10^2 + 2496$
- $= 9114896$

Here there are only 3 multiplications performed whereas 16 would be made when multiplying 2 4 digit numbers.

**$T(n) = O(n^1.5)$**

