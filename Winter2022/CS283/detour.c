#include <stdio.h> 
#include <string.h> 
#include <sys/stat.h> 
#include <dirent.h> // directory work
#include <stdlib.h>
#include <time.h>


static time_t getFileModifiedTime(const char *path)
{
	    struct stat attr;
		     if (stat(path, &attr) == 0)
				    {
						        printf("%s: last modified time: %s", path, ctime(&attr.st_mtime));
								          return attr.st_mtime;
											     }
												      return 0;
}




int main(void)
{



	time_t t1 = getFileModifiedTime("wannabelovingsomething") ;  
	time_t t2 = getFileModifiedTime("humannature") ; 

	
	if (t1 < t2)
	{
		printf("wannabe\n") ; 
	}

	if (t2 < t1) 
	{
		printf("humannature\n") ; 
	} 

	
	return(0);
}


 


