#include <stdio.h>
#include <string.h>
#include <ctype.h> /* For isalpha, isdigit, and perhaps for strcat */

#define FARTS "PEW YEW"

/*
int main (void) 
{





	printf("Henry, you printed something \a") ;
	
	float x=3.1465423987 ;
	
	int y = 314 ;
	
	printf("Here is the number %.4f, %.3f, %.2f, %.1f, %d\n", x, x, x, x, y) ;

	printf("Didn't know you could do this. Try outputting something with an escape character and using 'mod c' to print it, as such:\n") ; 

	printf("\\%c is what I typed with a slash", 'q') ;

	char z[10] = "January" ; 

	printf("\nPrinting Variable %s", z) ; 

	char mark[] = "Unlimited String Space!" ;

	printf("%s", mark) ;

	char r[20] = "Henry's string" ;

	printf("\n\nr was originally: %s", r) ; 

	strcpy(r, "New String") ; 

	printf(" but is now: %s", r) ;

	
	printf("\nHey kids, what do you say when someone farts? ...... %s", FARTS) ;

	return (0) ;
}


int main (void) 
{ 

	int something ;

	printf("Enter something\n") ; 
	scanf("%d", &something) ; 


	if (something < 4 )
	{
		printf("Well I don't know about that") ; 
	}
	else
	{
		printf("Well, I'm still not sure about that mane.\n") ;
	} 

	printf("you typed: %d ", something) ; 

	return (0) ; 

}



int main (void) 
{

	printf("Weclome to the trial loop. This is obviously for practice.\n") ;

	char a[20] ;
	char b[5] = "stop" ;  


	while(1)
	{
		printf("Enter input\n") ; 
		scanf("%s", a) ;
		if (! strcmp(b, a)) 
		{
			break ;
		}
		else
		{
			printf("You entered %s and that's cool man\n", a) ; 
		}

	}



}

*/


int main (void) 
{
	
	char q[] = "Henry is here" ; 

	int i = 0 ; 
	
	while (q[i] !=  '\0')
	{
		printf("%c\n", q[i]) ; 
		i++ ;
	}


	int length = strlen(q) ; 
	printf("%d", length) ; 

}









