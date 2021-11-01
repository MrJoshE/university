### Abstract Machines



##### Definition of an Abstract Machine

- An *Abstract Machine* is an abstraction of the concept of a physical computer.
- Abstract Machine is needed to execute *Algorithms*
- These *Algorithms* need to be formalized in a construct provided by a programming language.
- So a program in language *L* is a finite set of instrcutions written in *L*

![alt-text]([struture_of_abstract_machine.png](https://github.com/MrJoshE/university/blob/master/notes/further_programming_paradigms/struture_of_abstract_machine.png))

##### Operations carried out by the Interpreter

1. Operations for processing primitive data
2. Operations and data structures for controlling the sequence of exeution of operatins.
3. Operations and data structures for controlling data transfers
4. Operations and data srtrcutures for memory management.

##### Execution Cycle of a Generic Interpreter

````dart
// When the cycle starts there will be some indicator of the location of the next 
// instruction to execute. This could be the memory location of the instrcution stored
// in the PC (program counter)
void startCycle(int locationOfNextInstruction){
	
  // fetches the instruction at the memory location.
	var currentInstruction = fetch(locationOfNextInstruction);
  
  // decodes the current instruction into OPCODE and OPERAND.
  var decodedInstruction = decode(currentInstruction);
  
  // Checks the OPCODE to check if its HALT which if so would stop the program.
  if (decodedInstruction.opcode == HALT){
    return;
  }
  // Execute the opcode on the operand.
  var result = execute(decodedInstruction.opcode, decodedInstruction.operand);
  
  // Stores the result
  store(result);
  
  startCycle(locationOfNextInstruction + 1)
 
}
````



##### High Level and Low Level Languages

- Those languages whose abstract machines are very close to, or coincide with, the physical machine are **Low Level Languages**.
- Those languages which support the use of constructs that use appropriate abstraction mechanisms to ensure that they are independent of the physical characteristics of the computer are **High Level Languages**.

##### Summary

- All abstract machines require an **Interpreter** that enables them to be executed on a physical machine.

