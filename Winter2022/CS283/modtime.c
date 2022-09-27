#include <stdio.h> 
#include <string.h>
#include <sys/stat.h>
#include <dirent.h> // directory work
#include <stdlib.h>
#include <time.h>
#include <unistd.h> 


//prototypes

time_t getModtime( char *file_name, char *directory_name ) ;

void copyFile( char *copy_directory, char *write_directory, char *file_name ) ; 


int main( int argc, char *argv[])  


{
	if (argc == 1)
	{
		printf("only one argument passed\n") ;
		exit(1); 
	}

	DIR* directory = opendir(argv[2]) ;
	DIR* directoryA = opendir(argv[1]) ; 

	if (directory == NULL)
	{
		printf("null directory\n") ; 
		return 0 ;
	}

	struct dirent* directoryContent = readdir(directory) ;
	struct dirent* directoryAContent = readdir(directoryA) ; 
	int ctr = 0  ; 


	//every variable you could ever need

	char array1[20] ;  
	char testarray[5] = "." ; 
	char testarray2[5] = ".." ; 
 	FILE *file ; //unused 
	char test_file[100] ; strcmp(test_file, directoryContent->d_name) ;
	time_t fileA, fileB ;  
	char twoDArray[10][100] ; 
	int boolean = 1 ;  // 1 is false and 0 is true 

	while (directoryAContent != NULL)
{
	
	//Array2 holds the filename from A 		
	char array2[20] ; 
	strcpy(array2, directoryAContent->d_name) ; 

	if ( strcmp(array2,testarray) != 0  && strcmp(array2, testarray2) != 0 ) // Doesn't Check "." and ".."
{


	//printf("\n\n%s\n\n", directoryAContent->d_name) ; 

	while (directoryContent != NULL)
{	
		//Array 1 holds the filename from B 
	
		strcpy(array1, directoryContent->d_name) ;
		if ( strcmp(array1,testarray) != 0  && strcmp(array1, testarray2) != 0 ) // Doesn't Check "." and ".."
		{	
			if (strcmp(array1, array2) == 0)
			{
				boolean = 0 ; 
				
				fileA = getModtime( array2, argv[1]) ; 
				fileB = getModtime( array1, argv[2]) ; 
					
			
					


				if (fileA > fileB)
				{
					printf("%s from direct1 file A is newer\n", array2) ; 
				}
				if (fileA < fileB)
				{
					printf("%s from direct2 file B is newer\n", array1) ;
				}
				
				copyFile( argv[1], argv[2], array2) ; 

			 }
		
		}
				
		 		 
		directoryContent = readdir(directory) ;
}
}

			

	rewinddir(directory) ; 
	directoryContent = readdir(directory) ;
	directoryAContent = readdir(directoryA) ; 
 
}

	return 0 ; 
}
	  



time_t getModtime( char *file_name, char *directory_name )   
{
	printf("file being measured is %s\n", file_name) ; 

	char initialDirectory[100], newDirectory[100]  ; 

	printf("current directory: %s\n", getcwd(initialDirectory, 100)) ; 

	chdir( directory_name ) ;

	printf("current directory in the function is now %s\n", getcwd(newDirectory, 100)) ;

	struct stat tempFunction ; 
	stat(file_name, &tempFunction) ; 

	printf("%s has a modtime of %s", file_name, ctime(&tempFunction.st_mtime)) ; 
	
	time_t temp1 = tempFunction.st_mtime ; 

	chdir( initialDirectory ) ; 

	return temp1 ;  
		

} 



 











// function that will take the directory it needs to switch to and the filename to search for. 
// Switches to that directory and returns a time_t to compare with another time_t value?  
//	COMPLETED 

//Create a bool value that turns true if the file is found when searching for it
//And remains false if never found


/* 

directoryContent = readdir(directory) ; 
	directoryContent = readdir(directory) ; //move two forward to skip . and .. 
	 

	fileA = getModtime( "one", argv[2] ) ; 

	directoryContent = readdir(directory) ; 

   fileB = getModtime( "second", argv[2] ) ; 

	if (fileA > fileB)
	{
		printf("Value says one is newer than second\n") ; 
	}
	if (fileA < fileB) 
	{
		printf("Value says second is newer than one\n") ; 
	}

	if (fileA == 0) 
	{
		printf("ya done fucked it\n") ; 
	}




















	*/ 
