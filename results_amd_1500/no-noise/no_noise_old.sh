module load openBLAS/0.3.23-omp

efimon-power-analyser -s 50 -o power-no_noise-1.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:1:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o power-no_noise-16.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:16:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o power-no_noise-32.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:32:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o power-no_noise-48.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:48:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o power-no_noise-64.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:64:1:1 -i 1500
wait



