import sys, subprocess as sp, psutil, shlex
def execute(cmd):
    args = shlex.split(cmd)
    # with psutil.Popen(args, shell=True, stdin=sp.PIPE, stdout=sp.PIPE, stderr=sp.STDOUT, close_fds=True) as process:
    with psutil.Popen(args, stdin=sp.PIPE, stdout=sp.PIPE, stderr=sp.STDOUT) as process:
        process.wait()
        output = process.stdout.read()
        errcode = process.returncode
    if sys.version_info >= (3,0):
        output = output.decode()
    if errcode:
        raise RuntimeError("{} failed:\nOutput:\n{}".format(cmd, output))
    return
