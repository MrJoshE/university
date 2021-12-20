### Algorithm = Logic + Control



##### Logically Programming

- In 'logic' programming, the programmer is only required to provide a logical specification
- Everything related to control is delegated to the abstract machine.
- The challenge is to find a deduction rule that enables the interpreter to search efficiently for solution(s) to the problem that was specfied.

##### Example of a logical problem

**Problem**: Arrange three 1s, three 2s,  three 3s, ... three 9s in a sequence such that:

-  for each i E [1,9] there are exactly i other numbers between each occurrence of i in the sequence

**Problem simplification**: There is 3 of each number between 1 and 9 inclusive. Find arrange them in an order where each number is itself spaces away from itself.

Part of a valid solution would be: 1, **2**, 1, 8, **2**, 4, 6, **2**

Where'as this isn't: 1, 2, 1, 8, **2**, 4, **2**



##### Summary

- Logical programming has a foundation in formal math