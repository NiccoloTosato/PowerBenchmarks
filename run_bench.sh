#!/usr/bin/bash
#export OPENBLAS_NUM_THREADS=1
#module load openBLAS/0.3.23
#dgemm/gemm_oblas.x 10000 10000 10000  2>&1 > dgemm.out &



profile_likwid () {
    echo "--------Start $1 benchmark---------"
    echo "----------Running $1-----------"
    likwid-bench -t $1 -W C1:32GB:1:1:1 -s 1 > $1.out
    echo "----------Profiling $1-----------"
    likwid-bench -t $1 -W C1:32GB:1:1:1 -s 1 > $1_profiled.out &
    PID=$!
    efimon-pid-power-analyser --pid ${PID} -s 10  >> power_$1.csv
    echo "---------End profiling $1----------"
}


profile_likwid "copy" 
profile_likwid "copy_mem"
profile_likwid "copy_mem_avx"

profile_likwid "daxpy_mem_avx_fma"
profile
#Single core command

#likwid-bench -t copy -W C1:32GB:1:1:1 -s 1 > copy.out
#likwid-bench -t copy_mem -W C1:32GB:1:1:1 -s 1 > copy_mem.out
#likwid-bench -t copy_mem_avx -W C1:32GB:1:1:1 -s 1 > copy_mem_avx.out
#likwid-bench -t daxpy_mem_avx_fma  -W C1:32GB:1:1:1 -s 1 > daxpy_mem_avx_fma.out
#likwid-bench -t stream_mem_avx_fma  -W C1:32GB:1:1:1 -s 1 > stream_mem_avx_fma.out
#likwid-bench -t update_avx  -W C1:32GB:1:1:1 -s 1 > update_avx.out
#likwid-bench -t load_mem  -W C1:32GB:1:1:1 -s 1 > load_mem.out
#likwid-bench -t load_mem_avx  -W C1:32GB:1:1:1 -s 1 > load_mem_avx.out
#likwid-bench -t store_mem  -W C1:32GB:1:1:1 -s 1 > store_mem.out
#likwid-bench -t store_mem_avx  -W C1:32GB:1:1:1 -s 1 > store_mem_avx.out
#likwid-bench -t peakflops_avx_fma  -W C1:32GB:1:1:1 -s 1 > peakflops_avx_fma.out

