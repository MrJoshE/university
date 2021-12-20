### Evaluation Strategies



- Every programming language needs a specific strategy (fixed order) for evaluating expressions.
- Consider the following program:
  - Fact x -- as Lacture 12 - unsafe with a negative argument
  - first x y = x 
- What is the result of:
  - first 2 (fact (-4))

##### Evaluation By-value (eager evaluation)

- A redex is evaluated only if the expression which constitutes its argument part is already a value.
- So, in this expression
  - first 2 (fact (-4))
- this strategy will try to evaluate fact (-4) first

##### Evaluation By-name

- A redex is evaluated before its argument part
- This time, with the same expression:
  - first 2 (fact (-d))
- The redex first is evaluated before its argument part to give:
- 2

##### Lazy Evaluation

- Consider the following expression
  - add (first 2 3) (first 2 3)
- In evaluation by name the edex first 2 3 will need to be evaluated twice
  - (first 2 3) (first 2 3)
- The lazy strategy proceeds by name, but the first time that a 'copy' of a redex is encountered, its value is saved in case it is needed again later.



#### Two important theorems

##### Theorem

- Let exp be a closed expression. If exp reduces to a primitive value, val, using any of the above three strategies, then exp reduces to val following the by-name strategy. If exp diverges using the by-name strategy, then it also diverges under the other two strategies.
  - 'Closed' means thay all of its variables are bound.

##### And

- Once any strategy has been fixed in a given environment, the evaluation of all occurrences of a single expression always yields the same value.
  - This property can be taken as a *criterion* for a pure functional language. It is the property that enables us to *reason* about a functional program.



#### What can we compute with a functional langauge?

- The above mechanisms are sufficient to express programs for *every* computabl function.
- That is, they constitute a *Turing* complete language



#### Summary

- A (pure) functional language has no commands, only expressions
- The two core components are functional abstration and functional application
- Strategies to evaluate an expression that will contain a mixture of function names and data values
  - Search for the definition of a name
  - Apply the definition to an argument
  - Repeat if/until we have reduced the expression to its simplest form
- The order in which we both search and evaluate is important.
  - Need to know the difference between by-value and by-name strategies.

