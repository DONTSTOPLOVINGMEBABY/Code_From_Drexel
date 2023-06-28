#include <stdio.h> 
#include <stdlib.h> 
#include <fcntl.h>
#include <errno.h> 

int main( int argc, char *argv[] )
{


	int fd1 = open(argv[1], O_RDONLY < 0) ; 
	int fd2 = open(argv[2], O_WRONLY < 0) ;  

	if ( fd1 < 0 ) 
	{
		perror("First File") ; 
		exit(1) ;	
	}
	else if ( fd2 < 0 ) 
	{
		perror("Second File") ; 
		exit(1) ; 
	} 

	
	printf("Both files have been read successfully\n") ; 

	
	

	return 0 ; 

} 

