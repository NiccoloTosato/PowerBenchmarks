q#!/usr/bin/bash

export LD_LIBRARY_PATH=/root/niccolo/benchmarks/dgemm/lib
export PATH=/root/niccolo/benchmarks/dgemm/:$PATH


#export OPENBLAS_NUM_THREADS=1
export OMP_PROC_BIND=spread
export OMP_PLACES=cores

#numactl --interleave=0,1,2,3 gemm_oblas.x 10000 10000 10000  &  #2>&1 > dgemm.out &
#PID=$!
#efimon-pid-power-analyser --pid ${PID} -s 50 > power_1.csv
#wait

export OMP_NUM_THREADS=62
export OPENBLAS_NUM_THREADS=62
OMP_NUM_THREADS=62  gemm_oblas.x 16000 16000 16000  &  #2>&1 > dgemm.out &
#PID=$!
#efimon-pid-power-analyser --pid ${PID} -s 50 > power_2.csv
#wait
exit
export OMP_NUM_THREADS=4
#export OPENBLAS_NUM_THREADS=4
numactl --interleave=0,1,2,3  gemm_oblas.x 23000 23000 23000  &  #2>&1 > dgemm.out &
PID=$!
efimon-pid-power-analyser --pid ${PID} -s 50 > power_4.csv
wait

export OMP_NUM_THREADS=8
export OPENBLAS_NUM_THREADS=8
numactl --interleave=0,1,2,3  gemm_oblas.x 33000 33000 33000  &  #2>&1 > dgemm.out &
PID=$!
efimon-pid-power-analyser --pid ${PID} -s 50 > power_8.csv
wait

export OMP_NUM_THREADS=16
export OPENBLAS_NUM_THREADS=16
numactl --interleave=0,1,2,3  gemm_oblas.x 47000 47000 47000  &  #2>&1 > dgemm.out &
PID=$!
efimon-pid-power-analyser --pid ${PID} -s 50 > power_16.csv
wait

export OMP_NUM_THREADS=32
export OPENBLAS_NUM_THREADS=32
numactl --interleave=0,1,2,3  gemm_oblas.x 67000 67000 67000  &  #2>&1 > dgemm.out &
PID=$!
efimon-pid-power-analyser --pid ${PID} -s 50 > power_32.csv
wait

export OMP_NUM_THREADS=64
export OPENBLAS_NUM_THREADS=64
numactl --interleave=0,1,2,3  gemm_oblas.x 95000 95000 95000  &  #2>&1 > dgemm.out &
PID=$!
taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50 > power_64.csv
wait

export OMP_NUM_THREADS=96
export OPENBLAS_NUM_THREADS=96
numactl --interleave=0,1,2,3  gemm_oblas.x 116000 116000 116000  &  #2>&1 > dgemm.out &
PID=$!
efimon-pid-power-analyser --pid ${PID} -s 50 > power_96.csv
wait

export OMP_NUM_THREADS=128
export OPENBLAS_NUM_THREADS=128
numactl --interleave=0,1,2,3  gemm_oblas.x 134000 134000 134000  &  #2>&1 > dgemm.out &
PID=$!
efimon-pid-power-analyser --pid ${PID} -s 50 > power_128.csv
wait






