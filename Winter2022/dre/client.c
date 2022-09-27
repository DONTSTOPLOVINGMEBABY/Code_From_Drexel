#include "csapp.h"
#include "csapp.c"

int main(int argc, char **argv)
{
    int clientfd, port, var ; 
    char *host, buf[MAXLINE] ; 
    rio_t rio ;                 
    char *file ;                    

    if (argc != 4) {
        fprintf(stderr, "usage: %s <host> <port> <file>\n", argv[0]);
        exit(0);
    }
    
    host = argv[1] ; port = atoi(argv[2]) ; file = argv[3] ; 

    clientfd = Open_clientfd(host, port) ; 
    Rio_readinitb(&rio, clientfd) ; 
    sprintf(buf,"GET /%s HTTP/1.1\r\nHost: %s\r\n\r\n", argv[3], host) ; 

    Rio_writen(clientfd, buf, strlen(buf)) ; 

    while (( var = Rio_readlineb(&rio, buf, MAXLINE)) != 0) {
        Fputs(buf, stdout) ; 
        bzero(buf, MAXLINE) ; 
    }

    close(clientfd) ; 
    exit(0) ; 


}