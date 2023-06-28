#include <stdio.h>  // all i/o 
#include <stdlib.h> // for exit 
#include <fcntl.h>  // for open 
#include <errno.h>  // for errors, but may not be needed for perror 
#include <unistd.h> // for mounting new directory 
#include <dirent.h> // directory work 
#include <string.h> 




int main( int argc, char *argv[] )
{
	DIR* directoryA = opendir( argv[1] ) ;  
	//DIR* directoryB = opendir( argv[2] ) ; 
	char fileContentA[] ; 


	if (directoryA == NULL) 
	{
		printf("no directory was actually passed\n") ;
	}
	else
	{
		printf("directory was opened successfully.\n") ; 
	} 


	struct dirent* directoryContent ; 
	directoryContent = readdir(directoryA) ; 

	




/*

	while (directoryContent != NULL) 
	{
		printf("%s\n", directoryContent->d_name) ;
		
		if (directoryContent != "." || directoryContent != "..")
		{
			strcat(fileContentA, directoryContent) ;
		} 
	
		directoryContent = readdir(directoryA) ;


	}

*/ 



	/*


	printf("%s\n", getcwd(s, 100)) ; 


	chdir( argv[1] ) ; 


	printf("Final Directory should look something like this\n%s\n", getcwd(s, 100)) ;
	
	*/ 
	
	return 0 ;


}

