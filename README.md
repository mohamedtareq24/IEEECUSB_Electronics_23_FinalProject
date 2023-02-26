# Single Cycled RV32I with UART Tx 

This readme file will demonstrate how the RV32I can be implemented using Verilog HDL also will show the final system architecture.
the file is divided into 3 major points, and they are.

 - A - The Program we suggest implementing 
 - B - The architecture 
 - C - Useful guidelines and references 

### A- The Program
throughout the file, the following simple counter program will be implemented. 
```
#include <stdio.h>

void main()
{
    int x10,x12;
    x12 = 255;
    x10 = 0 ;
    
   while (x10 < x12){  x10++;
    printf("%d",x10);
    }
}
```
which compiles to 
```
addi x12,x0,255  # initialize x12 with 0x00_00_00_ff
addi x10,x0,0    # initialize x0  with 0x00_00_00_00
while:
addi x10,x10,1
slli x13,x10,2
sw x10,0(x13)
bne  x10,x12,while # while (x10<=x12) x10 = x10++;

addi x0,x0,0    #no op
```
and assembles to 
```
0x0ff00613
0x00000513
0x00150513
0x00251693
0x00a6a023
0xfec51ae3
0x00000013
```

### B- The architecture 
![image](https://user-images.githubusercontent.com/90535558/214970655-d3511e4d-e122-4e70-b4b2-924935b57182.png)
#### system top
![image](https://user-images.githubusercontent.com/90535558/221443588-df5ef055-5b3c-43e4-b24f-20c287646c95.png)
Hint : out is a tap for the data port in the data memory; in this program as it counts we tap or "probe" the least significant byte 
### The archricture will be devided into 3 parts 
- The datapath
- The controller 
- The UART Tx

### C- Useful guidelines and references 
- RISC-V ISA summary:  http://pages.hmc.edu/harris/ddca/ddcarv/DDCArv_AppB_Harris.pdf
- RISC-V assembler: https://riscvasm.lucasteske.dev/
- RISC-V simulator : https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/ 
- Data Path and Controller method by Paul Franzon : 
  * https://www.youtube.com/watch?v=AuRLmvclsU8&ab_channel=NCSUDigitalASIC 
  * https://www.youtube.com/watch?v=QQ2O9D6syWw&ab_channel=NCSUDigitalASIC
- David Harris RV-32I implementation & testing:    
  * https://www.youtube.com/watch?v=a8yewzP-kJc
  * https://www.youtube.com/watch?v=ouwuXl5AG-k
 - DDCA : https://www.amazon.com/Digital-Design-Computer-Architecture-RISC-V/dp/0128200642 Chapter 7 & 6
