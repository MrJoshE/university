### What is Functional Programming



- A functional language has **no commands, only expressions**
- Apart from possible values and primitive operations for data, the only 2 components are 
  - Abstraction: Given an indentifier x (variable) and an expression exp, we can produce a function that transforms x into exp: f_exp x = exp
  - Application of an expression f_exp to another expression a_exp, written as f_exp a_exp, whcih denotes the application of the function (denoted by) f)exp to the argument (denoted by) a_exp
- a_exp can be a function, and f_exp a_exp may return a function. Perect homogeeity between programs and data.

##### Examples

funy x = 2*x + 1	  -- Abstraction

funy 3 = 2 * 3 + 1	-- Application

##### Semantics of Computation - Evaluation

- In functional programming, computation essentially consists of repeating the application of two operations to simplify expressions until they reach a simple form that immediately denotes a value.
- Search to find the *definition* associated with an identifier. Replace the identifier with its definition.
- Apply a functional expression to an argument - the $\beta$ rule.
  - We will come back to this next week, but the mathematical representation for this is: $(\lambda x.M)N = M(x:= N)$
  - Which basically means substitution of N for all occurrences of x in M.



