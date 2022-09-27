#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//0 == Fail 1 == Pass

/* prototypes */ 

int aldo( int character, char *string) ;

int bar( int character, char *string) ;

int calma( int character, char *string) ; 

int dol( int character, char *string) ; 


int main( int argc, char *argv[]) 
{

	int boolean ;

	FILE *fp = NULL ; 
	char *buff = NULL ;  
	size_t len = 0 ;  


	fp = fopen(argv[1], "r") ; 

	while( getline( &buff, &len, fp ) != -1 ) 
	{
		buff[ strlen(buff)-1 ] = '\0' ;
		int firstChar = buff[0] ; 
 
		if (firstChar == 'A')
			boolean = aldo(firstChar, buff) ;
		else if(firstChar == 'B')
			boolean = bar(firstChar, buff) ; 
		else if(firstChar == 'C') 
			boolean = calma(firstChar, buff) ;
		else if(firstChar == 'D')
			boolean = dol(firstChar, buff) ; 
		else
			boolean = 0 ; 
	
		if (boolean == 0)
			printf("%s FAIL\n", buff) ;
		else
			printf("%s OK\n", buff) ; 
	}

	return( 0 ) ; 
} 


int aldo( int character, char *string)
{
	size_t length = strlen(string) ; 
	
	if (string[1] == 'F') 
		return 0 ; 	 

	for(int i = 1 ; i<length; i++) 
	{
		if (string[i] >= '0' && string[i] <= '9')
			continue ; 
		else if (string[i] == 'F') 
			return(1) ; 
		else
			return(0) ;
	}

	return( 0 ) ;
}


int bar( int character, char *string) 
{
	size_t length = strlen(string) ;

	if (length == 1)
		return(1) ; 
	
	for (int i = 1; i<length; i++)
	{
		if (string[i] == 'X' && i % 3 == 0) 
			continue ; 
		else if (string[i] == 'H' && i % 3 == 1)
			continue ; 
		else if (string[i] == 'G' && i % 3 == 2)
			if (i == length - 1)
				return(1);
			else
				continue ; 
		else
			return(0) ;
	}
	
	return(0) ; 

}


int calma( int character, char *string)
{
	size_t length = strlen(string) ; 
	int cnt = 0 ; 

	if (length == 1) 
		return(1) ; 
	
	for (int i = 1 ; i<=length ; i++)
	{
		if (string[i] == 'R')
			continue ; 
		else if (string[i] == 'T')
			cnt++ ; 
		else if (i == length && cnt % 2 == 0) 
			return(1) ;
		else
			return (0) ;			
	}
	return(0) ; 
} 

int dol( int character, char *string) 
{
	size_t length = strlen(string) ; 

	for (int i = 1; i < 3; i++) 
	{
		if (!(string[i] >= '0' && string[i] <= '9'))
			return(0) ; 
	}

	if (string[3] == 'A')
	{
		if (string[4] == 'F')
			return(0) ; 
		
		for (int i = 4 ; i<length; i++)
		{
			if (string[i] >= '0' && string[i] <= '9')
				continue ; 
			else if (string[i] == 'F')
				return(1) ; 
			else
				return(0) ; 
		}
		return(0) ; 
	}
	else if (string[3] == 'C')
	{
		int cnt = 0 ; 

		if (length == 4)
			return(1) ; 

		for (int i = 4 ; i<=length; i++)
		{
			if (string[i] == 'R')
				continue ; 
			else if (string[i] == 'T')
				cnt++ ; 
			else if (i == length && cnt % 2 == 0)
				return(1) ; 
			else
				return(0) ; 
		}

		return(0) ;
	}
	else
		return(0) ; 

	return(0) ; 
}
