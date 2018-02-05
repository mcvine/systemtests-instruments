# Single crystal spin wave sim for SEQ experiments

* test_singlecrystal_SpinWave.py: runs sim.sh. discovered by py.test
* sim.sh: run the test workflow: simulate/reduce/validate.
  - sim configurations:
    * sample.yml: sample
    * swdemo-scatterer.xml: scattering kernel customization
    * sim.yml: number of nodes, ncount, etc
  - sim script:
    * create-run_scatter_angles_sh.py: script to create run_scatter_angles.sh which runs simulations of all psi angles
* reduction:
  - slice_H00.yml: slicing configuration
* validation
  - validate.py: script to validate
  - expected-slice_H00.h5: expected result for slice
