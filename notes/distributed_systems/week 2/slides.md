# Week 2

## Basic Abstractions
- Processes
  - Abstract computing entity
  - E.g physical machines, OS processes
- Channels / links
  - Abstract point-to-point network links
  - E.g UDP, TCP, etc
- Failure detectors
  - Abstract time


## Processes
- A distributed system is made of a *finite* set of processes: each process models a sequential program
- Processes have unique identities and know each other
- Every pair of processes is connected by a channel (link) through which the processes exchange messages
- A process executes a step at every tick of its local clock
- A step consists of:
  - Receiving a message (external input)
  - Performing a local computation
  - Sending a message (external output)
- If no work needs to be done, then th estep is a no-op

## Inside a process
- The program of a process is made of a finite set of modules or components organised as a software stack
- Components within the same process interact by exchanging events
  - Events can be viewed as local messages
  - Events are handled by procedures (actions) called event handlers

```elixir
 upon event <co, Event1 | attr1, attr2,...> do // local computation
trigger <co, Event2, | attr3, attr4,...>
```

## Specifying a Distributed Service
- Service (abstraction) is specified as a black-box component supporting:
  - Interface (API / contract)
    - Request and indication of events
  - Correctness properties (semantics)
    - Safety and liveness
  - Environment assumptions (aka model, power of the adversary)
    - Failures and synchrony

## Correctness Properties

- Behaviour (aka execution or history) of a service is a sequence of request and indication events of the service interface.
- Property is a set of behaviours (implied by the property formulation)
- Example: No message is delivered by a process more than once

## Safety and Liveness
- Two important classes of properties: safety and liveness
- Safety is a property which states that nothing bad should ever happen
- Liveness is a property which states that something good should eventually happen.

Example: Correctness of traffic lights at an intersection.
- Safety:
  - Only one direction should have a green light
- Liveness
  - Every diretion should eventually get a green light

Example 2: Correctness of Air Traffic Control
- Safety:
  - Any two aircrafts must maintain vertical separation of at least 300 meters
Liveness:
  - If a vertical seperation between two aircrafts falls below 400 meters issue an alert to the pilots of the involved aircrafts

## Safety and Livenes: Basic facts
- A property can be either:
  - Safety
  - Liveness
  - Neither safety or liveness
- If a property P is safety, then P is not liveness
- Any prpoerty can be expressed as an intersection (conjunction) of a safety and liveness property

Example: Tell the truth
- Neither safety nor liveness
- Conjunction of safety and liveness:
  - Having to save something is liveness
  - Not lying is safety

Example: Reliable broadcast
- Ensure that a message sent to a group of processes is received by all or none
- Liveness: Every *finite* behaviour has an extension of satisfying the property

Example: Atomic commit
- Ensure that all processes reach a common decision on whether to commit or abort a transaction
- Neither safety or liveness
- Conjunction of safety and liveness:
  - Liveness: Every process eventually reaches a decision
  - Safety: All decisions are the same (either commit or abort)

