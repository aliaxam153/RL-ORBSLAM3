![image](https://github.com/aliaxam153/ORB-SLAM3-on-Ubuntu-20.04-WSL/assets/146977640/36985e28-ca95-4dbd-9fdd-ffb67b606691)

# ORB-SLAM3 & MINOS Installation, Integration with ROS Noetic on WSL 
Installation of ORB-SLAM3 and MINOS simulator with ROS Noetic using Windows Subsystem for Linux (WSL). This has been tested for Ubuntu 20.04 Distro.
## Install and setup WSL2 in Windows Machine:
Here are the steps to install a specific Ubuntu distribution on WSL2 from the Microsoft Store:
- **Enable WSL2:** Before you install any Linux distribution, make sure you have WSL2 enabled on your Windows machine. You can do this by following the instructions in the official Microsoft documentation ([WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)).
- **Open Microsoft Store:** Go to the Microsoft Store on your Windows machine.
- **Search for Ubuntu:** In the search bar at the top right corner of the Microsoft Store, type "Ubuntu" and press Enter.
- **Select Ubuntu Distro:** You will see various versions of Ubuntu available. Choose the specific version you want to install. For example, if you want Ubuntu 20.04 LTS, select that version.
- **Install:** Click on the Ubuntu distribution you've selected, then click on the "Get" or "Install" button to begin the installation process.
- **Launch Ubuntu:** Once the installation is complete, you can launch the Ubuntu distribution from the Start menu or by typing "Ubuntu" in the Windows search bar and selecting it from the results.
- **Set up Ubuntu:** The first time you launch the Ubuntu distribution, it will take a few moments to set up. Follow the on-screen instructions to set up your username and password.
- **Update Packages (Recommended):** It's a good practice to update the package lists and upgrade installed packages using the following commands:
  ```
  sudo apt-get update && sudo apt-get upgrade
  ```
  After completion of ubuntu update, reboot it.
  ```
  sudo reboot
  ```
Tool for editing scripts:
```
sudo apt install gedit

```
> We require C++11 compiler to build some dependencies. So, refer to this link to install the compiler: 
[C++11_Compiler.md](https://github.com/aliaxam153/ORB-SLAM3-MINOS-Installation-Integration-in-WSL/blob/main/C++11_Compiler.md)
> 
## Installation of ORB-SLAM3:
Following are the instruction to install ORB-SLAM3, I have referenced this [repo](https://github.com/aryaman-patel/orb_slam3_implementation) for the installation in Ubuntu 20.04 along with further changes added by me.

> For installation procedure & ROS setup of ORB-SLAM3 refer to this link: 
[ORB_SLAM.md](https://github.com/aliaxam153/ORB-SLAM3-MINOS-Installation-Integration-in-WSL/blob/main/ORB_SLAM3.md)

## Installation of MINOS:
> For installation procedure, refer to this link: 
[MINOS.md](https://github.com/aliaxam153/ORB-SLAM3-MINOS-Installation-Integration-in-WSL/blob/main/MINOS.md)

## Integration of MINOS with ORB-SLAM3
### Changes in MINOS Code:
```
cd ~/dev/minos/minos/lib
gedit Simulator.py
```
Once the script is opened, do the following changes:
Replace 98-102 with this:
```
if 'logdir' in params:
            self._logdir = '/home/user_name/frames' 
        else:
            self._logdir = '/home/user_name/frames'
```
> Replace user_name with your PC name.

& replace line 422-428 with:

```
if self.params.get(‘save_png’):
if image is None:
image = Image.frombytes(mode,(data.shape[0], data.shape[1]),data)
time.sleep(0.06)
rgb_img = image.convert('RGB')
rgb_img.save("/home/user_name/frames/color_.jpg")
```
and save the changes.

### Create ROS Package that Publishes the MINOS Image Frame to a ROS Topic:
```
cd ~/catkin_ws/src
catkin_create_pkg merger std_msgs rospy roscpp std_msgs image_transport cv_bridge
```
Paste the merger.cpp file in the ```/Data``` inside the repo to ```~/catkin_ws/src/merger```
Open the merger folder and make some edits.
```
cd ~/catkin_ws/src/merger
gedit merger.cpp
```
Replace the user_name with your PC name in line 18. And save the file.
```
ss<<"/home/user_name/frames/color_.jpg";
```
Edit the CMakeList.txt in the merger folder ```gedit CMakeList.txt``` and replace it with this: 
```
cmake_minimum_required(VERSION 3.0.2)
project(merger)

## Compile as C++11, supported in ROS Noetic
add_compile_options(-std=c++11)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  cv_bridge
  image_transport
  roscpp
  rospy
  std_msgs
)

find_package(OpenCV REQUIRED)

catkin_package()

## System dependencies are found with CMake's conventions
include_directories(
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
)

## Declare a C++ executable
add_executable(merger merger.cpp)


## Specify libraries to link a library or executable target against
target_link_libraries(merger
  ${catkin_LIBRARIES}
  ${OpenCV_LIBRARIES}  # Add this line if not already present
)
```
After making these changes, run ```cd ~/catkin_ws/``` and then ```catkin_make```.


![image](https://github.com/aliaxam153/ORB-SLAM3-on-Ubuntu-20.04-WSL/assets/146977640/3c7529a6-cc14-46bb-a538-d305e5365578)

This will make the ROS publisher script and it will publish the ```color_.jpg``` onto a ROS topic. The ORB-SLAM3 will link to this topic.

> Camera Parameters for MINOS Environment:
> The camera caliberation file in already added in the repo by the name ```Minos.yaml``` in ```/ORB_SLAM3/Examples/ROS/ORB_SLAM3/```.

### Test Run:
Create bash file to run all commands simultaneously (make adjustments accordingly):

```
#!/bin/bash
cat /dev/null > abc.txt
cat /dev/null > abc2.txt
rm -ff /home/user_name/frames/*
clear
echo "Deleting Images"
rm -ff /home/user_name/frames/*
echo "deleted Images"

echo "Starting ROSCORE"
roscore &
sleep 2
echo "Started ROSCORE"

#Following command runs MINOS
cd /home/user_name/dev/minos
python3 -m minos.tools.pygame_client --dataset mp3d --scene_ids JeFG25nYj2p --env_config pointgoal_mp3d_s --save_png --width 600 --height 400 --agent_config agent_gridworld -s map --navmap &
cd /home/user_name/ORB_SLAM3

#Following command runs ORB_SLAM after a 10 second delay
sleep 5
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/user_name
#LAUNCH ORBSLAM3
rosrun ORB_SLAM3 Mono ~/dev/ORB_SLAM3/Vocabulary/ORBvoc.txt ~/dev/ORB_SLAM3/Examples/ROS/ORB_SLAM3/Minos.yaml
sleep 5

#Following command runs the integration algorithm after a 10 second delay
cd /home/user_name/catkin_ws
source devel/setup.bash
rosrun merger merger
```



