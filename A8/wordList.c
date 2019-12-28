/**
 * CSC 225, Assignment 8
 */

/* TODO: Included any required libraries. */
#include "wordList.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h> 

/**
 * Adds a new occurrence to the end of a list.
 * tail - A pointer to the current tail of a list, NULL if it's empty.
 * line - The line in which the word occurs
 * lineNum - The number of that line within the file
 * wordNum - The position of that word within that line
 *
 * Returns a pointer to the new tail of the list.
 */
Node *addToTail(Node *tail, char *line, int lineNum, int wordNum) {

	/* create and allocate memory for new node*/
	Node *newNode = NULL;
	newNode = (Node *)malloc(sizeof(Node));

	/* set all attributes of newNode*/
	newNode -> lineNum = lineNum;
	newNode -> wordNum = wordNum;
	strcpy(newNode -> line, line);
	newNode -> next = NULL;

	/* if the tail is null the list is empty
	 * tail must be equal to the newNode, no need to set previous 
	 * next to newNode because there is no previous
	 */
    if (tail == NULL){

    	tail = newNode;
    	return tail;
    }
    
    /* if the list isn't empty, must point previous next to
     * newNode then set tail to newNode
     */
    tail -> next = newNode;
    tail = newNode;
    return tail;
}

/**
 * Removes an occurrence from the beginning of a list.
 * head - A pointer to the current head of a list, NULL if it's empty
 * line - A pointer at which to store the removed line
 * lineNum - A pointer at which to store the removed line number
 * wordNum - A pointer at which to store the removed word number
 *
 * Returns a pointer to the new head of the list, NULL if it's (now) empty.
 */
Node *rmFromHead(Node *head, char *line, int *lineNum, int *wordNum) {

	Node *temp = NULL;
	temp = head;
	/* if the head of the list is NULL
	 * there is nothing to remove so 
	 * just return NULL
	 */
	if (head == NULL){
    	return NULL;
    }

    strcpy(line, head -> line);
    *lineNum = head -> lineNum;
    *wordNum = head -> wordNum;

    /* if the head contains a node, 
     * set the temp to the head and 
     * move head to point to old head's next
     * then free the temp data
     */
    
    head = head -> next;
    free(temp);
    return head;



}

/**
 * Prints out every node in a list.
 * head - A pointer to the head of a list, NULL if it's empty
 */
void printList(Node *head) {

    if (head != NULL){
    	printf("Node:\n- line:      %s\n- lineNum:   %d\n- wordNum:   %d\n", head -> line, head -> lineNum, head -> wordNum);
    	printList(head -> next);
    }
}











