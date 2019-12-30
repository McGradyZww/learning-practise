#include <iostream>
#include <fstream>
#include <string>
#include <omp.h>

#define PRINT_LINE std::cout << "goes to line: " << __LINE__ << std::endl

static int n;
static int block_size;
static int group_size;

inline double &element(double *pData, int i, int j)
{
    return pData[i*n+j];
}

inline double *get_address(double *pData, int i, int j)
{
    return pData+i*n+j;
}

bool load_matrix(double* &pData, const char *file_name)
{
    std::ifstream inf;
    inf.open(file_name);
    if (!inf)
    {
        std::cout << "cannot open file: " << file_name << std::endl;
        return false;
    }
    inf >> n;
    #pragma omp parallel shared(group_size)
    {
        if (omp_get_thread_num() == 0)
        {
            group_size = omp_get_num_threads();
        }
    }
    block_size = (n+group_size-1) /group_size;
    pData = new double[n*group_size*block_size];
    for (int i=0; i<n; i++)
    {
        for (int j=0; j<n; j++)
        {
            inf >> element(pData, i, j);
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
            std::cout.setf(std::ios::fixed);
            std::cout.width(8);
            std::cout.precision(4);
            std::cout << element(pData, i, j);
        }
        std::cout << std::endl;
    }
}

int main(int argc, char *argv[])
{
    double *pData;
    std::string file_name;
    if (argc == 1)
    {
        file_name = "./matrix55.txt";
    }
    else
    {
        file_name = argv[1];
    }
    if (!load_matrix(pData, file_name.c_str()))
    {
        return -1;
    }
    std::cout << "before LU:" << std::endl;
    print_matrix(pData);
    for (int k=0; k<n; k++)
    {
        int hostid = k/block_size;
        double akk = element(pData, k, k);
        int my_rank;
        double *pNodeData;
        #pragma omp parallel private(my_rank, pNodeData), \
            shared(k, hostid, pData, group_size, block_size)
        {
            my_rank = omp_get_thread_num();
            pNodeData = pData + my_rank*n*block_size;
            if (my_rank == hostid)
            {
                int blockk = k % block_size;
                for (int i=blockk+1; i<block_size; i++)
                {
                    element(pNodeData, i, k) /= akk;
                }
                for (int i=blockk+1; i<block_size; i++)
                {
                    for (int j=k+1; j<n; j++)
                    {
                        element(pNodeData, i, j) -=
                            element(pNodeData, i, k) * element(pNodeData, blockk, j);
                    }
                }
            }
            else
            {
                if (my_rank > hostid)
                {
                    for (int i=0; i<block_size; i++)
                    {
                        element(pNodeData, i, k) /= akk;
                    }
                    for (int i=0; i<block_size; i++)
                    {
                        for (int j=k+1; j<n; j++)
                        {
                            element(pNodeData, i, j) -=
                                element(pNodeData, i, k) * element(pData, k, j);
                        }
                    }
                }
            }
        }
    }
    std::cout << std::endl;
    std::cout << "after LU:" << std::endl;
    print_matrix(pData);
    //check
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
    std::cout << "matrix recoverd from LU:" << std::endl;
    print_matrix(pRes);
    delete[] pRes;
    delete[] pData;

    return 0;
}

