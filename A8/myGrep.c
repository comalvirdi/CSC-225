#include "wordList.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h> 

int main(int argc, char *argv[]){
	
	FILE *file;
	char reading[MAXLINE];
	char *strPtr;
	char *delims = "! .?;\",\n";
	Node *tail = NULL;
	Node *head = NULL;
	int lineNum = 0;
	int wordCount = 0;
	char striCp[MAXLINE];
	int lenLine = 0;
	int longestLinelen = 0;
	char lonLine[MAXLINE];
	int numMatches = 0;
	Node *temp = NULL;
	char lineSvr[MAXLINE];
	int saveLine = 0;
	int saveWN = 0;


	
	file = fopen(argv[2], "r");
	if (argc == 3){
		if (file == NULL){
		printf("myGrep: Unable to open file: %s\n", argv[2]);
		return 0;
		}
		printf("%s %s %s\n", argv[0], argv[1], argv[2]);
	}
	else{
		printf("myGrep: Improper number of arguments \n Usage: %s <word> <filename>\n", argv[0]);
		return 0;
	}

	
	

	
	while(fgets(reading, MAXLINE, file)!= NULL){
		
		strcpy(striCp, reading);
		lenLine += strlen(reading);
		strPtr = strtok(reading, delims);

		while (strPtr) {
			if (strcmp(strPtr, argv[1]) == 0){

				numMatches+=1;
				if (head == NULL){
					head = addToTail(tail, striCp, lineNum, wordCount);
					
					tail = head;
				}
				else{
					tail = addToTail(tail, striCp, lineNum, wordCount);	
				}
			}

			wordCount +=1;
			strPtr = strtok(NULL ,delims);
			
		}

		if (longestLinelen < lenLine){
			longestLinelen = lenLine;
			strcpy(lonLine, striCp);

		}

		lineNum +=1;
		lenLine = 0;
		wordCount = 0;

	}

	printf("Longest line (%d characters): %s", longestLinelen, lonLine);
	printf("Number of lines: %d\n", lineNum);
	printf("Total occurrences of \"%s\": %d\n", argv[1], numMatches);

	while(head != NULL){
		temp = head;
		printf("Line %d, word %d: %s", head -> lineNum, head -> wordNum, head -> line);
		head = rmFromHead(temp, lineSvr, &saveLine, &saveWN);

	}	
	
	fclose(file);
	return 0;
}