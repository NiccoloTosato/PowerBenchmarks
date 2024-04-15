##!/usr/bin/bash
##export OPENBLAS_NUM_THREADS=1
##module load openBLAS/0.3.23
##dgemm/gemm_oblas.x 10000 10000 10000  2>&1 > dgemm.out &

export LD_LIBRARY_PATH=/root/niccolo/benchmarks/dgemm/lib
export PATH=/root/niccolo/benchmarks/dgemm/:$PATH

export OPENBLAS_NUM_THREADS=1
taskset -c 4-8 gemm_oblas.x 20000 10000 10000  &  #2>&1 > dgemm.out &
PID=$!
taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50 > power_1.csv
wait


export OPENBLAS_NUM_THREADS=4
taskset -c 4-8 gemm_oblas.x 40000 10000 10000  &  #2>&1 > dgemm.out &
PID=$!
taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50 > power_4.csv
wait


export OPENBLAS_NUM_THREADS=8
taskset -c 4-16 gemm_oblas.x 80000 10000 10000  &  #2>&1 > dgemm.out &
PID=$!
taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50 > power_8.csv
wait


export OPENBLAS_NUM_THREADS=16
taskset -c 4-20 gemm_oblas.x 160000 10000 10000  &  #2>&1 > dgemm.out &
PID=$!
taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50 > power_16.csv
wait

export OPENBLAS_NUM_THREADS=32
taskset -c 4-36 gemm_oblas.x 200000 10000 10000  &  #2>&1 > dgemm.out &
PID=$!
taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50 > power_32.csv
wait

export OPENBLAS_NUM_THREADS=64
taskset -c 0-64 gemm_oblas.x 2000000 10000 10000  &  #2>&1 > dgemm.out &
PID=$!
taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50 > power_64.csv
wait

export OPENBLAS_NUM_THREADS=128
gemm_oblas.x 200000 10000 10000  &  #2>&1 > dgemm.out &
PID=$!
taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50 > power_128.csv
wait












profile_likwid_fan () {
    echo "--------Start $1 benchmark---------"
    echo "----------Profiling $1-----------"
    likwid-bench -t $1 -W C1:32GB:1:1:1 -i 150 > results_fan/$1_profiled.out &
    PID=$!
    taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > results_fan/power_$1.csv
    echo "---------End profiling $1----------"
    wait
}

profile_likwid_32 () {
    echo "--------Start $1 benchmark---------"
    echo "----------Profiling $1-----------"
    likwid-bench -t $1 -W N:128GB:32:1:4 -i 600 > results_32/$1_profiled.out &
    PID=$!
    taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > results_32/power_$1.csv
    echo "---------End profiling $1----------"
    wait
}

profile_likwid_64 () {
    echo "--------Start $1 benchmark---------"
    echo "----------Profiling $1-----------"
    likwid-bench -t $1 -W N:256GB:64:2:4 -i 400 > results_64/$1_profiled.out &
    PID=$!
    taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > results_64/power_$1.csv
    echo "---------End profiling $1----------"
    wait
}

profile_likwid_96 () {
    echo "--------Start $1 benchmark---------"
    echo "----------Profiling $1-----------"
    likwid-bench -t $1 -W N:384GB:96:3:4 -i 400 > results_96/$1_profiled.out &
    PID=$!
    taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > results_96/power_$1.csv
    echo "---------End profiling $1----------"
    wait
}
profile_likwid_128 () {
    echo "--------Start $1 benchmark---------"
    echo "----------Profiling $1-----------"
    likwid-bench -t $1 -W N:490GB:128:4:4 -i 400 > results_128/$1_profiled.out &
    PID=$!
    taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > results_128/power_$1.csv
    echo "---------End profiling $1----------"
    wait
}

profile_likwid_sleep () {
    echo "--------Start $1 benchmark---------"
    echo "----------Profiling $1-----------"
    #    likwid-bench -t $1 -W N:490GB:128:4:4 -i 400 > results_128/$1_profiled.out &
    sleep 200 &
    PID=$!
    taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > results_128/power_$1.csv
    echo "---------End profiling $1----------"
    wait
}
