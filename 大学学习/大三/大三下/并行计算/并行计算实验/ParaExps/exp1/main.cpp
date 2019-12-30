#include <iostream>
#include "alltoall.h"

int main(int argc, char *argv[])
{
    int group_size = 0;
    int my_rank = -1;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &group_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
    int *sendbuf = new int[group_size*2];
    int *recvbuf = new int[group_size*2];
//    std::cout << "my rank is:" << my_rank << " my size is: " << group_size << std::endl;
    for (int i=0; i<group_size*2; i++)
    {
        sendbuf[i] = my_rank;recvbuf[i] = -1;
    }
    myMPI_Alltoall(sendbuf, 2, MPI_INT,
    recvbuf, 2, MPI_INT, MPI_COMM_WORLD);
    for (int i=0; i<group_size*2; i++)
    {
        std::cout << "thread " << my_rank << " got a message from " << recvbuf[i] << std::endl;
    }
    MPI_Finalize();
    return 0;
}

