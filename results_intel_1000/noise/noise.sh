mkdir -p peak
module load openBLAS/0.3.23-omp
export PATH=/root/niccolo/benchmarks/dgemm/:$PATH

OMP_NUM_THREADS=4 numactl  --cpunodebind 1  gemm_oblas 100000 100000 100000  && OMP_NUM_THREADS=4 numactl --cpunodebind 1  gemm_oblas 100000 100000 100000 &

efimon-power-analyser -s 50 -o peak/power-noise-2.csv -c likwid-bench -t peakflops_avx_fma -W S0:370GB:2:1:1 -i 1500

efimon-power-analyser -s 50 -o peak/power-noise-4.csv -c likwid-bench -t peakflops_avx_fma -W S0:370GB:4:1:1 -i 1500

efimon-power-analyser -s 50 -o peak/power-noise-8.csv -c likwid-bench -t peakflops_avx_fma -W S0:370GB:8:1:1 -i 1500

efimon-power-analyser -s 50 -o peak/power-noise-12.csv -c likwid-bench -t peakflops_avx_fma -W S0:370GB:12:1:1 -i 1500


mkdir -p daxpy

efimon-power-analyser -s 50 -o daxpy/power-noise-2.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:370GB:2:1:1 -i 1500

efimon-power-analyser -s 50 -o daxpy/power-noise-4.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:370GB:4:1:1 -i 1500

efimon-power-analyser -s 50 -o daxpy/power-noise-8.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:370GB:8:1:1 -i 1500

efimon-power-analyser -s 50 -o daxpy/power-noise-12.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:370GB:12:1:1 -i 1500


mkdir -p stream

efimon-power-analyser -s 50 -o stream/power-noise-2.csv -c likwid-bench -t stream_mem_avx_fma -W S0:370GB:2:1:1 -i 1500

efimon-power-analyser -s 50 -o stream/power-noise-4.csv -c likwid-bench -t stream_mem_avx_fma -W S0:370GB:4:1:1 -i 1500

efimon-power-analyser -s 50 -o stream/power-noise-8.csv -c likwid-bench -t stream_mem_avx_fma -W S0:370GB:8:1:1 -i 1500

efimon-power-analyser -s 50 -o stream/power-noise-12.csv -c likwid-bench -t stream_mem_avx_fma -W S0:370GB:12:1:1 -i 1500
