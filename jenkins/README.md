# scripts to run at jenkins slaves to build this repo

Modify and run `install.sh` to install necessary software in "jenkins" or "ec2-user" account.
This should only need to be done once.

Then in a Jenkins build project configuration, the "Build" panel, the "Execute shell" sub-panel
the "Command" is:

./jenkins/getbeam.sh
./jenkins/run-tests.sh

The build uses jenkins env vars:
* JOB_NAME
* BUILD_NUMBER
