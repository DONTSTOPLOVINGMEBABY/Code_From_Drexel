#include <stdio.h>
#include "csapp.h"

void *thread(void *vargp) ; 

#define DEFAULT 4; 

int main(int argc, char*argv[])
{
	int n; 
	if (argc > 2)
		return 0; 
	else if (argc == 2)
		n = atoi(argv[1]) ;  
	else 
		n = DEFAULT ; 

	
	int i ; 
	pthread_t tid ; 
	for (i = 0 ; i < n; i++)
	{
		Pthread_create(&tid, NULL, thread, NULL) ;
	}
	Pthread_exit(NULL) ; 
}

void *thread(void *vargp) {
	printf("Hello, world\n") ; 
	 
} 


