from __future__ import print_function
import os, sys, subprocess as sp, psutil, shlex
def execute(cmd, env=None, print_output=True):
    extra = env or dict()
    env = os.environ; env.update(extra)
    args = shlex.split(cmd)
    # with psutil.Popen(args, shell=True, stdin=sp.PIPE, stdout=sp.PIPE, stderr=sp.STDOUT, close_fds=True) as process:
    with psutil.Popen(args, stdin=sp.PIPE, stdout=sp.PIPE, stderr=sp.STDOUT, env=env) as process:
        output = ''
        while True:
            line = process.stdout.readline()
            if sys.version_info >= (3,0):
                line = line.decode()
            output+=line
            if line == '' and process.poll() is not None:
                break
            if line and print_output:
                print(line.strip())
        errcode = process.poll()
    if errcode:
        raise RuntimeError("{} failed:\nOutput:\n{}".format(cmd, output))
    return
