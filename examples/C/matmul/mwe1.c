#include <stdio.h> // printf
#include <stdlib.h> // malloc
int main() {
    int* ptr = (int*) malloc(10*sizeof(int));
    printf("a value: %d",ptr[4]);
}
