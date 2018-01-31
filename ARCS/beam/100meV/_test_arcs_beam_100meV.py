import os
here = os.path.dirname(__file__)
os.chdir(here)

def test():
    if os.system("bash sim.sh"):
        raise RuntimeError("Failed")
    return
