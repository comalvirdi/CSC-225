        .ORIG x3500

        ; Question 1
Q1STR   .FILL x3512  ; Address of prompt
Q1PTS   .FILL #10 ; Point value for option 1
        .FILL #5  ; Point value for option 2
        .FILL #0  ; Point value for option 3
        .FILL #2  ; Point value for option 4

        ; Question 2
Q2STR   .FILL x356B
Q2PTS   .FILL #2
        .FILL #10
        .FILL #1
        .FILL #0

        ; Question 3
Q3STR   .FILL x35B6
Q3PTS   .FILL #0
        .FILL #5
        .FILL #7
        .FILL #10

        ; Results
RESULTS .FILL x3694
        .FILL x36C1
        .FILL x36EE

        ; Strings must be declared separately because their lengths are variable.
Q1      .STRINGZ "\nWhat is the greatest value for an imm in an ADD?\n    1) 15\n    2) 17\n    3) 4\n    4) 8\n"
Q2      .STRINGZ "\nWhich of these is invalid?\n    1) BRp\n    2) BRzn\n    3) BRn\n    4) BRzp\n"
Q3      .STRINGZ "\nWhat is the assembler name of TRAP x23?\n    1) HALT\n    2) PUTS\n    3) OUT\n    4) IN\n"

GOODMSG .STRINGZ "Looks like I should make the midterm harder."
PASSMSG .STRINGZ "You won't get partial credit on a real exam."
FAILMSG .STRINGZ "Study harder!"


        .END



