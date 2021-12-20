### Abstract Machines Examples

##### Memory

- Various levels of memory:
  - Secondary memory
  - Primary memory
  - Cache and registers
- Phsyical memory permits the storage of data and programs
- Data is dvided into primitive types (e.g integers, 'reals', characters)
- Different physical represntations are needed for different types of data
- The different types of data that can be manipulated directly by the operations provided by the hardware are known as predefined types.

##### CISC vs RISC

- Complex instruction set computer (CISC)
  - Fewer instrcutions, some of which are quite complex and can take multiple cycles to execute

- Reduced instruction set computer (RISC)
  - Many instructions, which are simple enough to be executed in a few cycles (possibly just one)



##### Implementation of an Abstract Machine

- Each device must have some implementation of an Abstract Machine
- Implementation in hardware 
- Simulation using software
- Simulation (emulation) using firmware

##### Implementation: The ideal case

- Suppose we have a new language L for whcih we require an abstract machine 
- Implementing this directly in hardware would be most efficient but is inflexible as it ties us to a specific hardware configuration) (would only work on the hardware it was designed for)
- So we would try to find an already implemented host machine 
- We can implement L through a translation to this intermediate language.

We have two alternative ideal forms:

- purely interpreted implementation
- purely compiled implementation

