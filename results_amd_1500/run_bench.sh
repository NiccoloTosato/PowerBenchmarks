#!/usr/bin/bash

profile_likwid () {
    echo "--------Start $1 benchmark---------"
    echo "----------Profiling $1-----------"
    if [ $2 -eq 128 ]
    then
	# If it is, decrease it by 2
	decreased=$(($2 - 2))
    else
	decreased=$2
    fi
    command="likwid-bench -t $1 -W N:$((3 * $2))GB:$decreased:$(($2 / 32)):4 -i 1000"
    echo $command
    efimon-power-analyser -c $command -s 50  -o power-$1-$2.csv
    echo "---------End profiling $1----------"
    wait
}

profile_logic () {
    echo "--------Start logic benchmark---------"
    echo "----------Profiling logic-----------"
    export OMP_PLACES="{0:$(($1 / 32))}:32:4"
    if [ $1 -eq 128 ]
    then
	# If it is, decrease it by 2
	export OMP_NUM_THREADS=$(($1 - 2))
    else
	export OMP_NUM_THREADS=$1
	fi
    command="/root/niccolo/benchmarks/logic/sse_mathfun_extension/logic.x 99999999999999" 
    echo $command
    efimon-power-analyser -c $command -s 50  -o power-logic-$1.csv
    echo "---------End profiling $1----------"
    wait
}
profile_branch () {
    echo "--------Start logic benchmark---------"
    echo "----------Profiling branch-----------"
    export OMP_PLACES="{0:$(($1 / 32))}:32:4"
    if [ $1 -eq 128 ]
    then
	# If it is, decrease it by 2
	export OMP_NUM_THREADS=$(($1 - 2))
    else
	export OMP_NUM_THREADS=$1
	fi
    command="/root/niccolo/benchmarks/branch_and_jump/branch.x 99999999999999" 
    echo $command
    efimon-power-analyser -c $command -s 50  -o power-branch-$1.csv
    echo "---------End profiling $1----------"
    wait
}

profile_jump () {
    echo "--------Start logic benchmark---------"
    echo "----------Profiling jump-----------"
    export OMP_PLACES="{0:$(($1 / 32))}:32:4"
    if [ $1 -eq 128 ]
    then
	# If it is, decrease it by 2
	export OMP_NUM_THREADS=$(($1 - 2))
    else
	export OMP_NUM_THREADS=$1
	fi
    command="/root/niccolo/benchmarks/branch_and_jump/jump.x 99999999999999" 
    echo $command
    efimon-power-analyser -c $command -s 50  -o power-jump-$1.csv
    echo "---------End profiling $1----------"
    wait
}

profile_dgemm() {

    export LD_LIBRARY_PATH=/root/niccolo/benchmarks/dgemm/lib
    export PATH=/root/niccolo/benchmarks/dgemm/:$PATH
    export OMP_PLACES="{0:$(($1 / 32))}:32:4"
   if [ $1 -eq 128 ]
    then
	# If it is, decrease it by 2
	export OMP_NUM_THREADS=$(($1 - 2))
    else
	export OMP_NUM_THREADS=$1
   fi
   export OPENBLAS_NUM_THREADS=$OMP_NUM_THREADS
   echo $command
efimon-power-analyser -s 50 -o power-dgemm-$1.csv -c gemm_oblas 100000 100000 100000
wait

}

profile_idle() {
  sleep 200 &
  PID=$!
  taskset -c 126-127 efimon-power-analyser -p ${PID} -s 50 -f 10 -o power-sleep-$1.csv
wait
}

# Define an array of benchmarks
cores=("32" "1" "64" "96" "128")
benchmarks=("copy" "copy_mem" "copy_mem_avx" "daxpy_mem_avx_fma" "stream_mem_avx_fma" "update_avx" "load_mem" "load_avx" "store_mem" "store_mem_avx" "peakflops_avx_fma")

# Loop over the array and call the function with each benchmark
#for core in "${cores[@]}"; do
#    for benchmark in "${benchmarks[@]}"; do
#	date
#	time profile_likwid "$benchmark" "$core"
#    done
#done

# Loop over the array and call the function with each benchmark

for core in "${cores[@]}"; do
#    date
#    time profile_jump "$core"
#    date
#    time profile_branch "$core"
#    date
#    time profile_logic "$core"
#    date
#    time profile_dgemm "$core"
    date
     time profile_idle "$core"
done

