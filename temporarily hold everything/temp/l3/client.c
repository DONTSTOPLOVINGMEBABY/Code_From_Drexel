#include "csapp.h"

int main(int argc, char **argv)
{
    int clientfd, port;
    char *host, buf[MAXLINE];
    char *file;
    rio_t rio;
    int n;
    if (argc != 4){
        fprintf(stderr, "usage: %s <host> <port> <file>\n", argv[0]);
        exit(0);
    }

    host = argv[1];
    port = atoi(argv[2]);
    file = argv[3];

    clientfd = Open_clientfd(host, port);
    Rio_readinitb(&rio, clientfd);

    /*  
    strcat the get string

    riowriten the req string to clientfd
    */

    char *str1 = "GET /";
    strcat(str1, file);
    strcat(str1, " HTTP/1.1");
    strcat(str1, "\nHost: ");
    strcat(str1, host);
    strcat(str1, "\r\n");
    strcat(str1, "\r\n");
    
    printf("%s", str1);

    Rio_writen(clientfd, str1, MAXLINE);

    while(Rio_readlineb(&rio, buf, MAXLINE) != 0)
    {
        Fputs(buf, stdout);
        fflush(stdout);
    }
    
    Close(clientfd);
    exit(0);
}
