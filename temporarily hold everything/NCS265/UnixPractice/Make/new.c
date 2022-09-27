#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
   FILE *fp = NULL ;
   char *buff = NULL ;
   size_t len = 0 ;
   int c, cnt = 0 ;


   if( argc > 1 )
   {
   fp = fopen(argv[1], "r") ;

      if (fp == NULL)
      {
         printf("This file cannot be read. Please run the program again and enter a readable file. - Management\n") ;
         return ( 0 ) ;
      }
   }
   else
      fp = stdin ;

/*
   c=fgetc(fp) ; 
   printf("%c\n", c) ; 
   if (fp == stdin || c == -1) 
      return( 0 ) ; 
*/
   while( getline( &buff, &len, fp ) != -1 )
   {

      buff[ strlen(buff)-1 ] = '\0' ;
/*
      if(fp == stdin) 
      { 
         if(strlen(buff) == 0) 
            break ; 
      }  
      c = fgetc(fp) ; 
      if (c == -1 ) 
         break ; 
*/
      printf("%s\n", buff) ;

   }


   fclose(fp) ;
   return( 0 ) ;
}
