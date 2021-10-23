### Interval Scheduling: Analysis

**Theorem:** Greedy algorithm based on earliest finish time is optimal.

**Proof: ** Let S* be any optimal schedule and $j_1, j_2, ..., j_m$ denote the jobs in it.

- Let S be the output of algorithm and $i_1, i_2, ..., i_k$ denote jobs **selected** by the greedy algorithm. As **S*** is optimal k<= m.
- If S* and S agree up to index r, ie $i_1 = j_1 , i_2 = j_2 , ..., i_r = j_r$ then we can construct another optimal solution from S* by replacing $j_r+1$ with $i_r+1$ , see below, hence we have an optimal solution which agrees with S up to $r+1$.
- Repeating this procedure we end up with an optimal solution S** that agrees with S for its k first elements.

**We know need to show that m = k**

- We know already that k <= m but k < cannot happen because:
- In that case, there would be at least one job left, namely j_(k+1) that is compativle with $i_k$ and has a later finish time.
- However the freedy algorithm runs until all such jobs are selected 
- Therefore k < m cannot happen and k = m
- Hence S = S** and S is optimal solution.

