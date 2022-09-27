#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h> 

int counter = 1 ; 

int main()
{
	  
	    if (fork() == 0) {
			    counter-- ;
				     exit(0) ; 
					      
							  }
							    
								   else {
										    wait(NULL); } 
											   
												  return 0 ; 
}
