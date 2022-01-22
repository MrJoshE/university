# Exam Revision



## Week 1 - Divide and Conquer



- Aspects of a divide and conquer algorithm
  - A base case
  - A way of combining solution  s to smaller problems
  - A way of dividing a problem into smaller problems
  - Recursive calls
  - The algorithm always terminates
- Other facts
  - Quicksort and Mergesort are divide and conquer algorithms
  - The master theorem gives the complexity for divide and conquer algorithms
  - A divide and conquer algorithm can have more than 1 base case
  - A divide and conquer algorithm always terminates after a finite number of steps.

- Merge sort $0(n log n)$
  - Input: List S with n elements
  - Divide: Split the input lidt into two list s of the similar size
  - Conquer: Recursively sort the two sublists by repeating the algorithm
  - Combine: Merge both sorted sublists into one sorted list.
  - Base Case: A list with 1 element or (0), The list is already sorted and can simply be returned.
- Quick sort 
  - Input: List S with n elements
  - Divide: Pick a pivot element P, e.g the last element of the list, rearrange the input list into 2 sublists: - one list with all values <= p; another list >= p
  - Conquer: Recursively sort the 2 lists by repeating the algorithm
  - Combine: Stick both lists together using P
  - Base Case: List with only 1 element - automatically sorted.
  - Time complexity: 
    - Average case: 0 (n log n)
    - Worst case: 0($n^2$)



## Week 2

- Divide and conquer complexity

  - $T(n) = a * T(n/b) + f(n)$ where
  - $a$ : number of subproblems created in one recursive call
  - $n/b$ : size of each subproblem (n is the size of the input problem)
  - $f(n)$ : additional work outside recursion
  - $f(n) = O(n^c)$

- Master Theorem

  - $T(n) = a * T(n/b) + f(n)$

  - $T(1) = c$

  - where $a,b,c$ and $k$ are all constants, solves to:

  - if $c < log_ba$ or $b^c < a$ then $T(n) = O(n^(log_ba)$

  - if $c = log_ba$ or $b^c = a$ then $T(n) = O(n^c * log n)$

  - if $c > log_ba$ or $b^c > a$ then $T(n) = O(f(n))$

- Examples

  ```
  If T(n) = a T(n/b) + O(n^c) then what does the master theorem state about T(n)?
  - It depends on how c compares with log_b(a)
  
  If T(n) = 3 T(n/2) + O(n) then what does the master theorem state about T(n)?
  - a = 3, b = 2, c = 1 (c = 1 because c f(n) = O(n^c), therefore n = 1) 
  - T(n) = O(n^(log_2(3)))
  ```

  