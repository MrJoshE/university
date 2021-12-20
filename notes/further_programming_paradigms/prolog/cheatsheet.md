# Cheat Sheet



### Clauses

Prolog programs are made up of facts and rules. Facts and rules are called clauses.

#### Facts 

A fact is a predicate followed by a dot. And predicate is the name given to the word occuring before the bracket in a fact or rule.

Examples:

```
bigger(cat, rat).
```

It can be read as cat is bigger than rat. The intuitive meaning of a fact is that this is true.

#### Rules

Rules allow us to understand that a property or relationship holds based on preconditions.

A rule consists of a **head** (a predicate) and a **body** (a sequence of predicates separated by commas). They are separated by the sign :- and has to be terminated by a .

 Example of rule logic:

```
For all X and Y
	if X is a mother of Y
	X is a parent of Y
```

What this translates to in Prolog

```Prolog
parent(X,Y):-mother(X,Y).
```

If the **body**, which is mother(X,Y), is **true** the the **head**, which is parent(X,Y), is also **true**.



### Atoms

Usually strings made up of lowercase and uppercase letters, digits and underscores, starting with a lowercase letter.

Examples below are all valid atoms:

```
Atoms -> elephant, b, abcXYZ, x_123
```

Also any series of arbitrary characters enclosed in single quites denotes an atom such as:
‘This is a Prolog atom’



### Variables

Variables are strings of letters, digits, and underscores starting with a capital letter or an underscore.

```
Variables -> X, Elephant, _4771, X_1_2, MyVariable, _
```

The last one of the above examples (the single underscore) constitues a special case. It is called the anonymous variable and is used when the value of a variable is of no particular interest.



### Compound Terms

Compound terms are made up of a functor (a Prolog Atom) and a number of arguments enclosed in parentheses and separated by commas. 

Examples below are all valid functors:

```Prolog
is_bigger(horse, X), f( g(X,_), 7), 'My Functor'(dog)
```

In Prolog, the word functor is used to refer to the atom at the start of a structure, along with its arity (the number of arguments it takes).

For example:

```Prolog
likes(mary, pizza)
likes/2 is the functor
```

### Examples

**Recurive rules** (predecessor relation)

The whole definition can be expressed within 2 rules. Rule 1: Will define the direct (immediate) predecessor and Rule 2: Will define the indirect predecessor. We can say that some X is an indirect predecessor of some Z if: there is a parentshipchain of people between X and Z.



Rule 1:

```Prolog
predecessor(X,Y):-parent(X,Y).
```

Rule 2:

```Prolog
predecessor(X,Z):-parent(X,Y),parent(Y,Z).
```

Test:

```Prolog
// rules.pl

parent(10,5).
parent(5,4).

predecessor(X,Y):-parent(X,Y).
predecessor(X,Z):-parent(X,Y),parent(Y,Z).
```

Terminal:

```bash	
sicstus
```

SISCtus:

```Prolog
consult(‘rules.pl’).
predecessor(10,4).
predecessor(10,5).
predecessor(4,10).
```

Output:

```Prolog
Yes
Yes
Yes
No
```

