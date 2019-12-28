;Comal Virdi

	.ORIG x3300
	STI R7, PCS	; save PC from interrupt to x32ff
	LD R7, INENB	; put enabled bit into R7
	STI R7, KBSR 	; enables bit 15 of KBSR
	LD R7, USEPRO2	; fill R7 with address of useful program 2 (prepare for jmp)
	JMP R7		; jump back to program 2
	
USEPRO2	.FILL x3400
PCS	.FILL x32FF
INENB	.FILL x4000	; enables bit 15 of KBSR
KBSR	.FILL xFE00