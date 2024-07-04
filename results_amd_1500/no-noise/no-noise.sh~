mkdir -p peak

efimon-power-analyser -s 50 -o peak/power-no_noise-8.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:8:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o peak/power-no_noise-16.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:16:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o peak/power-no_noise-32.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:32:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o peak/power-no_noise-48.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:48:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o peak/power-no_noise-64.csv -c likwid-bench -t peakflops_avx_fma -W S0:170GB:64:1:1 -i 1500
wait


mkdir -p daxpy

efimon-power-analyser -s 50 -o daxpy/power-no_noise-8.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:170GB:8:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o daxpy/power-no_noise-16.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:170GB:16:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o daxpy/power-no_noise-32.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:170GB:32:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o daxpy/power-no_noise-48.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:170GB:48:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o daxpy/power-no_noise-64.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:170GB:64:1:1 -i 1500
wait


mkdir -p stream

efimon-power-analyser -s 50 -o stream/power-no_noise-8.csv -c likwid-bench -t stream_mem_avx_fma -W S0:170GB:8:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o stream/power-no_noise-16.csv -c likwid-bench -t stream_mem_avx_fma -W S0:170GB:16:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o stream/power-no_noise-32.csv -c likwid-bench -t stream_mem_avx_fma -W S0:170GB:32:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o stream/power-no_noise-48.csv -c likwid-bench -t stream_mem_avx_fma -W S0:170GB:48:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o stream/power-no_noise-64.csv -c likwid-bench -t stream_mem_avx_fma -W S0:170GB:64:1:1 -i 1500
wait
