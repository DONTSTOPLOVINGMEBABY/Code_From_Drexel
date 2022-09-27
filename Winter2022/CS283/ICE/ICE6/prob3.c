#include "csapp.h"


#include <pthread.h>
#define NUM_THREADS 8
char *messages[NUM_THREADS];
struct data{
	   int sum;
		   int tid; 
			   char *message;
};
void *PrintHello(void *threadarg){
	   int taskid, sum;
		   char *hello_msg;
			   struct data *d1 = threadarg;
				   taskid = d1->tid;
					   sum = d1-> sum;
						   hello_msg = d1->message;
							   printf("Thread %d %s Sum=%d\n", taskid, hello_msg, sum);
								   pthread_exit(NULL);
}
int main(int argc, char *argv[]){
	   pthread_t threads[NUM_THREADS];
		   int rc, t, sum;
			   sum=0;
				   messages[0] = "Hello-0";
					   messages[1] = "Hello-1";
						   messages[2] = "Hello-2";
							   messages[3] = "Hello-3";
								   messages[4] = "Hello-4";
									   messages[5] = "Hello-5";
										   messages[6] = "Hello-6";
											   messages[7] = "Hello-7";
												   for(t = 0; t < NUM_THREADS; t++)
														   {
																      struct data *data2;
																		      sum = sum + t;
																				      d2->tid = t;
																						      d2->sum = sum;
																								      d2->message = messages[t];
																										      pthread_create(threads[t], PrintHello, d2);
																												      printf("Creating thread %d\n", t);
																														      pthread_join(threads[t], NULL);
																																   }
																																	   pthread_exit(NULL);
}
