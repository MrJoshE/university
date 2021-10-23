### Scheduling to Minimise Lateness

##### Minimizing Lateness Problem

- Single resource proccesses one job at a time.
- Job j with duration $t_j$ has to be finished by deadline $d_j$.
- If we start j at time $s_j$, then it finishes at time $f_j = s_j + t_j$
- **Lateness: ** $l_j$ = max {0, $f_j - d_j$}.
- Goal: Schedule all jobs to minimize maximum lateness L = max $l_j$



##### Greedy Algorithm for Minimizing Latesness Problem

- Take jobs in the ascending order of earliest deadline

``` pseudocode
Sort n jobs by deadline so that d1 < d2 < ... < dn

t = 0 // stores the finish time of the previous job

for j = 1 to n 
	Assign job j to interval [t, t + t_j]
  s_j = t
  f_j = t + t_j
  t = t + j+j
output intervals [s_j, f_j]
```



##### Greedy Schedule: No Idle Time

**Definition**	Machine is in idle time if it is no working although not all jobs have been processed yet.

**Fact**	There exists an optimal schedule with no idle time.