#include <mpi.h>
#include <iostream>
#include <fstream>
#include <string>
#include "matrix.h"
#include <cstdlib>

static int my_rank;
static int group_size;
static int m;
static int n;
static int k;

#define PRINT_LINE std::cout << "proc " << my_rank << " goes to line " << __LINE__ << std::endl

inline int the_proc(int i, int j)
{
    return i*k+j;
}

inline int get_proc_i(int rank)
{
    return rank / k;
}

inline int get_proc_j(int rank)
{
    return rank % k;
}

inline void single_broadcast(int n, int low, int high)
{
    for (int i=low; i<high; i++)
    {
        MPI_Send(&n, 1, MPI_INT, i, 0, MPI_COMM_WORLD);
    }
}

inline void single_send(int n, int dest)
{
    MPI_Send(&n, 1, MPI_INT, dest, 0, MPI_COMM_WORLD);
}

inline void single_recv(int &n, int src)
{
    MPI_Status status;
    MPI_Recv(&n, 1, MPI_INT, src, 0, MPI_COMM_WORLD, &status);
}

inline void single_send(double x, int dest)
{
    MPI_Send(&x, 1, MPI_DOUBLE, dest, 0, MPI_COMM_WORLD);
}

inline void single_recv(double &x, int src)
{
    MPI_Status status;
    MPI_Recv(&x, 1, MPI_DOUBLE, src, 0, MPI_COMM_WORLD, &status);
}

inline void multi_send(double *pData, int size, int dest)
{
    MPI_Send(pData, size, MPI_DOUBLE, dest, 0, MPI_COMM_WORLD);
}

inline void multi_recv(double *pData, int size, int src)
{
    MPI_Status status;
    MPI_Recv(pData, size, MPI_DOUBLE, src, 0, MPI_COMM_WORLD, &status);
}

bool load_matrix(Matrix &matrix, const char *filename)
{
    std::ifstream inf;
    inf.open(filename);
    if (!inf)
    {
        std::cout << "cannot open file: " << filename << std::endl;
        return false;
    }
    int mm, nn;
    inf >> mm >> nn;
    matrix.resize(mm,nn);
    for (int i=0; i<mm; i++)
    {
        for (int j=0; j<nn; j++)
        {
            inf >> matrix.theElem(i,j);
        }
    }
    return true;
}

int main(int argc, char *argv[])
{
    Matrix m1, m2, result;
    std::string file_name1, file_name2;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &group_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
    if (argc < 3)
    {
        file_name1 = "matrix45.txt";
        file_name2 = "matrix56.txt";
    }
    else
    {
        file_name1 = argv[1];
        file_name2 = argv[2];
    }
    if (my_rank == 0)
    {
        if (!load_matrix(m1, file_name1.c_str()) ||
            !load_matrix(m2, file_name2.c_str()))
        {
            std::cout << "cannot load matrix" << std::endl;
            MPI_Finalize();
            return -1;
        }
        if (m1.mN != m2.mM)
        {
            std::cout << "size not match" << std::endl;
            MPI_Finalize();
            return -1;
        }
        m1.print();
        std::cout << std::endl;
        m2.print();
        Matrix m3 = m2.getTransposed();
        std::cout << std::endl;
        m3.print();
        m = m1.mM; n = m1.mN; k = m2.mN;
    }
    MPI_Finalize();
    return 0;
}

