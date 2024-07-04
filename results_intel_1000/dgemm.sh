#!/usr/bin/bash
#cores=("1" "2" "4" "8" "12" "16" "20" "24")

export PATH=/root/niccolo/benchmarks/dgemm/:$PATH
module load openBLAS/0.3.23-omp
export OMP_PLACES=cores
export OMP_PROC_BIND=spread

export OMP_NUM_THREADS=1
efimon-power-analyser -s 50 -o power-dgemm-1.csv -c gemm_oblas 100000 100000 100000

export OMP_NUM_THREADS=2
efimon-power-analyser -s 50 -o power-dgemm-2.csv -c gemm_oblas 100000 100000 100000

export OMP_NUM_THREADS=4
efimon-power-analyser -s 50 -o power-dgemm-4.csv -c gemm_oblas 100000 100000 100000

export OMP_NUM_THREADS=8
efimon-power-analyser -s 50 -o power-dgemm-8.csv -c gemm_oblas 100000 100000 100000

export OMP_NUM_THREADS=12
efimon-power-analyser -s 50 -o power-dgemm-12.csv -c gemm_oblas 100000 100000 100000

export OMP_NUM_THREADS=16
efimon-power-analyser -s 50 -o power-dgemm-16.csv -c gemm_oblas 100000 100000 100000

export OMP_NUM_THREADS=20
efimon-power-analyser -s 50 -o power-dgemm-20.csv -c gemm_oblas 100000 100000 100000

export OMP_NUM_THREADS=24
efimon-power-analyser -s 50 -o power-dgemm-24.csv -c gemm_oblas 100000 100000 100000

