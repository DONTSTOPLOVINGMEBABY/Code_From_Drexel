
#include <pthread.h>
#include <stdio.h>


void *thread(void *vargp) ; 


int main(){

	printf("here is the beginning\n") ; 

	pthread_t tid ; 	


	for (int i = 0 ; i < 10 ; i++) ; {

		pthread_create(&tid, NULL, thread, NULL) ;
		}
	
	printf("here is something to show you on the output\n") ; 

	pthread_join(tid, NULL) ;	

	return 0 ; 
}


void *thread(void *vargp) { 
	printf("Hello, world!\n") ; 
	return NULL ; 
}
