#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <dirent.h> // directory work
#include <stdlib.h>
#include <time.h>
#include <unistd.h>


void copyFile( char *directory_name, char *read_file_name, char *write_file_name ) ; 




int main( int argc, char *argv[]) 
{

	char array1[20], array2[20] ; 
	strcpy(array1, argv[1]) ; strcpy(array2, argv[2]) ; 


	DIR* directory = opendir(array2) ;
	DIR* directoryA = opendir(array1) ;

	struct dirent* directoryContent = readdir(directory) ; 
	struct dirent* directoryAContent = readdir(directoryA);  
	
	directoryContent = readdir(directory) ; 
	directoryAContent = readdir(directoryA) ; 
	directoryContent = readdir(directory) ; 
	directoryAContent = readdir(directoryA) ; 
	
	char filename[20], filename2[20] ;
	strcpy(filename, directoryAContent->d_name) ; 
	strcpy(filename2, directoryContent->d_name) ; 


	copyFile( array2, filename, filename2 ) ; 


	return 0 ; 

} 


void copyFile( char *directory_name, char *read_file_name, char *write_file_name )
{
	char initialdirectory[100], copy ; 
	getcwd(initialdirectory, 100) ; 
	FILE *read_file = fopen( read_file_name, "r") ; 


	chdir( directory_name ) ;  

	FILE *write_file = fopen( write_file_name, "w" ) ;  

	copy = fgetc(read_file) ; 

	while (copy != EOF) 
	{
		fputc(copy, write_file) ; 
		copy = fgetc(read_file) ; 
	}


	chdir( initialdirectory ) ; 

}

