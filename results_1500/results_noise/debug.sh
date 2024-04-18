
export LD_LIBRARY_PATH=/root/niccolo/benchmarks/dgemm/lib
export PATH=/root/niccolo/benchmarks/dgemm/:$PATH



#OMP_NUM_THREADS=16 numactl --interleave=0,1,2,3  gemm_oblas.x 67000 67000 67000  &
#likwid-bench -t peakflops_avx_fma -W S0:256GB:8:1:1 -i 150 
#PID=$!
#taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > power_8.csv
#wait

#OMP_NUM_THREADS=16 numactl --interleave=0,1,2,3  gemm_oblas.x 67000 67000 67000  &
#likwid-bench -t peakflops_avx_fma -W S0:256GB:16:1:1 -i 150
#PID=$!
#taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > power_16.csv
#wait

#OMP_NUM_THREADS=16 numactl --interleave=0,1,2,3  gemm_oblas.x 67000 67000 67000  &
#likwid-bench -t peakflops_avx_fma -W S0:256GB:32:1:1 -i 150
#PID=$!
#taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > power_32.csv
#wait

OMP_NUM_THREADS=16 numactl --interleave=0,1,2,3  gemm_oblas.x 67000 67000 67000  &
likwid-bench -t peakflops_avx_fma -W S0:256GB:48:1:1 -i 150 
PID=$!
taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > power_48.csv
wait

OMP_NUM_THREADS=16 numactl --interleave=0,1,2,3  gemm_oblas.x 67000 67000 67000  &
likwid-bench -t peakflops_avx_fma -W S0:256GB:64:1:1 -i 150 
PID=$!
taskset -c 127,126 efimon-pid-power-analyser --pid ${PID} -s 50  > power_64.csv
wait


