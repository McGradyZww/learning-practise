#include "mpi.h"
#include <iostream>
#include <cstring>

void myMPI_Alltoall(void *sendbuf, int sendcount, MPI_Datatype senddatatype,
    void *recvbuf, int recvcount, MPI_Datatype recvdatatype, MPI_Comm comm)
{
    int group_size;
    int my_rank;
    MPI_Comm_size(comm, &group_size);
    MPI_Comm_rank(comm, &my_rank);
    
//    std::cout << "my rank is:" << my_rank << " my size is: " << group_size << std::endl;
    int i;
    int size = 0;
    MPI_Type_size(senddatatype, &size);
    for (i=0; i<group_size; i++)
    {
        if (i==my_rank)
        {
            memcpy(*(int**)(&recvbuf) + recvcount*size/sizeof(int)*i,
             sendbuf, sendcount*size);
        }
        else
        {
            MPI_Send(sendbuf, sendcount, senddatatype, i, 0, comm);
        }
        *(int**)(&sendbuf) += sendcount*size/sizeof(int);
    }
//    std::cout << "process " << my_rank << " started receiving message" << std::endl;
    
    MPI_Type_size(senddatatype, &size);
    for (i=0; i<group_size; i++)
    {
        if (i==my_rank)
        {
            ;
        }
        else
        {
            MPI_Recv(recvbuf, recvcount, recvdatatype, i, 0, comm, MPI_STATUS_IGNORE);
        }
        *(int**)(&recvbuf)  += recvcount*size/sizeof(int);
    }
}

