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
### Install OpenCV 3.2.0
```
mkdir ~/Packages && cd ~/Packages
git clone --branch 3.2.0 https://github.com/opencv/opencv.git
cd opencv
```

Run this command, to open ```cap_ffmpeg_impl.hpp ```
```
nano ./modules/videoio/src/cap_ffmpeg_impl.hpp
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
### Install Pangolin
Navigate and create Dev directory: 
```
cd ~/Packages
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
make -j 8 
sudo make install
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

## 2. Install ORB-SLAM3
Now, we install ORB-SLAM3. I used the commit version ef9784101fbd28506b52f233315541ef8ba7af57 tag: v0.3-beta
```
cd ~/Packages
git clone https://github.com/UZ-SLAMLab/ORB_SLAM3.git
cd ORB_SLAM3
git checkout ef97841
```
We need to change the header file ```gedit ./include/LoopClosing.h``` at line 51 from
```Eigen::aligned_allocator<std::pair<const KeyFrame*, g2o::Sim3> > > KeyFrameAndPose;```
to
```
Eigen::aligned_allocator<std::pair<KeyFrame *const, g2o::Sim3> > > KeyFrameAndPose;
```
in order to make this comiple. Now, we can comiple ORB-SLAM3 and it dependencies as DBoW2 and g2o.

Now Simply just run (if you encounter compiler, try to run the this shell script 2 or 3 more time. It works for me.)
```
./build.sh
```
### Integrate with  ORB_SLAM3 ROS
Add the path including Examples/ROS/ORB_SLAM3 to the ROS_PACKAGE_PATH environment variable. Open .bashrc file:
```
gedit ~/.bashrc
```
and add at the end the following line. Replace PATH by the folder where you cloned ORB_SLAM3:
```
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:PATH/ORB_SLAM3/Examples/ROS
```
e.g. ```export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/aazam/Packages/ORB_SLAM3/Examples/ROS```
Execute build_ros.sh script:
```
chmod +x build_ros.sh
./build_ros.sh
```






