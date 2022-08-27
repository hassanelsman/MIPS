# Single-Cycle-MIPS-Processor
implementation of a 32-bit single-cycle microarchitecture  MIPS processor based on Harvard Architecture. The single-cycle microarchitecture executes an  entire instruction in one cycle. In other words instruction fetch, instruction decode, execute,  write back, and program counter update occurs within a single clock cycle.
# 32-bit MIPS general purpose integer microprocessor & config it on FPGA


## Phases:

### 1-Block diagram:
In this project, we are aiming to implement a 32-bit single-cycle microarchitecture MIPS processor based on Harvard Architecture. The single-cycle microarchitecture
executes an entire instruction in one cycle. In other words instruction fetch, instruction decode, execute, write back, and program counter update occurs within a single clock cycle. 

Referring to figure, you are required to write the RTL Verilog files for all submodules of the MIPS processor (e.g. Register File, Instruction Memory, etc.). Then, implementing the top module of the MIPS processor. Finally, you will configure this processor 
on Cyclone® IV FPGA device. 



![Capture](https://user-images.githubusercontent.com/111699435/185966751-9ae2e551-192a-43e7-bf02-d0751df9fa58.PNG)

-------------------------------------------------------------------------------


### 2- Write RTL modules in Verilog and instantiate in TOP


![Capture PNG2](https://user-images.githubusercontent.com/111699435/185965849-344c1115-ab37-4acc-98bf-b4beb9dde493.PNG)

----------------------------------------------------------------------

### 3- Simulate the TOP in Modelsim with 3 different programs: Factorial program, GCD of two numbers program and Fibonacci sequence program


#### program1: GCD of (180, 120)

--------------------------------------------------

![P1](https://user-images.githubusercontent.com/57576607/187049864-f360a926-5f60-48db-8faf-71d2dc0e4218.PNG)

#### program2:  Factorial of "7"
--------------------------------------------------


![P2](https://user-images.githubusercontent.com/57576607/187049905-a6b3056f-2a7c-4db4-b8e3-6c251f4c0afc.PNG)


#### program3:  Fibonacci sequence program

--------------------------------------------------
![P3](https://user-images.githubusercontent.com/57576607/187049900-1b815575-4a91-4682-b615-20140fb9bc4c.jpeg)

-----------------------------------------------------------------------------





### 4- Configurated it on Cyclone IV FPGA Kit using Intel® QUARTIS PRIME

![syn](https://user-images.githubusercontent.com/111699435/185966450-d8a35f5e-755c-45b7-8e74-4b7af9e922be.PNG)
----------------------------------------------------------


### Resources :David M. Harris, Sarah L. Harris - Digital Design and Computer Architecture
