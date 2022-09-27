/*
* CS283
* ndk34: Lab 2
*/

#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <dirent.h>



int main(int argc, char* argv[]){
    // char* arr1[];
    char *p1 = argv[1];
    char *p2 = argv[2];
    p1 = realpath(p1, NULL);
    p2 = realpath(p2, NULL);

    if (argc != 3){
        printf("Error: Pass 2 arguments.\n");
    }
    int max_file_count = 20;
    int max_fname_length = 10;
    struct dirent *directory1;
    DIR *dir_p1, *dir_p2;
    dir_p1 = opendir(p1);
    dir_p2 = opendir(p2);

    char **file1;
    char **file2;

    file1 = malloc(max_file_count * sizeof(char *));
    file2 = malloc(max_file_count * sizeof(char *));

    for (int i = 0; i < max_file_count; i++){
        file1[i] = malloc(max_fname_length * sizeof(char *));
        file2[i] = malloc(max_fname_length * sizeof(char *));
    }

    int loc1 = 0;
    int loc2 = 0;
    
    if ((dir_p1 == NULL)|| (dir_p2 == NULL)){
        printf ("Error: Directory not found.\n");
        return 1;
    }

    while((directory1 = readdir(dir_p1)) != NULL){
        // printf("%s\n", directory1->d_name);
        strcpy(file1[loc1], directory1->d_name);
        loc1 ++;
    }
    while((directory1 = readdir(dir_p2)) != NULL){
        // printf("%s\n", directory1->d_name);
        strcpy(file2[loc2], directory1->d_name);
        loc2 ++;
    }
    
    char *copy;
    
    for (int i = 0; i < 10; i++) {
        copy = p2;
        if(strcmp(file1[i], file2[i]) != 0){
            strcat(copy, "/");
            strcat(copy, file1[i]);
            fopen(copy, "a");
            printf("%s\n", copy);
        }
    } 
}

