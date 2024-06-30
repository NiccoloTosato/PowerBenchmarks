module load openBLAS/0.3.23-omp
export PATH=/root/niccolo/benchmarks/dgemm/:$PATH

OMP_NUM_THREADS=16 numactl --physcpubind=64-127  gemm_oblas 100000 100000 100000  &

efimon-power-analyser -s 50 -o power-noise-1.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:1:1:1 -i 1500

efimon-power-analyser -s 50 -o power-noise-16.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:16:1:1 -i 1500

efimon-power-analyser -s 50 -o power-noise-32.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:32:1:1 -i 1500

efimon-power-analyser -s 50 -o power-noise-48.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:48:1:1 -i 1500

efimon-power-analyser -s 50 -o power-noise-64.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:64:1:1 -i 1500





