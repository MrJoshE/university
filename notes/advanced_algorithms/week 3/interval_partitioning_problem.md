### Interval Partitioning

- Lecture j starts at $s_j$ and finishes at $f_j$
- Goal: find a miniumum number of classrooms to schedule all lectures so that no two occur at the same time in the same room.

##### Greedy Algorothm for Interval Paritioning Problem

- Consider lectures in the order of earliest time
- Assign lecture to any compatible classroom.

```pseudocode
Sort lectures by start time so that s1 < s2 < ... sN.

allocated_classsrooms = 0

for j = 1 to n {
	
	if (lecture j is compatible with some classroom k){
		schedule lecture j in classrrom k
	}
	else {
		allocate a new classrrom to allocated_classrooms + 1
		schedule lecture j in classroom allocated_classrooms + 1
		allocated_classrooms = allocated_classrooms + 1		
	}

}


```

- Running time: O(n log n) due to sorting step.