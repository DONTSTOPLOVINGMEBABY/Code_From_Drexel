#include <stdio.h>
  
int t1( int n ){
   int i;
   int j;
   for(i=1; i<=n; i++)
      { for (j=1; j<=i; j++)
            {printf("*");
            }
            printf("\n");
         }
         return 0;
      }


int main(){
   t1(10);
   return 0;
}

