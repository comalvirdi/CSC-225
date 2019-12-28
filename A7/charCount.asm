        .ORIG x3300

		ADD R6, R6, #-1        ; return value
		ADD R6, R6, #-1        ; return address
		STR R7, R6, #0         ; store old R7 as return address
		ADD R6, R6, #-1        ; dynamic link
		STR R5, R6, #0         ; Store old R5 as Dynamic Link
		ADD R5, R6, #-1        ; move R5 to point to base of local variables
		ADD R6, R6, #-1        ; increment stack pointer (spot for local var result)
		ADD R6, R6, #-1
		LDR R1, R5, #4         ; Load str address into R2
        LDR R1, R1, #0         ; Load value at str address into R1
        BRz NULVAL            ; If loaded value is 0, go to NULVAL instructions

        LDR R2, R5, #5         ; Load value at key address into R2
        NOT R2, R2             ; take 2s complement
        ADD R2, R2, #1
        ADD R1, R1, R2         ; subtract key from str to find match val
        BRnp RECNOMAT

        STR R1, R5, #-1		   ; Store difference in match
        AND R1, R1, #0
        ADD R1, R1, #1
        STR R1, R5, #0
        LDR R0, R5, #5         ; load key into r0
        ADD R6, R6, #-1
        STR R0, R6, #0         ; push key argument
        LDR R0, R5, #4         ; load str into R0
        ADD R0, R0, #1      
        ADD R6, R6, #-1
        STR R0, R6, #0         ; push str argument
        LD R0, CHAR_COUNT       
        JSRR R0

        LDR R0, R6, #0
        ADD R6, R6, #3
        LDR R1, R6, #1     
        ADD R0, R0, R1      
        STR R0, R6, #1      
        BRnzp RETURN

NULVAL	STR R1, R6, #1
		BRnzp RETURN	


RECNOMAT STR R1, R5, #-1	   ; Store difference in match
		AND R1, R1, #0
        STR R1, R5, #0
		LDR R0, R5, #5         ; Load key into R0
        ADD R6, R6, #-1        ; push key argument
        STR R0, R6, #0   

        LDR R0, R5, #4         ; load str into R0
        ADD R0, R0, #1         
        ADD R6, R6, #-1        ; push str argument
        STR R0, R6, #0     

        LD R0, CHAR_COUNT   
        JSRR R0

        LDR R0, R6, #0  
        ADD R6, R6, #3    
        STR R0, R6, #1    


RETURN	LDR R1, R6, #1	       ; get result into r0		
        STR R1, R5, #3	       ; put result into return value location
		ADD R6, R5, #1	       ; Pop locals
		LDR R5, R6, #0	       ; restore r5 (pop dynamic link)
		ADD R6, R6, #1
		LDR R7, R6, #0	       ; pop return address (restore r7)
		ADD R6, R6, #1
		RET


CHAR_COUNT .FILL x3300
.END