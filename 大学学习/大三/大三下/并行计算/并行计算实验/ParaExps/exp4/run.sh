export OMP_NUM_THREADS=$2
mpirun -n $1 ./exp4 $3

