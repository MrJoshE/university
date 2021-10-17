**Advanced Algorithms Week 2**



***

**Counting Inversions**



**Inversion**: A pair of elements that are out of their natural order.

**D&C Algorithm for Counting Inversions**

- Input: List S with n elements. **[1,5,4,8,10,2,6,9,12,11,3,7]**
- Divide: Split the input list into two sublists of similar size
- Conquer: Recursively count inversuibs at eacg sublist
- Combine: Count inversions where al and aj are in different sublists
- Return the total sum of inversions.



**Process using merge sort:**

inversion counter: **ic = 0**

[1,20,6,7,5,8,11,3]

[1,20,6,7], [5,8,11,3]

…

1, 20, 6, 7, 5, 8, 11, 3

**Stage 1**

- [1,20], 1 is less than 20 so no inversion.

- [6,7] 6 is less than 7 so no inversion.

- [5,8] 5 is less than 8 so no inversion.

- [3,11] 11 is greater than 3 so there is an inversion therefore **ic++ (1)**.

**Stage 2**

- [1,20] compared with [6,7]:
- Initially the left pointer is at index 0 (1) and the right pointer is at index 0 (6).

- 1 is less than 6 so no inversion, this also means that 1 is less than all other values in this array so no need to keep checking.

- The pointer of the left array is incremented to index 1 (20), 20 is compared with 6 and because 20 is greater than 6 there is an inversion. 
- **ic++(2)**. 
- Right pointer is incremented to index 1 (7).
- 20 is compared with 7 which because it is greater there is a inversion therefore the **ic++ (3).**

- Now because all inversions have been made the array is sorted and combined.

**This process continues…**

- [5,8] is compared with [3,11]

- Initially the left pointer is at index 0 (5) and the right pointer is at index 0 (3).

- 5 is compared with 3, 5 > 3 therefore everything to right of 5 in this array is greater than 3 so there is there is an inversion for the amount of elements after and including 5. In this case there is 1 element after 5 so there are 2 inversions that occur here. 
- **icc=icc+2 (5)**.

- The right pointer is incremented to index 1 (11). 
- 5 is compared with 11, 5 < 11 therefore there are no inversions here. 
- Left pointer is incremented to index 1 (8). 
- 8 is compared with 11, 8 < 11 therefore there are no inversions here.

- Now because all inversions have been made the array is sorted and combined.

**Stage 3**

We start with [1,6,7,20] and [3,5,8,11] with ic=5

- 1 is compared with 3, 1 < 3 so there is no inversions.

- Left pointer is incremented to index 1 (6).
- 6 is compared with 3, because 6 > 3 there is an inversion for all of the elements including and to the right of 6 in the left array.
- **ic=ic+3 (8)**.
- Right pointer is incremented to index 1 (5).
- 6 is compared with 5, because 6 > 5 there is an inversion for all of the elements including and to the right of 6 in the left array. 
- **ic=ic+3 (11)**
- Right pointer incremented to index 2 (8).
- 6 is compared with 8, because 6 < 8, there is no inversion.
- Left pointer is incremented to index 2 (7).
- 7 is compared with 8, because 7 < 8 there is no inversion inversion.
- Left pointer is incremented to index 3 (20).
- 20 is compared with 8, because 20 > 8 there is an inversion for 20 and all elements to the right of 20 in the left array.
- **ic++ (12)**

- Left pointer is incremented to index 3 (11).
- 20 is compared with 11, 20 > 11 therefore there is an inversion for 20 and all elements to the right of 20 in the left array.
- **ic++ (13)**

**Complete with 13 inversions at O(n log(n))**

