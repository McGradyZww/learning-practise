#include "mpi.h"
#include <iostream>
#include <fstream>
#include <string>

#define PRINT_LINE std::cout << "process " << my_rank << " goes to line: " << __LINE__ << std::endl

static int group_size;
static int my_rank;
static int n;
static int block_size;

inline double *get_address(double *pData, int i, int j)
{
    return pData+i*n+j;
}

inline void single_broadcast(double x, int low, int high)
{
    for (int i=low; i<high; i++)
    {
        MPI_Send(&x, 1, MPI_DOUBLE, i, 0, MPI_COMM_WORLD);
    }
}

inline void single_recv(double &x, int src)
{
    MPI_Status status;
    MPI_Recv(&x, 1, MPI_DOUBLE, src, 0, MPI_COMM_WORLD, &status);
}

inline void multi_broadcast(double *pData, int size, int low, int high)
{
    for (int i=low; i<high; i++)
    {
        MPI_Send(pData, size, MPI_DOUBLE, i, 0, MPI_COMM_WORLD);
    }
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

inline void single_broadcast(int n, int low, int high)
{
    for (int i=low; i<high; i++)
    {
        MPI_Send(&n, 1, MPI_INT, i, 0, MPI_COMM_WORLD);
    }
}

inline void single_recv(int &n, int src)
{
    MPI_Status status;
    MPI_Recv(&n, 1, MPI_INT, src, 0, MPI_COMM_WORLD, &status);
}

inline void sync(void)
{
#ifdef DEBUG
    int sync = 0;
    if (my_rank == 0)
    {
        single_broadcast(sync, 1, group_size);
    }
    else
    {
        single_recv(sync, 0);
    }
#endif
}

bool load_matrix(double* &pData, const char *file_name)
{
    std::ifstream inf;
    inf.open(file_name);
    if (!inf)
    {
        std::cout << "cannot open file" << file_name << std::endl;
        return false;
    }
    inf >> n;
    block_size = (n+group_size-1) / group_size;
    pData = new double[n*block_size*group_size];
    for (int i=0; i<n; i++)
    {
        for (int j=0; j<n; j++)
        {
            inf >> pData[i*n+j];
        }
    }
    return true;

}

void print_matrix(double *pData)
{
    for (int i=0; i<n; i++)
    {
        for (int j=0; j<n; j++)
        {
            std::cout.width(8);
            std::cout.precision(4);
            std::cout.setf(std::ios::fixed);
            std::cout << pData[i*n+j];
        }
        std::cout << std::endl;
    }
}

void print_line(double *pData, int line_num)
{
#ifdef DEBUG
    if (my_rank == line_num)
    {
        std::cout << "line " << my_rank << "'s data:";
        for (int i=0; i<n; i++)
        {
            std::cout.width(5);
            std::cout.precision(2);
            std::cout << *get_address(pData, my_rank, i);
        }
        std::cout << std::endl;
    }
#endif
}

void print_multi(double *pData, int count, int proc_id)
{
#ifdef DEBUG
    if (my_rank == proc_id)
    {
        std::cout << "proc " << proc_id << " puts:";
        for (int i=0; i<count; i++)
        {
            std::cout.width(5);
            std::cout.precision(2);
            std::cout << pData[i];
        }
        std::cout << std::endl;
    }
#endif
}

int main(int argc, char *argv[])
{
    std::string file_name;
    
    double *pData = 0;
    double *pNodeData = 0;
    double *partialLine = 0;
    
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &group_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
    if (my_rank == 0)
    {
        if (argc == 1)
        {
            file_name = "matrix55.txt";
        }
        else
        {
            file_name = argv[1];
        }
        if (!load_matrix(pData, file_name.c_str()))
        {
            std::cout << "cannot load matrix" << std::endl;
            MPI_Finalize();
            return 0;
        }
        single_broadcast(n, 1, group_size);
    }
    else
    {
        single_recv(n, 0);
        block_size = (n+group_size-1) / group_size;
        pNodeData = pData + my_rank*block_size*n;
        pData = new double[n*block_size*group_size];
    }
    pNodeData = pData + my_rank*block_size*n;
    partialLine = new double[n];
    if (my_rank == 0)
    {
        for (int i=1; i<group_size; i++)
        {
            multi_send(pData+i*block_size*n, block_size*n, i);
        }
    }
    else
    {
        multi_recv(pNodeData, block_size*n, 0);
    }
    //finished data initialize
    int print_rank = 0;
    if (my_rank == print_rank)
    {
        std::cout << "before LU: " << std::endl;
        print_matrix(pData);
    }
    //sync();
    for (int k=0; k<n; k++)
    {
        int signal;
        int hostid = k/block_size;
        double akk;
        if (my_rank == hostid)
        {
            int blockk = k % block_size;
            akk = *get_address(pData, k, k);
            single_broadcast(akk, hostid+1, group_size);
            multi_broadcast(get_address(pNodeData, blockk, k+1), n-k-1, hostid+1, group_size);
            for (int i=blockk+1; i<block_size; i++)
            {
                *get_address(pNodeData, i, k) /= akk;
            }
            for (int i=blockk+1; i<block_size; i++)
            {
                for (int j=k+1; j<n; j++)
                {
                    *get_address(pNodeData, i, j) -= *get_address(pNodeData, i, k) * *get_address(pNodeData, blockk, j);
                }
            }
        }
        else if (my_rank > hostid)
        {
            single_recv(akk, hostid);
            multi_recv(partialLine, n-k-1, hostid);
            print_multi(partialLine, n-k-1, 2);
            print_line(pData, 2);
            for (int i=0; i<block_size; i++)
            {
                *get_address(pNodeData, i, k) /= akk;
            }
            for (int i=0; i<block_size; i++)
            {
                for (int j=k+1; j<n; j++)
                {
                    *get_address(pNodeData, i, j) -= *get_address(pNodeData, i, k) * partialLine[j-k-1];
                }
            }
            print_line(pData, 2);
        }
    }
    if (my_rank == 0)
    {
        for (int i=1; i<group_size; i++)
        {
            multi_recv(pData + i*block_size*n, block_size*n, i);
        }
    }
    else
    {
        multi_send(pData + my_rank*block_size*n, block_size*n, 0);
    }
    if (my_rank == print_rank)
    {
        std::cout << std::endl;
        std::cout << "after LU:" << std::endl;
        print_matrix(pData);
    }
    //check
    if (my_rank == 0)
    {
        double *pRes = new double[n*n];
        for (int i=0; i<n; i++)
        {
            for (int j=0; j<n; j++)
            {
                pRes[i*n+j] = 0;
                if (i>j)
                {
                    for (int k=0; k<=j; k++)
                    {
                        pRes[i*n+j] += pData[i*n+k]*pData[k*n+j];
                    }
                }
                else if (i==j)
                {
                    pRes[i*n+j] += pData[i*n+j];
                    for (int k=0; k<j; k++)
                    {
                        pRes[i*n+j] += pData[i*n+k]*pData[k*n+j];
                    }
                }
                else
                {
                    pRes[i*n+j] += pData[i*n+j];
                    for (int k=0; k<i; k++)
                    {
                        pRes[i*n+j] += pData[i*n+k]*pData[k*n+j];
                    }
                }
            }
        }
        std::cout << std::endl;
        std::cout << "matrix recovered from LU:" << std::endl;
        print_matrix(pRes);
        delete[] pRes;
    }
    delete[] pData;
    MPI_Finalize();
    return 0;
}

