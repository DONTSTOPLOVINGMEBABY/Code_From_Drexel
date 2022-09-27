#include "csapp.h"
#include "csapp.c"

int final = 0 ; 


void echo(int connfd)
{
    int file1 ; 
    size_t n ; 
    char buf1[MAXLINE], buf2[MAXLINE] ; 
    char * file2, * var ; 
    rio_t rio1, rio2 ;
    
    Rio_readinitb(&rio1, connfd) ; 
    Rio_readlineb(&rio1, buf2, MAXLINE) ;

    var = strtok(buf2, " ") ; 
    file2 = strtok(NULL, " ") ; 
    file2++ ; 

    file1 = open(file2, O_RDONLY, 0) ; 
    Rio_readinitb(&rio2, file1) ; 

    while ((n = Rio_readlineb(&rio2, buf1, MAXLINE)) != 0)
    {
        printf("server has received %ld bytes\n", n) ; 
        Rio_writen(connfd, buf1, n) ; 
		
		final += n ; 

    }

    close(file1) ; 
    close(connfd) ; 
}


int main(int argc, char **argv) 
{
    int listenfd, connfd, port, clientlen ; 
    struct sockaddr_in clientaddr ; 
    struct hostent *hp ; 
    char *haddrp ; 

    if (argc != 2){
        fprintf(stderr, "usage: %s <port>\n", argv[0]) ; 
        exit(0) ; 
    }

    port = atoi(argv[1]) ; 
    listenfd = Open_listenfd(port) ; 
	
 
	
    while(1) { 
        printf("\nYou are receiving this message because the server is open and ready to receive connections\n\n") ; 
        clientlen = sizeof(clientaddr) ; 
        connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen) ; 
        hp = Gethostbyaddr((const char *)&clientaddr.sin_addr.s_addr,   
        sizeof(clientaddr.sin_addr.s_addr), AF_INET) ;                  
        haddrp = inet_ntoa(clientaddr.sin_addr) ;
        printf("server connected to %s (%s)\n", hp->h_name, haddrp) ;
        printf("%d\n", final) ; 

		  echo(connfd) ; 
	
			
    }

	printf("%d\n", final) ; 
	printf("here it is\n") ; 

    exit(0) ;  
}


