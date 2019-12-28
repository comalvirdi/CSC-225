/**
 * CSC 225, Assignment 7
 */

#include <stdio.h>

/**
 * Prints out positive integers, counting backwards from n to 1.
 * n - A positive integer at which to start
 */
void countBackwardsFrom(int n) {
	int cN = n;

	if (n == 1){
		printf("%d", n);
    	countBackwardsFrom(cN-1);
    }
    else if (n != 0){
    	printf("%d, ", n);
    	countBackwardsFrom(cN-1);
    	
    }

    
}

/**
 * Prints out positive integers, counting forwards from 1 to n.
 * n - A positive integer at which to stop*/
void countForwardsTo(int n){
	int cN = n;

		if (n > 1){
	    	countForwardsTo(cN-1);
	    	printf(", ");
	    	printf("%d", n);
	  	    }
	  	if (n == 1){
	    	countForwardsTo(cN-1);
	    	printf("%d", n);
	  	    }

}
    /*TODO: Complete this function.*/
 	
	

