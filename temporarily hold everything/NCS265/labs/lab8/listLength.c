/* A function that takes a list and returns its length by
** looping through the list until it reaches NULL node */

size_t listLength(const sNode *L)
{
   size_t i = 0 ;
   while(L!= NULL)
   {
      i++ ;
      L=L->next;
   }
   return(i) ;
}
