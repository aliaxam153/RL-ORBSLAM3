![image](https://github.com/aliaxam153/ORB-SLAM3-on-Ubuntu-20.04-WSL/assets/146977640/36985e28-ca95-4dbd-9fdd-ffb67b606691)

# ORB-SLAM3 & MINOS Installation, Integration with ROS Noetic on WSL 
> ### Disclaimer:
>
> The code and materials provided in this repository are not owned by me. They are sourced from various external contributors, publicly available resources, or other repositories. All credit for the original
> work goes to the respective authors and contributors. I do not claim any ownership or rights over the code and materials within this repository.
> If you are the rightful owner of any content and wish to have it removed or properly attributed, please contact me, and I will address your concerns promptly.

> ### Original Sources:
> 
> MINOS: https://github.com/minosworld/minos/
>
> ORB-SLAM3: https://github.com/UZ-SLAMLab/ORB_SLAM3/
>
> DQNorb: https://github.com/knaveed20/Deep-Introspective-SLAM/


## 1) Pre-requisites Repositories:
Before using the DQNorb.py script to apply reinforcement learning (RL) decision-based actions on ORB_SLAM3, which is fed with realistic indoor image frames by the MINOS simulator, you need to install ORB-SLAM3 and the MINOS simulator with ROS Noetic on Windows Subsystem for Linux (WSL). 
> #### Note: This setup has been tested on the Ubuntu 20.04 distribution.

> ### Installation Guide for ORB-SLAM3:
> For installation procedure & ROS setup of ORB-SLAM3 refer to this link: https://github.com/aliaxam153/ORBSLAM3-WSL.git

> ### Installation Guide for MINOS:
> For installation procedure, refer to this link:
> https://github.com/aliaxam153/MINOS-Simulator.git

## 2) Integration of MINOS with ORB-SLAM3
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
rosrun ORB_SLAM3 Mono ~/dev/ORB_SLAM3/Vocabulary/ORBvoc.txt ~/dev/ORB_SLAM3/Examples/ROS/ORB_SLAM3/Minos.yaml &
sleep 5
rosrun merger merger
```
## DQNorb.py Integration with ORB-SLAM3

In the folder  ```/Data/DQNorb```, the file DQNorb.py is the executeable that links with the ORB-SLAM3 ROS publisher and subscriber. The ```agent.pt``` is the pre-trained DQN model, which is trained on
MINOS simulator. Following rqt_graph shows the ROS network:

![rosgraph1](https://github.com/aliaxam153/ORB-SLAM3-MINOS-on-Ubuntu-20.04-WSL/assets/146977640/19d1d1d1-b29e-40b1-9d7c-30ea1a16eef9)

To run the DQN model, first run the bash file that starts MINOS & ORB-SLAM3. Then open a new terminal in ubuntu run the following commands:
```
cd ~/dev/Data/
python3 DQNorb.py --mode dqn_test
```



