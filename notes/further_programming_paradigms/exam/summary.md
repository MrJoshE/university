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

- mirror x = x x is an illegal statement and typing will not work



## Week 6

- Monad is a general type than I/O that you might be expecting to see for read and write operations (comes from Category theory)

- The `Ord a` is a typeclass constraint that indicates your function works for any type `a`, so long as `a` is comparable (`Ord`erable).

- Functional composition works the same as the mathematical functional composition in the sense that ```f.g x = f ( g(x) )```. It means apply g to x then f to result.

- The input of f and the output of g are the same type: b

- For the functional composition f.g the result of the composition f.g as the same input type as g and the same output type as f.

- $X^2 + Y^2 >= Z^2$ is a well formed formula expressing the triangular proerty lengths X,Y,Z

- Lamda calculus allows us to write a function down directly without giving it a name:

  ```haskell
  addOne x = x + 1
  
  -- Map function will apply the addOne function to each element of the list
  map addOne [2,3,4]
  
  -- Can be expressed using a lamda function aswell
  -- This translates to x will become x + 1
  map (\x -> x + 1) [2,3,4]
  ```

- These two functions are the same

  ```haskell
  add :: Int -> Int -> Int
  add x y = x + y
  
  add_lamda :: Int -> (Int -> Int)
  add_lamda = \x -> (\y -> x + y)
  
  add_lam :: Integer -> Integer -> Integer
  add_lam = \x y -> x + y
  ```

  The bottom line translates to \y is equal the addition of x and y and \x is equal to the result which is what add-lamda is.

  

- λ x.M[x] denotes the function ```x -> M[x]```. Which reads: Take a value assigned to x and return the evaluation of M with all instances of x replaced with that value assignment. (λx.M)N = M[x:=N].

- Principle of extensionality states that two functions f and g are equal if they have the same value at every argument.

- Example of error handling

  ```haskell
  fact :: Int -> Int
  fact 0 = 1
  fact n = n * fact (n-1)
  
  factErr :: Int -> Maybe Int
  factErr n 
  	| n >= 0 = Just (fact n)
  	| otherwise = Nothing
  
  factErr(4) -- will return 24
  factErr(-5) -- will return Nothing
  ```

- Type signature

  ```haskell
  seqn [] = return []
  seqn (act:acts) = do
  	x <- act
  	xs <- seqn acts
  	return (x:xs)
  	
  -- Has a type signature of
  seqn:: Monad m => ([m a]) -> (m [a])
  ```

- Lambda of a function reverses the calling order.

  

## Week 7

- In Logical programming,  Algorithm = Logic + Control, with the user specifiying the logic and the abstract machine providing the control

- Terms (intended to be descriptions of objects)

  - A variable is a term
  - If *f* is a function symbol of aritary n and t1, ... tn are terms then f(f1, ..., tn) is a term.
  - A constant is a term

- A well-formed formulae (or just formulae) of a language allows us to express properties of terms. They collectively define the properties of a domain.

- We use a logic program to answer queries about a domain.

- Predicates (primitives that are used in constructing formulas. They are statements about a subject)

  ```
  I showed a simple approach in Prolog to solving a puzzle in the introductory lecture. 
  
  It used a predicate subseq(Xs, Ys) which succeeds if Xs is a sequence that lies within the bigger sequence Ys.
  
  For example, subseq([2,3], [1,2,3,4]) is true, whilst subseq([2,4], [1,2,3,4]) is false (because 2 and 4 are not contiguous in the bigger sequence). 
  
  It is possible to define subseq/3 in terms of append(Xs, Ys, Zs) where Zs is the result of appending Ys to Xs. 
  
  We are going to need some intermediate list XsBs in the following definition. 
  
  In addition, you will need to include Xs and Ys, so fill in each of the blanks with one of: Xs; Ys: or, XsBs:
  
  subseq(Xs,Ys):-
  	append(_, XsBs,Ys), append(xs, _,XsBs ).
  ```

  

## Week 8

- Herbrand Universe of a Logic Program is the set of all possible ground terms (term that does not contain any variables) over its signature.

- Backtracking is when the program goes down a route that fails and has to backtrack to try the next route.

- In a logical program, the semantics of a program is not alterned if the order of the atoms in the body of a clause is changed.

- Prolog's SLD Resolution isn't a complete and correct proof procedure for logic programming.

- X = Y will succeed if X and Y can be unified.

- X =:= Y will succeed if the numeric values of X and Y are equal

- X == Y will only succeed if X and Y have already been instantiated to syntactically identical formulae

- If something is proven once with a certain set of facts it will stay true even after learning new things

  ```
  All people are mortal
  Harry is a peron
  Therefore Harry is mortal
  
  Now I discover that Paul is a person
  Now we can prove that Paul is mortal and Harry is (still) mortal
  
  mortal(X):-
  	person(X).
  	
  person(Harry).
  
  mortal(Paul). // Will return false as by default undefined statements are false
  mortal(Harry). // Will return true as Harry is a person
  
  person(Paul).
  mortal(Paul). // Will return true as we now know that Paul is a person
  mortal(Harry). // Will return true as Harry is (still) a person
  ```


<<<<<<< HEAD
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













- Lambda of a function reverses the calling order.
=======
>>>>>>> 278936bf27b9b4f49fcb2625809132a87dd64460

## Week 9
