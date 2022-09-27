#include <stdio.h>
#include <stdlib.h> 
#include <string.h> 

int main(int argc, char *argv[]) 
{
	int c ; 
	
	FILE *fp = NULL ;
	fp = fopen(argv[1], "r") ; 

	if (fp == NULL) 
	{
		printf("There was no file listed\n") ; 
		return( 0 ) ; 
	} 
/*
	 do{
      c = fgetc(fp) ;
      if( feof(fp) )
      {
         break ;
      }
      printf("%c\n", c) ;
   } while(1) ;

*/

	c = fgetc(fp) ; 
	printf("%c\n", c); 

	char *buff = NULL ; 
	size_t len = 0 ;
	while( getline( &buff, &len, fp ) != -1 )
	{
		/* overwrite newline */ 
		buff[ strlen(buff)-1 ] = '\0' ;  
		c = fgetc(fp) ; 
		if (c == -1)
			break ; 
      printf("%c\n", c) ;
	}		
 
	fclose( fp ) ; 

	return( 0 ) ; 
} 
