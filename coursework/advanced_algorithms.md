## **Coursework - Josh Everett URN: 6621182**

***

List of points S for Question 1:
    
index: 0, coordinates: (2.0, 4.0)
index: 1, coordinates: (-1.0, -4.0)
index: 2, coordinates: (-2.0, -6.0)
index: 3, coordinates: (7.0, 7.0)
index: 4, coordinates: (-5.0, 2.0)
index: 5, coordinates: (3.0, 3.0)
index: 6, coordinates: (-7.0, 1.0)
index: 7, coordinates: (0.0, -8.0)

***

List of intervals for Question 2:

name A: start: 9	 finish: 14	  value: 7
name B: start: 5	 finish: 11	  value: 8
name C: start: 15	 finish: 19	  value: 4
name D: start: 7	 finish: 13	  value: 3
name E: start: 10	 finish: 16	  value: 7
name F: start: 6	 finish: 8	  value: 8
name G: start: 7	 finish: 12	  value: 7
name H: start: 9	 finish: 15	  value: 4



***

#### **Section 1**

index: 0, coordinates: (2.0, 4.0)
index: 1, coordinates: (-1.0, -4.0)
index: 2, coordinates: (-2.0, -6.0)
index: 3, coordinates: (7.0, 7.0)
index: 4, coordinates: (-5.0, 2.0)
index: 5, coordinates: (3.0, 3.0)
index: 6, coordinates: (-7.0, 1.0)
index: 7, coordinates: (0.0, -8.0)

What S looks like with the seperators:  6, 4 **LL** 2, 1 **L** 7, 0 **LR** 5, 3 

1. Comma-separated indices of points when sorted by x-coordinate: **6,4,2,1,7,0,5,3**

2. x-coordinate of dividing line L in the first call to MinDist (first level of recursion):
  L = **-0.5**

3. Comma-separated indices of points to the left of L: P L = **6,4,2,1**

4. Comma-separated indices of points to the right of L: P R = **7,0,5,3**

5. x-coordinates of the dividing lines L L and L R for the two calls to MinDist in the
  second level of recursion:
  L L = **-3.5**
  L R = **2.5**

6. Comma-separated indices of points to the left of L L : P LL = **6,4**

7. Comma-separated indices of points to the right of L L but left of L: **2,1**

8. Comma-separated indices of points to the left of L R but right of L: P RL =**7,0**

9. Comma-separated indices of points to the right of L R : P RR = **5,3**

10. Comma-separated indices i of the points S L that are in the δ-strip around L L
    (leave empty if none): **4,2**
    **Notes:** This questions asks to find the indicies of the co ordinates that are within δ distance of L L (which is the line that seperates the 4 co ordinates to the left of the middle of the list of co ordinates, or in my case the line that seperates 6,4 **LL** 2,1). What we done here was took these 4 co ordinates, put them throught the MinDist procedure which will divide the co-ordinates recursively and takes the smallest distance that there was and uses this smallest distance so get the make boundaries either side of the seperation line (what the delta strip is), in this case its min dist of $\sqrt((7-2)^2 + (1-2)^2) = 2.23 $ $\sqrt((2-1)^2 + (6-4)^2) = 2.23 $ therefore 2.23 (as its the smallest distance) units either side of LL. The 2 co ordinates that are within these bounds are the co ordinates at indexes **4 and 2**.

11. Minimal distance δ L between all points to the left of L: SL
    δ L = **5**

    **Notes:** This question asks you to take the co ordinates from the last question, sort them into acending order by ‘y coordinate’ and get the minimum distance between them, in this case its only the distance between co-ordinates at indexes 4 and 2.

12. Comma-separated list of indices i of the points S R that are in the δ-strip around
L R (leave empty if none): **2,1,7,0,5,3**
13. Minimal distance δ R between all points to the right of L:
SR
δ R = **1.414**
14. Comma-separated list of indices i of the points that are in the δ-strip around L
(leave empty if none): **1,7**
15. Overall minimal distance δ = **1.414**

***

#### Section 2

name A: start: 9	 finish: 14	  value: 7
name B: start: 5	 finish: 11	  value: 8
name C: start: 15	 finish: 19	  value: 4
name D: start: 7	 finish: 13	  value: 3
name E: start: 10	 finish: 16	  value: 7
name F: start: 6	 finish: 8	  value: 8
name G: start: 7	 finish: 12	  value: 7
name H: start: 9	 finish: 15	  value: 4

1.  Sort by finish times:

   F, B, G, D, A, H, E, C

2. **p1 = 0 , p2 = 0, p3 = 0, p4 = 0, p5 = 1, p6 = 1, p7 = 1, p8 = 6**

3. **m1 = 8, m2 = 8, m3 = 8, m4 = 8, m5 = 15, m6 = 15, m7 = 15, m8 = 19**

4. **C,A,F**