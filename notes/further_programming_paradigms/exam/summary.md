# Summary







## Week 1

- An abstract machine is needed to execute algorithms.
  - The abstract machine: an abstract formalisation for a generic executor of algorithms, formalised in terms of a specific programming language
  
- A machine language is understood by an abstract machine's interpreter.
  - The machine language: the language of a generic abstract machine. 
  
- High level languages use abstraction mechanisms to ensure their constructs are independent of the characteristics of the physical computer.

- Physical memory permits the storage of data and programs.

- A weakness of implementing an abstract machine for a new lauage directly in hardware is: it ties the implementation to a specific hardware implementation. However it would be the most efficient.
  - The concept of intermediate language: essential in the real implementation of any language; there are some famous examples (P-code machine for Pascal and the Java Virtual Machine).
  
- Abstract machines can be hierarchically composed.
  - Hierarchies of abstract machines: abstract machines can be hierarchically composed and many software systems can be seen in such terms
  
- The concept of an intermediate language is essential in the real implementation of any language.



## Week 2



- In applications of the financial showing currency data in floats / reals should be viewed as risky.

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

     

- Representation independence property

  - Two correct implementations of a single specification of an ADT are observationally indistinguishable by the clients of these types.

- In an object orientated language you cannot execute an object if it only exists in another environment

- C++ Pointers

  ```c++
  // Setting my_age to 19
  // (allocating memory to the variable and creating a reference
  // to that allocation of memory called my_age)
  int my_age = 19;
  // Setting my_birthday to the pointer of my_age
  // (allocating memory to a variable my_birthday and giving it the
  // data of the memory location of my_age)
  int* my_birthday = &my_age;
  // Setting the data at the memory location stored at my_birthday to 20
  // (mutates the data located at the memory location that is stored in 
  // my_birthday)
  *my_birthday = 20;
  
  // my_age = 20
  cout << my_age;
  
  ```





## Week 3



- The name of the class that bridges the connection between 2 classes that would interact is called an interaction class. 

  - If there is a Customer class and a Seat class there would be a CustomerSeat class that would be used to map the customer to a seat

- C++ supports the use of templates to enable the development of polymorphic classes and functions.

- Adding specific numerical multiplicities to associations between classes is always good practice.

  

## Week 4



- Imperative programming languages such as C++ and Java can’t easily change the data stored at specific memory locations, and is able to change the assoication between a variable name and an address of space in memory.

- A function programming language memory isn’t really relavent.

- Conventional imperative programs proceed by modifying state until some condition is satisfied.

- Functional language proceed by rewriting expressions - progressively reducing them to a simpler form until a result is obtained.

- In functional programming, variables alway denote the same value provided we remain in the same context. This is known as **referential transparency**.

- Currying is when a function with n parameters is split into n functions where n-1 functions returns a function.

  ```js
  // Without Currying
  function add(a,b) { return a+b;}
  add(3,4) // returns 7
  
  // With Currying
  function add(a) {
      return function(b) {return a+b;}
  }
  var add3 = add(3);
  add3(4); // returns 7
  ```

  

- Key properties of functional programming

  - Functions are promoted to first class objects
  - Referential transparency

- The declarative nature of functional programs typically makes it easier to prove properties than is the case with imperative programs





## Week 5



- Redex is an application of the form: (fn x = body) arg

- A reductum of a redex is the expression which is obtained by replacing the body of each (free) occurrence of the formal paraeter, x, by a copy of arg.

  ```haskell
  > let add x y = x + y
  
  > add 3 2
  
  >>> (+ x y) 3 2
  
  >>> ((+3) y)2
  
  >>> (+3) 2
  
  >>> 5
  ```

- Evaluation strategies

  - Evaluation by value (eagar evaluation) - Tries to evaluate all argument expressions down to their simplest forms before evaluating the redex

    ```
    first(2 fact(-4))
    
    This would just hang as the evaluation method would try to get all of the arguments in their most simple form which will mean it will evaluate fact(-4) first then 2, which the evaluation of fact(-4) will cause the hang
    ```

    

  - Evaluation by name - the redex is evaluated before the expression if there is one

    ```
    first(2 fact(-4))
    
    Using this evaluation method the redex is evaluated first and 2 will be returned.
    ```

    

  - Lazy evaluation - proceeds by name first, but the first time that a 'copy' of a redex is encounteed, its value is saved in case it is needed again later

    ```
    add (first 2 3) (first 2 3)
    
    Using lazy evaluation the value of (first 2 3) has been stored so that when required to use again the expression does not need to be re-evaluated. Where evaluation by name would evaluate first 2 3 twice, lazy evaluation would only evaluate once.
    ```

- If **exp is a closed expression and it reducces to a primitive value**, val, using any of the above strategies, then **exp reduces to val following by the *name* strategy**. 

  If e**xp diverges using the by-name strategy**, then it **also diverges under the other two strategies.**

  - Closed means that all its variables are bound.

- **Once any strategy has been fixed in a given environment**, the **evaluation of all occurrences of a single expression always yield the same value**.

  - This property can be taken as *criterion* for a pure functional language. Its the property that enables us to *reason* about a functional program.

- Pure functional language has no commands, only expressions.

- Defining a function using pattern matching makes for a less efficient implementation than defining it using guards.

- mirror x = x x is an illegal statement

















- Lambda of a function reverses the calling order.

