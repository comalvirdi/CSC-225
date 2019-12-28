; A very useful program.
; CSC 225, Assignment 5
; Comal Virdi

        .ORIG x3000

	LD R2, INTE	; Load x3300 into R2
	STI R2, TV	; Store x3300 in x26

	LD R2, KEYF	; Load x3500 into R2
	STI R2, IVT	; Store x3500 into x180
	
	LD R6, SUPST	; initialize stack pointer to x3000

MAIN    LEA R0, INITMSG ; Print the starting message.
        PUTS
        TRAP x26        ; Get a character.
        OUT             ; Print the character.
        TRAP x26        ; Repeat four more times.
        OUT
        TRAP x26
        OUT
        TRAP x26
        OUT
        TRAP x26
        OUT
        LEA R0, ENDMSG  ; Print the ending message.
        PUTS
        BRnzp MAIN
	
	KEYF .FILL x3500
	IVT .FILL x180
	INTE .FILL x3300
	TV .FILL x26
	SUPST .FILL x3000
INITMSG .STRINGZ "Enter five characters: "
ENDMSG  .STRINGZ "\nSuccess! Running again...\n\n"
        .END
