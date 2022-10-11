# Week 1

## 2 Generals Problem

What is it?
- Situation is outlined where 2 generals that are waiting to attack the enemy between them but they have no reliable way of communicating. It is suggested that they send a messenger through the camp but we wouldn't know if the messenger would survive the trip so there is no confirmation of the attack.

Meaning behind it:
- 2 nodes cannot communicate when the means in which they are communicating is not reliable.


## Consensus
What is?
- The problem of agreeing on an outcome
- Situations on multiple nodes propose a value and one of the proposed values is accepted by all and chosen.

Example:
Node 1 proposes A
Node 2 proposes B
Node 3 proposes C

Node 1, 2 and 3 all agree on A.
This is an example of a consenus because A was one of the proposed values and all of the nodes have agreed to accept it.

Is concensus solvable?
- It depends on the assumptions

Consensus is important
- Databases
  - Every transaction needs to be atomic / boolean (happens or it doesn't)
  - But the data updated by the transaction might be distributed across multiple nodes
  - For a transaction to commit or abort, all these nodes must agree to do their part

Use a kind of consensus: atomic commmit
Only 2 proposed values {commit, abort}

## Broadcast Problem

- What is it?
  - Total Order Broadcat (Atomic Broadcast)
  - A node can broadcast a message
  - If a node is correct (does not crash), all corret nodes deliver its messages
  - All correct nodes deliver the same set of messages
  - Messages are delivered in the same order

Atomic Broadcast is important
- Data replication
  - Data is replicated at multiple servers (processes)
  - Ensure all replicas execute the same sequence of updates
    - Replicated State Machine

- Use atomic broadcast to disseminate the updates
  - Challenging when the nodes may crash

## Atomic Broadcast <--> Consensus

- Given atomic broadcast can we use it to solve consensus
  - Every node broadcasts its proposal (Atomic Broadcast)
  - Messages are received in the same order (Atomic Broadcast)
  - All nodes will decide the same (Consensus)

- Given consensus can we use it to solve atomic broadcast?
- yes

