### Greedy Algorithms

- Build up a soluion incrementally in small steps using some **local decision rule**
- make a decision at each step just based on the solution so far
- Probably the most ismple and straight forward way to design an algorithm

**Key feature**:

- Only ned to see the solution so far to make a decision about what to do next.
- **The sequence of decisions about what to do next leads to an optimal solution**.

**The General Scenario**:

- There is a collection of items, we need to select some to optimize something.
- **Consider items in some order, consider each in turn, and select it if it compatible with the previous selections**



##### **Greedy Algorithm Template**

- Consider items in a **particular order**
  - The initial step may involve a preprocessing step of sorting the items if they are not already sorted.
- Take each item provided it is **compatible** with the ones already taken, otherwise discard it.
  - There will be some check on the item and the solution so far
- Continue until all items have been considered or a solution is reached.

**It is essential that the items are considered in the correct order to get the optimum solution**.



##### **Coin Change problem**

**Problem: **Find the maximum number of coins to make a specific amount ***n***

**Coin denominations:** 1,2,5,10,20,50,100,200. 	We have as many of each coin as we need.

**Greedy Algorithm:**

- Sort the denmoniations from largest to smallest
- Keep taking the largest coin that fits into the remaining amount
- Stop when you have the exact amount

**Example:** Coints to make n=582

- Take 200, 382 remaining
- Take 200, 182 remaining
- Take 100, 82 remaining
- Take 50, 32 remaining
- Take 20, 12 remaining
- Take 10, 2 remaining
- Take 2, 0 remaining

**Solution:** {200,200,100,50,20,10,2} : **7 Coins**



