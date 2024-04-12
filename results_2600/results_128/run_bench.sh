##!/usr/bin/bash
##export OPENBLAS_NUM_THREADS=1
##module load openBLAS/0.3.23
##dgemm/gemm_oblas.x 10000 10000 10000  2>&1 > dgemm.out &



profile_likwid () {
    echo "--------Start $1 benchmark---------"
#    echo "----------Running $1-----------"
#    likwid-bench -t $1 -W C1:32GB:1:1:1 -s 100 > $1.out
    echo "----------Profiling $1-----------"
    likwid-bench -t $1 -W N:490GB:128:4:4 -i 350 > $1_profiled.out &
    PID=$!
    taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 100  > power_$1.csv
    echo "---------End profiling $1----------"
    wait
}

#time profile_likwid "copy" 
#time profile_likwid "copy_mem"
#time profile_likwid "copy_mem_avx"
#time profile_likwid "daxpy_mem_avx_fma"
#time profile_likwid "stream_mem_avx_fma"
#time profile_likwid "update_avx"
time profile_likwid "load_mem"
time profile_likwid "load_avx"
time profile_likwid "store_mem"
time profile_likwid "store_mem_avx"
time profile_likwid "peakflops_avx_fma"


