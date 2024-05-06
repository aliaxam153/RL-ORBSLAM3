# ORB-SLAM3-MINOS-Installation-Integration-in-WSL
Installation of ORB-SLAM3 and MINOS simulator with ROS Melodic using Windows Subsystem for Linux (WSL)
## 1. Prerequisites
- Install wsl2 by following this link: [Windows Subsystem for Linux- Version 2](https://learn.microsoft.com/en-us/windows/wsl/install).
- After installing wsl2, install the Ubuntu 20.04 Distro for wsl from the Microsoft Store. 
- Launch the ubuntu 20.04 app, set UNIX username & password. After completing the setup the ubuntu terminal will be ready.

Enter the following command:
```
sudo apt-get update && sudo apt-get upgrade
```

## Installation of ORB-SLAM3:
Following are the instruction to install ORB-SLAM3, I have referenced this [repo](https://github.com/aryaman-patel/orb_slam3_implementation) for the installation in Ubuntu 20.04 along with further changes added by me.
Install all dependencies.
```
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt update
sudo apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
```
> This is only needed, if you have a slow internet connection, otherwise skip it:
```
git config --global http.postBuffer 524288000
```
```
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev libjasper-dev libglew-dev libboost-all-dev libssl-dev libeigen3-dev
```

### Installation of C+11 Compiler:
```
sudo add-apt-repository --yes ppa:ubuntu-toolchain-r/test
sudo apt install gcc-11 g++-11
```
After installing GCC 11, you can set it as the default compiler by using the update-alternatives #command:
```
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 110
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 110
```
Then, you can select GCC 11 as the default compiler:
```
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```
After setting GCC 11 as the default compiler, you can verify the version by running:
```
gcc --version && g++ --version
```
### Install Pangolin
Navigate and create Dev directory: 
```
cd ~
mkdir Dev && cd Dev
```
Download Pangolin from github:
```
git clone https://github.com/stevenlovegrove/Pangolin.git
```
Checkout the git verion 86eb4975fc4fc8b5d92148c2e370045ae9bf9f5d:
```
cd Pangolin
git checkout 86eb4975
```
Install dependencies:
```
sudo apt-get install libgl1-mesa-dev libglew-dev doxygen graphviz
```
Build & Install:
```
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=Release ..
make -j 3 
sudo make install
```
### Install OpenCV 3.2.0
```
cd ~/Dev
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.2.0
```
```
sudo apt install gedit
```
Run this command, to open ```cap_ffmpeg_impl.hpp ```
```
gedit ./modules/videoio/src/cap_ffmpeg_impl.hpp
```
Put the following at the top of header file
```
#define AV_CODEC_FLAG_GLOBAL_HEADER (1 << 22)
#define CODEC_FLAG_GLOBAL_HEADER AV_CODEC_FLAG_GLOBAL_HEADER
#define AVFMT_RAWPICTURE 0x0020
```
and save and close the file

```
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=Release -D WITH_CUDA=OFF -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j 8
sudo make install
```
### Installation of Python dependencies:
Install python2.7, which is needed by ORB-SLAM3
```
sudo apt install python2.7-dev
```
### Installation of ROS Melodic
Follow this link for installation: https://wiki.ros.org/melodic/Installation/Ubuntu
After installing ROS melodic, we need to create a rosbuild workspace, which will be used later for ORB-SLAM3 integration with ROS.
```
rosws init ~/melodic_workspace /opt/ros/melodic
nano ~/.bashrc
```
Add to last line in ~/.bashrc: ```source ~/melodic_workspace/setup.bash```
```
sudo apt-get install python-rosinstall
```
```
mkdir ~/melodic_workspace/sandbox && cd ~/melodic_workspace/sandbox
rosws set ~/melodic_workspace/sandbox
source ~/melodic_workspace/setup.bash
```
To confirm that your package path has been set, echo the ROS_PACKAGE_PATH variable.
```
$ echo $ROS_PACKAGE_PATH
```
You should see something similar to:
```
/home/your_user_name/melodic_workspace/sandbox:/opt/ros/melodic/share
```
Now that your environment is now setup.





