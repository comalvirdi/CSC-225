;Comal Virdi

	.ORIG x3500
	ST R3, STR3 	; store value of r3 in empty storage space so we can use that reg
	ST R4, STR4	; store value of r4 in empty storage space so we can use that reg
	LDI R0, KBDR	; get read in ascii value from the kbdr 
	LD R4, KBZERO	; load clear value for kbsr
	STI R4, KBSR	; clear KBSR
	LDI R3, PCS	; load pc of useful program 1 to R3
	STR R3, R6, #0	; store pc of useful program 1 in supervisor stack
	LD R3, STR3
	LD R4, STR4	; restore r3 and r4
	RTI
	


KBSR	.FILL xFE00
KBZERO 	.FILL x0000
KBDR	.FILL xFE02
STR3 	.BLKW #1
STR4	.BLKW #1
PCS 	.FILL x32FF
.END