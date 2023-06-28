#include <stdio.h> 
#include <stdlib.h> 
#include <string.h>

int main( int argc, char *argv[] )
{


	FILE *file1, *file2 ; 
	char c  ; 


	file1 = fopen(argv[1], "r" ) ;
	file2 = fopen(argv[2], "w") ; 


	if (file1 == NULL) 
	{
		printf("I was unable to open the file reading file... Exiting \n") ; 
		exit(0) ; 
	}

	if (file2 == NULL) 
	{
		printf("I was unable to open writing file... Exiting \n") ; 
		exit(0) ;
	} 


	printf("Both files were opened... Let's continue\n") ;
	  
	
	c = fgetc(file1) ; 

	
	while (c != EOF)
	{
		fputc(c, file2) ; 
		c = fgetc(file1) ; 
	} 


	exit(0) ; 


} 



	
