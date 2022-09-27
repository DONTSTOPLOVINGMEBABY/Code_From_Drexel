#include "csapp.h"

void *thread(void *arg1) ; 

int main()
{
	pthread_t tid ; 
	Pthread_create(&tid, NULL, thread, NULL) ; 
	Pthread_exit(NULL) ; // exit(0);

} 

void *thread(void *arg1){
	Sleep(1) ; 
	printf("Hello, world!\n") ; 
	return NULL ; 
} 
