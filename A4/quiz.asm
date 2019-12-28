; CSC 225, Assignment 4
; Comal Virdi

        .ORIG x3000

        AND R4, R4, #0                  ; Question Counter
        AND R3, R3, #0                  ; Create point total

BGIN    ADD R5, R4, #0                 ; Check if Question 1
        BRnp QTWO
        LDI R0, Q1STR                   ; Example of printing Question 1: Q1STR is the address of an address in
        PUTS
        LD R6, Q1PTS                    ;  the data file, so we have to make two passes using an LDI.
        BRnzp SHANS

 QTWO   ADD R5, R4, #-1                 ; Check if Question 1
        BRnp QTHREE
        LDI R0, Q2STR                   ; Example of printing Question 1: Q1STR is the address of an address in
        PUTS     
        LD R6, Q2PTS
        BRnzp SHANS

QTHREE  ADD R5, R4, #-2                 ; Check if Question 1
        LDI R0, Q3STR                   ; Example of printing Question 1: Q1STR is the address of an address in
        PUTS     
        LD R6, Q3PTS
        BRnzp SHANS

SHANS   LEA R0, ANSWER
        PUTS

        LD R0, GETI                     ; Get the address of the subroutine.
        JSRR R0                         ; Call the subroutine.
                                        ; Example of using GETI -- uncomment when ready to use:
        LD R0, SUB                      ; TRAP x26
        ADD R1, R1, R0                  ; Example of loading the address of the Question 1 points array.                      
        ADD R6, R6, R1                  ; You probably won't want an immediate here...
        LDR R6, R6, #0                  ; Example of accessing index 2 in the Question 1 points array:W
        ADD R3, R6, R3

        ADD R4, R4, #1
        ADD R5, R4, #-3
        BRnp BGIN
        LEA R0, RES
        PUTS

        LD R2, HIGH
        ADD R2, R3, R2
        BRn TRYAGN
        LDI R0, RESULTS
        PUTS
        BRnzp DONE
TRYAGN  LD R2, MED
        ADD R2, R3, R2
        BRn FINAL
        LD R0, RESULTS
	ADD R0, R0, #1
	LDR R0, R0, #0
        PUTS
        BRnzp DONE
FINAL   LD R0, RESULTS
	ADD R0, R0, #2
	LDR R0, R0, #0
        PUTS
DONE    HALT
   


HIGH    .FILL x-1B
MED     .FILL x-15
SUB     .FILL x-31
EA      .FILL x3100
GETI    .FILL x3300
Q1STR   .FILL x3500
Q1PTS   .FILL x3501
Q2STR   .FILL x3505
Q2PTS   .FILL x3506
Q3STR   .FILL x350A
Q3PTS   .FILL x350B
RESULTS .FILL x350F
ANSWER  .STRINGZ "Answer: "
RES     .STRINGZ "\nResult: "
        .END
