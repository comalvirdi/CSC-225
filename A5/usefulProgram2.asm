;Comal Virdi	
	
	.ORIG x3400
ADDER	ADD R2, R2 #1	; add one to counter
	BRn RESETP	; if counter is negative reset and print
	BRnzp ADDER	; if not go back to adding 1
	
RESETP	AND R2, R2, #0	; clear R2
	LD R0, AST	; load ascii value of asterisk into R0
	OUT		; print out asterisk	
	BRnzp ADDER	; loop back to adder
	
AST 	.FILL #42
	.END