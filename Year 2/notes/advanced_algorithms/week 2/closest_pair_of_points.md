**Advanced Algorithms Week 2**



***

**Closest Pair of Points**

- Given n points in the plane, find a pair with the smallest Euclidean distance.

***

**D&C Algorithm for Closest Pair of Points on a Plane**

**Pre-processing**

- **Sort** - points according to x-coordinate (do this once at the start)
- **Sort** - points according to y-coordinate (do this once at the start)

***

- **Divide** - Draw a vertical line L so that roughly n/2 points are on each side.
- **Conquer** - Recursively find the closest pair in each side of line L.
- **Combine** - Find closest pir with one point in each side.

Return the closest pair from three indentified pairs.

***

**Time Complexity**

O(n log n)

