#include <stdio.h>
#include <string.h>

void foo(char k[])
{
	 
	int ctr = 0 ; 
	
		while(k[ctr++] != '\0')
		{	
		if ((k[ctr] != '1') && (k[ctr] != '0') && (k[ctr] != '2')) 
			{
				if(k[ctr] == 'F')
				{
					printf("OK") ; 
					return ;  
				}
				else
				{
					printf("FAIL") ; 
					return ;  
				} 
			}
	 
			
		}
		
}

void eep(char k []) 
{
	int length = strlen(k) ;
	
	int ctr = 0 ; 




	if ((length == 1) && (k[0] == 'P')) 
	{
		printf("OK") ; 
		return ; 
	} 
	else
	{
	
		while(k[ctr++] != '\0')
		{
			if((ctr % 2 == 1) && (k[ctr] == 'B'))
			{
				continue ; 
			}
			else if ((ctr % 2 == 0) && (k[ctr] == 'C'))
			{
				continue ; 
			}
			else if ((ctr % 2 == 0) && (k[ctr] != 'C') && (ctr<length))
			{
				printf("FAIL") ; 
				return ; 
			}
			else if ((ctr % 2 == 1) && (k[ctr] != 'B') && (ctr<length))
			{
				printf("FAIL") ; 
				return ; 
			
			}
			else if ((ctr % 2 == 0) && (k[ctr-1] == 'B') && (k[ctr] != 'C')) 
			{
				printf("FAIL") ; 
				return ; 
			}
			else
			{
				printf("OK") ; 
				return ; 
			}


		}

	} 

}


void op(char k[]) 
{
	return ; 
} 




int main (void)
{
	printf("**** Welcome to Message Verifier ****") ; 
	printf("\nType 'quit' to exit.") ; 

	char quit[5] = "quit" ; 



	while(1)
	{
		char a[80] ;  
		printf("\nEnter message ") ; 
	
		scanf("%s", a) ;
 		 
		 

		if ( ! strcmp(quit, a))
		{
			break ; 
		}
		else if (a[0] == 'E')
		{
			foo(a) ; 
		}
		else if (a[0] == 'P') 
		{
			eep(a) ; 
		}
		else if (a[0] == 'Q')
		{
			op(a) ; 	
		}
		else if (a[0] == 'M')
		{
			printf("Worked for M") ;
		}
		
		} 

}



