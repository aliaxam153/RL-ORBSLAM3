# ORB-SLAM3-MINOS-Installation-Integration-in-WSL
Installation of ORB-SLAM3 and MINOS simulator with ROS Melodic using Windows Subsystem for Linux (WSL)
## 1. Prerequisites
```
sudo apt-get update && sudo apt-get upgrade
```
### Installation of Git:
```
sudo apt install git
```
> This is only needed, if you have a slow internet connection, otherwise skip it:
```
git config --global http.postBuffer 524288000
```
### Installation of C+11 Compiler:
```
sudo add-apt-repository --yes ppa:ubuntu-toolchain-r/test
```
```
sudo apt install gcc-11 g++-11
```
> After installing GCC 11, you can set it as the default compiler by using the update-alternatives #command:
```
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 110
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 110
```
> Then, you can select GCC 11 as the default compiler:
```
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```
> After setting GCC 11 as the default compiler, you can verify the version by running:
```
gcc --version && g++ --version
```
### Installation of Python dependencies:
Run command to get access to pip3:
```
sudo apt install python3-pip
```
```
pip3 install --upgrade pip
```
Install python2.7, which is needed by ORB-SLAM3
```
sudo apt install python2.7-dev
```
### Installation CMAKE:
```
sudo apt-get install cmake
```
```
pip3 install setuptools_scm scikit-build cmake
```
Run these lines to add to environment path: ```export PATH="$PATH:/home/aazam/.local/bin"``` & ```source ~/.bashrc```


## Installation of ROS Melodic
Follow this link for installation: https://wiki.ros.org/melodic/Installation/Ubuntu

After installing ROS melodic, we need to create a rosbuild workspace, which will be used later for ORB-SLAM3 integration with ROS.

rosws init ~/melodic_workspace /opt/ros/melodic
nano ~/.bashrc

Add to last line in ~/.bashrc
source ~/melodic_workspace/setup.bash

sudo apt-get install python-rosinstall

mkdir ~/melodic_workspace/sandbox
cd ~/melodic_workspace/sandbox
rosws set ~/melodic_workspace/sandbox
source ~/melodic_workspace/setup.bash

To confirm that your package path has been set, echo the ROS_PACKAGE_PATH variable.

$ echo $ROS_PACKAGE_PATH
You should see something similar to:

/home/your_user_name/fuerte_workspace/sandbox:/opt/ros/fuerte/share:/opt/ros/fuerte/stacks
Now that your environment is setup, continue with the ROS file system tutorial.







