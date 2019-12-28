		.ORIG x3300
		ST R1, SAVER2
GETI	LDI R0, KBSR 				; Get the keyboard status.
		BRzp GETI 					; Poll the keyboard.
		LDI R0, KBDR 				; Get the typed key.	
WRITE 	LDI R1, DSR 				; Get the display status.
		BRzp WRITE 					; Poll the display.
		STI R0, DDR 				; Print the typed key.
		LD R1, SAVER2
		ADD R1, R0, #0
		RET


SAVER2 .FILL x0


KBSR .FILL xFE00
KBDR .FILL xFE02
DSR .FILL xFE04
DDR .FILL xFE06
.END
