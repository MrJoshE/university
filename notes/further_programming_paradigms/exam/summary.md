# Summary







## Week 1

- ###### An abstract machine is needed to execute algorithms.

  - The abstract machine: an abstract formalisation for a generic executor of algorithms, formalised in terms of a specific programming language

- ###### A machine language is understood by an abstract machine's interpreter.

  - The machine language: the language of a generic abstract machine. 

- ###### High level languages use abstraction mechanisms to ensure their constructs are independent of the characteristics of the physical computer.

- ###### Physical memory permits the storage of data and programs.

- ###### A weakness of implementing an abstract machine for a new lauage directly in hardware is: it ties the implementation to a specific hardware implementation. However it would be the most efficient.

  - The concept of intermediate language: essential in the real implementation of any language; there are some famous examples (P-code machine for Pascal and the Java Virtual Machine).

- ###### Abstract machines can be hierarchically composed.

  - Hierarchies of abstract machines: abstract machines can be hierarchically composed and many software systems can be seen in such terms

- ###### The concept of an intermediate language is essential in the real implementation of any language.



## Week 2



- In applications of the financial showing currency data in floats / reals should be viewed as risky.

  - 

- Including local file headers in C++ should be done using ```#include "header_file.h" ```.

- A functional is a higher order function that takes function as arguments.

  - ```c++
    function map(array, action) { for (int i = 0; i<array.length; i++) {action(array[i]);}}
    
    map([1,2,3,4], print);
    ```

- Requirements for an Abstract Data Type

  1. Name for the type

  2. An implementation (or representation of the type)

  3. A set of names denoting operations for manipulating the values of the type (A set of operations for the type)

  4. For every operation, an implementation that uses the representation provided in point 2

  5. A security capsule that separates the name of the type and those of the operations dform their implementations.

     Example:

     ```c++
     abstype Int_Stack {
     	// Name and implementation for Int_Stack
       type Int_Stack = struct {
         int P[100];
         int n;
         int top;
       }
       // Interface of ADT
       signature
         Int_Stack create_stack();
       	Int_Stack push(Int_Stack s, int k);
       operations
         Int_Stack create_stack(){
         	Int_Stack s = new Int_Stack();
         	s.n = 0;
         	s.top = 0;
         	return s;
       	}
     		Int_Stack push(Int_Stack s, int k){
           if (s.n == 100) error;
           s.n = s.n + 1;
           s.P[s.top] = k;
           s.top = s.top + 1;
           return s;
         }
     
     }
     ```

     

- 

