/*
* echoclient.c - An echo client
*/
#include "csapp.h"

int main(int argc, char **argv)  
 {
  int clientfd, *connect_fd, port;
  char *host, buf[MAXLINE];
  rio_t rio;

  if (argc != 2) 
{
    fprintf(stderr, "usage: %s <port>\n", argv[0]);
    exit(0);
   }
  port = atoi(argv[1]);

  clientfd = Open_clientfd(host, port);
  Rio_readinitb(&rio, clientfd);

  while (1) 
   {
        connect_fd = malloc(MAXLINE);
        Rio_writen(clientfd, buf, strlen(buf));
        Rio_readlineb(&rio, buf, MAXLINE);
        Fputs(buf, stdout);
   }
  Close(clientfd);
  exit(0);
 }
