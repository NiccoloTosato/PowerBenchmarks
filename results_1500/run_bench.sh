##!/usr/bin/bash
##export OPENBLAS_NUM_THREADS=1
##module load openBLAS/0.3.23
##dgemm/gemm_oblas.x 10000 10000 10000  2>&1 > dgemm.out &



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

#time profile_likwid_fan "copy" 
#time profile_likwid_fan "copy_mem"
#time profile_likwid_fan "copy_mem_avx"
#time profile_likwid_fan "daxpy_mem_avx_fma"
#time profile_likwid_fan "stream_mem_avx_fma"
#time profile_likwid_fan "update_avx"
#time profile_likwid_fan "load_mem"
#time profile_likwid_fan "load_avx"
#time profile_likwid_fan "store_mem"
#time profile_likwid_fan "store_mem_avx"
#time profile_likwid_fan "peakflops_avx_fma"


#time profile_likwid_32 "copy"
#time profile_likwid_32 "copy_mem"
#time profile_likwid_32 "copy_mem_avx"
#time profile_likwid_32 "daxpy_mem_avx_fma"
#time profile_likwid_32 "stream_mem_avx_fma"
#time profile_likwid_32 "update_avx"
#time profile_likwid_32 "load_mem"
#time profile_likwid_32 "load_avx"
#time profile_likwid_32 "store_mem"
#time profile_likwid_32 "store_mem_avx"
#time profile_likwid_32 "peakflops_avx_fma"

#time profile_likwid_64 "copy"
#time profile_likwid_64 "copy_mem"
#time profile_likwid_64 "copy_mem_avx"
#time profile_likwid_64 "daxpy_mem_avx_fma"
#time profile_likwid_64 "stream_mem_avx_fma"
#time profile_likwid_64 "update_avx"
#time profile_likwid_64 "load_mem"
#time profile_likwid_64 "load_avx"
#time profile_likwid_64 "store_mem"
#time profile_likwid_64 "store_mem_avx"
#time profile_likwid_64 "peakflops_avx_fma"

time profile_likwid_96 "copy"
time profile_likwid_96 "copy_mem"
time profile_likwid_96 "copy_mem_avx"
time profile_likwid_96 "daxpy_mem_avx_fma"
time profile_likwid_96 "stream_mem_avx_fma"
time profile_likwid_96 "update_avx"
time profile_likwid_96 "load_mem"
time profile_likwid_96 "load_avx"
time profile_likwid_96 "store_mem"
time profile_likwid_96 "store_mem_avx"
time profile_likwid_96 "peakflops_avx_fma"

time profile_likwid_128 "copy"
time profile_likwid_128 "copy_mem"
time profile_likwid_128 "copy_mem_avx"
time profile_likwid_128 "daxpy_mem_avx_fma"
time profile_likwid_128 "stream_mem_avx_fma"
time profile_likwid_128 "update_avx"
time profile_likwid_128 "load_mem"
time profile_likwid_128 "load_avx"
time profile_likwid_128 "store_mem"
time profile_likwid_128 "store_mem_avx"
time profile_likwid_128 "peakflops_avx_fma"
