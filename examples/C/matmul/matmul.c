// matmul.c
// avercruysse@hmc.edu 07 Feb 2023

#include <stdio.h>  // supports printf
#include "util.h"   // supports verify
#include <stdlib.h>

void matmul(int N, double a[], double b[], double c[]) {
    double res;
    for (int row = 0; row < N ; row++) {
        for (int col = 0; col < N; col++) {
            c[row*N+col] = 0;
            for (int doti = 0; doti < N; doti++) {
                c[row*N+col] += a[row*N+doti] * b[doti*N+col];
            }
        }
    }
}

// for debug.
void printMat(int N, double a[]) {
    printf("matrix:");
    printf("\n");
    for (int i = 0; i < N; i++) {
        printf("[%3d", (int) a[i*N]);
        for (int j = 1; j < N; j++) {
            printf(", %3d", (int) a[i*N+j]);
        }
        printf("]");
        printf("\n");
    }
}

void run_matmult10() {
    // just store it as a 1d array for ease, row-major order
    // malloc does not exist in our tiny stdlib!!
    // we cannot dynamically allocate memory?
    double a[100];
    double b[100];
    double c[100];
    int N = 10;
    
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            a[i*N+j] = i + j;
            b[i*N+j] = i - j;
        }
    }
    printf("N = %d:", N);
    printf("\n");
    setStats(1);
    matmul(N, a, b, c);
    setStats(0);
}

void run_matmult20() {
    // just store it as a 1d array for ease, row-major order
    // malloc does not exist in our tiny stdlib!!
    // we cannot dynamically allocate memory?
    double a[400];
    double b[400];
    double c[400];
    int N = 20;
    
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            a[i*N+j] = i + j;
            b[i*N+j] = i - j;
        }
    }
    printf("N = %d:", N);
    printf("\n");
    setStats(1);
    matmul(N, a, b, c);
    setStats(0);
}

void run_matmult40() {
    // just store it as a 1d array for ease, row-major order
    // malloc does not exist in our tiny stdlib!!
    // we cannot dynamically allocate memory?
    int N = 40;
    double *a = (double*) malloc(N*sizeof(double));
    double *b = (double*) malloc(N*sizeof(double));
    double *c = (double*) malloc(N*sizeof(double));
    
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            a[i*N+j] = i + j;
            b[i*N+j] = i - j;
        }
    }
    printf("N = %d:", N);
    printf("\n");
    setStats(1);
    matmul(N, a, b, c);
    setStats(0);
}

int main(void) {
    // uncomment one at a time to get execution times!
    //run_matmult10();
    //run_matmult20();
    run_matmult(40);
}
