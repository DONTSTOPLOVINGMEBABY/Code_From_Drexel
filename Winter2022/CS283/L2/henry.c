#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <dirent.h>

#define SIZE 1028 


int main( int argc, char *argv[] )
{
	if (argc != 3){
		printf("You can only supply 3 arguments. Program exiting...\n") ; 
		exit(1) ;}

	
	//Initializations
	char *directoryA_Path = realpath(argv[1], NULL) ; 
	char *directoryB_Path = realpath(argv[2], NULL) ; 	
	char directoryA_Files[100][500] ;
	char directoryB_Files[100][500] ; 
	int fileA_count = 0 ; 
	int fileB_count = 0 ; 

	DIR *directoryA, *directoryB ;
	directoryA = opendir(directoryA_Path) ; 
	directoryB = opendir(directoryB_Path) ; 
	
	
	struct dirent *directoryA_Content, *directoryB_Content ; 
	directoryA_Content = readdir(directoryA) ; 
	directoryB_Content = readdir(directoryB) ;


	printf("%s\n%s\n", directoryA_Path, directoryB_Path) ; 


	int local_ctr = 0 ;
	
	//Copy filenames into respective arrays
	while (directoryA_Content != NULL)
	{
		//if ( strcmp(directoryA_Content->d_name, ".") != 0 && strcmp(directoryA_Content->d_name, "..") != 0){ 
			strcpy(directoryA_Files[local_ctr], directoryA_Content->d_name) ; //realpath(directoryA_Content->d_name, NULL)) ; 
			printf("%s\n", directoryA_Content->d_name) ;
			directoryA_Content = readdir(directoryA) ;
			local_ctr++ ; 
			fileA_count++ ; 
		directoryA_Content = readdir(directoryA) ; 
	}


	printf("fileA_count %d\n", fileA_count) ; 


	


} 

