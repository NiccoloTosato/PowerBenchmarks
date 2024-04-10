import subprocess
import shlex

def parse_command(cmd_string):
    cmd_list = shlex.split(cmd_string)
    cmd_name = cmd_list[0]
    cmd_args = cmd_list[1:]
    return cmd_name, cmd_args

def launch_bench(cmd):
    cmd_name,cmd_args=parse_command(cmd)
    process = subprocess.Popen([cmd_name,*cmd_args],  stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return process

def launch_profiler(bench):
    cmd=f"efimon-pid-power-analyser --pid {bench.pid} -s 4"
    cmd_name,cmd_args=parse_command(cmd)
    return  subprocess.Popen([cmd_name,*cmd_args],  stdout=subprocess.PIPE, stderr=subprocess.PIPE)

def wrap(cmd):
    bench_process=launch_bench(cmd)
    profiler_process=launch_profiler(bench_process)
    print("Lanciato")
    profiler_process.wait()
    print("Wait")
#    bench_process.kill()
    print("kill")
    return profiler_process,bench_process

cmd = "likwid-bench -t stream_mem_avx_fma  -W C1:32GB:1:1:1 "
profiler_process,bench_process = wrap(cmd)

print(profiler_process.stdout.read())
print(profiler_process)
print(bench_process.stderr.read())
print(profiler_process.communicate())



