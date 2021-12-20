### Weighted Interval Scheduling 

##### Weighted Interval Scheduling Problem

- Interval or job j starts at time $S_j$, finishes at time $f_j$ and has weight (value) $v_j$
- Two jobs are compatible if they dont overlap
- Goal: find maximum weight subset of mutually compatible jobs.



Assume jobs are sorted by their **finishing time**: f1 < f2< fn

**Defintion** p(j) = greatest index i< j such that job i is compatible with j.

**What it means**:

What is the index of the largest job that a given job is compatible. For a job to be compatible, its start time must be after the finish time of the other job. So if job $i$ starts at time = 3 and finishes at time = 8 and job $j$ Starts at time = 8 and finishes at time = 11. These jobs are compatible therefore p(j) = i.

**Example Finding the optimal set of jobs**

**See image in folder.**

Initially Job 1 is taken. Job 2 is dismissed as p(3) = 1 therefore we are maximising the efficiency by not including job 2 and If Job 2 would be run, it would run in through job 3 which we dont want. Next Job 4 is taken. Job 5 is then dismissed because it will not finish before Job 6 is meant to start. Job 6 is then taken, Job 7 is dismisse because it has the same weight as job 6 therefore it is un needed to maximise efficiency.



#### Dynamic Programming

General Idea:

- Try to break down the problem into a smaller recursive version of itself (top-down)
  - This can often be done by thinking about properties that an optimal solution must possess.
- Cache (memoize) result of smaller problems to avoid costly recalculation
- Recast into a bottom-up form by first computing all smaller subproblems.
- Dynamic programming is efficient if all subproblems can be computed efficiently, ie if subproblems grow at most polynomially with problem size n.