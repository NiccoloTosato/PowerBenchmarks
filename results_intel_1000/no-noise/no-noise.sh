mkdir -p peak

efimon-power-analyser -s 50 -o peak/power-no_noise-2.csv -c likwid-bench -t peakflops_avx_fma -W S0:370GB:2:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o peak/power-no_noise-4.csv -c likwid-bench -t peakflops_avx_fma -W S0:370GB:4:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o peak/power-no_noise-8.csv -c likwid-bench -t peakflops_avx_fma -W S0:370GB:8:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o peak/power-no_noise-12.csv -c likwid-bench -t peakflops_avx_fma -W S0:370GB:12:1:1 -i 1500
wait



mkdir -p daxpy

efimon-power-analyser -s 50 -o daxpy/power-no_noise-2.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:370GB:2:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o daxpy/power-no_noise-4.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:370GB:4:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o daxpy/power-no_noise-8.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:370GB:8:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o daxpy/power-no_noise-12.csv -c likwid-bench -t daxpy_mem_avx_fma -W S0:370GB:12:1:1 -i 1500
wait



mkdir -p stream

efimon-power-analyser -s 50 -o stream/power-no_noise-2.csv -c likwid-bench -t stream_mem_avx_fma -W S0:370GB:2:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o stream/power-no_noise-4.csv -c likwid-bench -t stream_mem_avx_fma -W S0:370GB:4:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o stream/power-no_noise-8.csv -c likwid-bench -t stream_mem_avx_fma -W S0:370GB:8:1:1 -i 1500
wait
efimon-power-analyser -s 50 -o stream/power-no_noise-12.csv -c likwid-bench -t stream_mem_avx_fma -W S0:370GB:12:1:1 -i 1500
wait
