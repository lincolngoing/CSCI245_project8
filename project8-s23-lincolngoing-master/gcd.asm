// Made by Lincoln Going
MOVI 18 R1
check: //this checks to see if the loop should run
MOV R1 R3 //move i into R3
MOVI 24 R2
IDIV R3 R2 //div 24 by i
MOVI loop R6
JNZ R2 R6 //if 24 div by i is > 1 continue the loop
HALT

loop:
MOVI 180 R2
PUSH R2 //push parameter 180
PUSH R1 // push parameter i
MOVI gcd R6
JAL R6 //jump and link to gcd
OUT R1
POP R1 //place i in R1
MOVI 1 R5
SUB R5 SP
MOVI 1 R3
ADD R3 R1 //increment i
MOVI check R6
JMP R6 //go to check







// ldlo -3 = i
// ldlo -4 = 180
gcd:
PUSH RP
PUSH FP
MOV SP FP
LDLO -4 R1 //A
LDLO -3 R2 //B
MOVI continue R6
JNZ R2 R6 //if b is not zero move to continue
MOVI end R6
JMP R6 // move to the end

continue:
MOV R1 R3 //move a into R3
IDIV R2 R3 // divide a by b
MUL R2 R3 // Multiply result by b
SUB R3 R1 // Get MOD by subtracting that from a
PUSH R2 // push b
PUSH R1 // push a mod b
MOVI gcd R6
JAL R6 //Recursively call GCD
MOVI 2 R4
SUB R4 SP

end:
POP FP
POP RP
RET







