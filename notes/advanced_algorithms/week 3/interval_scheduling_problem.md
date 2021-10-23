### Interval Scheduling Problem

- Job *j* starts at time $s_j$and finishes at $f_j$
- Two jobs are **compatible** if they don't overlap
- Goal: find **maximum size subset of mutually compatible jobs**



##### Greedy Algorithm Template

- Consider jobs in a particular order.
- Take each job provided it is compatible with the ones already taken.



##### Greedy Algorithm for Interval Scheduling Problem

- Consider jobs in the order of earliest finish time.
- Take each job provided it is **compatible** with the ones already taken.

```pseudocode
Sort by finish times so that f1 < f2 < ... < fn

J = []

for j = 1 to n {

	if (job j compatible with J){
		J.push(j)
	}
	
}

return J
```

- Running time: O(n log n) time due to the sorting step.