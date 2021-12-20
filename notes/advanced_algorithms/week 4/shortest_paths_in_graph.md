### Shortest Paths In a Graph



##### Shortest Path Problem

**Shortest Path Network**

- Directed graph G = (V,E)
- Source **s**, destination **t**
- Length $l_e$ = length of edge **e**

**Shortest Path Problem** = find the shortest directed path from **s** to **t**

**Dijkstra's algorithm**

1. Maintain a set of **explored nodes** S for wich we have determined the shortest path distance **d(u)** from **s** to **u**

2. Initialize S = {s} and d(s) = 0

3. For all reachable nodes v' (ie those that can be reached by a single edge from **S**) calculate: current distance away from start + length of edge to get to v

4. Repeatedly choose unexplored node v which minimises the previous step, add v to S and set d(v) = $\pi(v)$

   

##### Dijkstra's Algorithm: Proof of Correctness

Theorem: For each node u in S, d(u) is the length of shortest s-u path

Proof (by induction on |s|)

- Base case |S| = 1 is trivial
- Induction Hypothesis: Assume true for |S| = k >= 1

