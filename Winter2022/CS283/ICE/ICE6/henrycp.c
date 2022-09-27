
#include "csapp.h"

void *thread(void *arg1) ; 

int main(int argc, char* argv[])
{
	int n ; 
	
	if (argc < 2) {
		printf("You need to supply <n threads> as second argument. Exiting ...\n") ; 
		exit(1) ; 
	}

	n = atoi(argv[1]) ; 
	pthread_t tid ; 

	for(int i = 0; i < n ; i++)
	{
		Pthread_create(&tid, NULL, thread, NULL) ; 
	}

	Pthread_exit(NULL) ; 
}

void *thread(void *arg1)
{
	printf("Hello, world!\n") ; 
} 
