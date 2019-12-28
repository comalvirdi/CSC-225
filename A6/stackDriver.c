#include <stdio.h>
#include "stack.h"

int main(){

	char com = 's';
	char *comPtr = &com;

	int nextNum;
	int *NxtNPtr = &nextNum;

	int stack[MAX_SIZE]; 

	int size = 0;
	int *sizePtr = &size;

	int tbPopped = 0;
	int *tbpPtr = &tbPopped;

	int printingMode = DEC_MODE;

	printf("Welcome to the stack program.\n\n");

	while (com != 'q'){

		printf("Enter option: ");
		scanf(" %c", comPtr);

		if (com == '+'){
			printf("What number? ");
			scanf("%d", NxtNPtr);

			if ((push(stack, sizePtr, nextNum))){
				
				printf("Error: Stack overflow!\n");
			}
			printf("Stack: ");
			printStack(stack, size, printingMode);
			printf("\n");
			
			

		}

		else if (com == '-'){

			if (!(pop(stack, sizePtr, tbpPtr))){
				printf("Popped %d.\n", tbPopped);
				
			}
			else{

				printf("Error: Stack underflow!\n");
			}

			printf("Stack: ");
			printStack(stack, size, printingMode);
			printf("\n");
			

		}

		else if (com == 'x'){
			printingMode = HEX_MODE;
			printf("Stack: ");
			printStack(stack, size, printingMode);
			printf("\n");

		}

		else if (com == 'd'){
			printingMode = DEC_MODE;
			printf("Stack: ");
			printStack(stack, size, printingMode);
			printf("\n");

		}

		else if (com == 'c'){
			printingMode = CHAR_MODE;
			printf("Stack: ");
			printStack(stack, size, printingMode);
			printf("\n");

		}
		else if (com != 'q'){
			printf("Stack: ");
			printStack(stack, size, printingMode);
			printf("\n");
		}

	}

	printf("Goodbye!\n");
	return 0;

}