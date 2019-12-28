.ORIG x3000

        AND R0, R0, #0      ; Clear all the Registers
        AND R1, R1, #0 
        AND R2, R2, #0 
        AND R3, R3, #0 
        AND R4, R4, #0 
        AND R5, R5, #0 
        AND R6, R6, #0 
        AND R7, R7, #0 

        LEA R0, STR1        ; Load String 1 into R0
        PUTS                ; Print String 1 to terminal
IOLOOP  GETC                ; Read a character.
        OUT                 ; Print out the Character
        LD R5, ASOFST       ; Load -48 to R5
        ADD R1, R0, R5      ; ADD -48 to R5 to get int of Encryption Value
        
        LEA R0, STR2        ; Load String 2 into R0
        PUTS                ; Print String 2 to terminal

  	LEA R4, MEMS        ; saves memory address in R4
GETMES  GETC              ; Get Message character and place it in R0  
  	OUT                      ; Print character

      AND R5, R5, #0      ; Clear R5
      LD R5, NEWLN        ; Load Newline value int R5
      ADD R5, R0, R5      ; Subtract newline val from Character
      BRz STPRNT          ; Check if character was newline and start printing to console if so 
      

      AND R3, R0, #1      ; And message with 1 and place in R3
      BRz ZERO            ; if result is 0 move to Zero branch
      BRp ONE             ; if result is 1 move to One branch
ZERO  ADD R0, R0, #2      ; add one if zero
ONE   ADD R0, R0, #-1     ; subtract one if one
      ADD R0, R0, R1      ; Add Encryption Value to new Message
      STR R0, R4, #0      ; Stores message character in R0 into memory location in R4
      ADD R4, R4, #1      ; Increment Memory Address for next value
      ADD R6, R6, #1      ; Increment Counter
      BRnzp GETMES        ; Otherwise grab next char, start over
      

STPRNT  LEA R0, STR3        ; Load String 3 into R0
        PUTS 
        AND R0, R0, #0
        STR R0, R4, #0
        LEA R0, MEMS        ; go to memory address
        PUTS


DONE     HALT                ; HALT Program
ASOFST  .FILL #-48          ; set ASOFST to -48 for ASCII conversion
NEWLN   .FILL #-10          ; set NEWLN to -10 to check for newline

STR1  .STRINGZ "Encryption Key (1 - 9): "
STR2  .STRINGZ "\nInput Message : "
STR3  .STRINGZ "Encrypted Message: "

MEMS  .BLKW #21
      .FILL #0
        .END
