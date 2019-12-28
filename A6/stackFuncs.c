/**
 * CSC 225, Assignment 6
 */

#include <stdio.h>
#include "stack.h"

/**
 * Pushes a value onto a stack of integers.
 * stack - The array containing the stack
 * size - A pointer to the number of elements in the stack
 * val - The value to push
 *
 * Returns 0 on success, 1 on overflow.
 */
int push(int stack[], int *size, int val) {
    if (*size == MAX_SIZE){
    	return 1;
    }
    else{
    	stack[*size] = val;
    	(*size)++;
    	return 0;
    }
}

/**
 * Pops a value off of a stack of integers.
 * stack - The array containing the stack
 * size - A pointer to the number of elements in the stack
 * val - A pointer to the variable in which to place the popped value
 *
 * Returns 0 on success, 1 on underflow.
 */
int pop(int stack[], int *size, int *val) {
   if (*size == 0){
   		return 1;
   }
   else{
   		*val = stack[*size - 1];
   		(*size)--;
   		return 0;
   }
}

/**
 * Prints a stack of integers.
 * stack - The array containing the stack
 * size - The number of elements in the stack
 * mode - How to print elements, one of: DEC_MODE, HEX_MODE, or CHAR_MODE
 */
void printStack(int stack[], int size, int mode) {
    int counter;
    if (mode == DEC_MODE){
    	
    	if(size == 0){
    		printf("[]\n");
    	}
    	else{
    		printf("[");
    		for (counter = 0; counter < size - 1; counter++){
    		printf("%d, ", stack[counter]);
    		}
    		printf("%d", stack[counter]);
    		printf("]\n");
    	}
    	
    }
    else if(mode == CHAR_MODE){
    	if(size == 0){
    		printf("[]\n");
    	}
    	else{
    		printf("[");
    		for (counter = 0; counter < size - 1; counter++){
    			printf("'%c', ", stack[counter]);
    		}
    		printf("'%c'", stack[counter]);
    		printf("]\n");
    	}
    	

    }
    else if(mode == HEX_MODE){

    	if(size == 0){
    		printf("[]\n");
    	}
    	else{
    		printf("[");
    		for (counter = 0; counter < size - 1; counter++){
    			printf("0x");
    			printf("%X, ", stack[counter]);
    		}
	    	printf("0x");
	    	printf("%X", stack[counter]);
	    	printf("]\n");
    	}
    	

    }

}











