#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

void doit()
{
	    printf("fork one\n") ; 
		 fork() ; 
		 printf("fork two\n") ; 
		     fork() ; 
			      printf("Juan\n") ;
					    return ;  
}




int main(void)
{

	    doit() ; 
		     printf("Juan\n") ; 
			      return 0 ; 

}
