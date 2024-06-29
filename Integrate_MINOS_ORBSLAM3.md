![image](https://github.com/aliaxam153/ORB-SLAM3-on-Ubuntu-20.04-WSL/assets/146977640/36985e28-ca95-4dbd-9fdd-ffb67b606691)

# Integration of MINOS with ORB-SLAM3

At this stage, it is assumed that ORB_SLAM3 and MINOS are installed and operational. Below is a flow diagram detailing their integration:

![board-whimsical-farceur (1)](https://github.com/aliaxam153/RL-ORBSLAM3/assets/146977640/c39ae34e-c5f3-4cfd-b58c-e3da0fce1a26)

Follow the steps shown below to achieve this:

## Step 1) Export frames from MINOS Simulator:
The MINOS simulator generates realistic indoor frames. These image frames are saved to the "frames" folder in the "/home/username/" directory by modifying the `Simulator.py` script.

>**Note:**
>
>Replace `user_name` in  ``` self._logdir = '/home/user_name/frames' ``` and  ```rgb_img.save("/home/user_name/frames/color_.jpg") ``` with your username, e.g.'/home/aazam/frames'.
>
>Be sure to do this; otherwise, the MINOS Simulator will start giving errors when you run it.

**a) Navigate to the MINOS directory and open the `Simulator.py` script:**
> ```bash
> mkdir -p ~/frames
> cd ~/dev/minos/minos/lib
> gedit Simulator.py
> ```

**b) Once the `Simulator.py` script is opened, make the following changes:**

> **i) Go to lines 98-102 in the script and make these changes:**
> ```python
> if 'logdir' in params:
>     self._logdir = '/home/user_name/frames' 
> else:
>     self._logdir = '/home/user_name/frames'
> ```
> 
> **ii) Also, visit lines 422-428 in the script and replace them with these lines:**
> ```python
> if self.params.get('save_png'):
>     if image is None:
>         image = Image.frombytes(mode, (data.shape[0], data.shape[1]), data)
>     time.sleep(0.06)
>     rgb_img = image.convert('RGB')
>     rgb_img.save("/home/user_name/frames/color_.jpg")
> ```
and save these changes.
## Step 2) Publish Frames:

The ROS package "merger.cpp" reads frames from "Frames" folder and publishes them to "/camera/image_raw/image_topics" ROS topic.

> #### a) Create Catkin ROS Package:
> First change to the source space directory of the catkin workspace you created in the Creating a Workspace for catkin tutorial:
> ```bash
> cd ~/catkin_ws/src
> ```
> Now use the catkin_create_pkg script to create a new package called ```merger```, which depends on std_msgs, rospy, roscpp, std_msgs, image_transport and cv_bridge:
> ```cpp
> catkin_create_pkg merger std_msgs rospy roscpp std_msgs image_transport cv_bridge
> ```
> This will create a ```merger``` folder which contains a package.xml and a CMakeLists.txt, which have been partially filled out with the information you gave catkin_create_pkg.

> #### b) Modify the Catkin ROS Package:
> Paste the merger.cpp file in the ```~/dev/RL-ORBSLAM3/``` in the repo to ```~/catkin_ws/src/merger```
> ```bash
>cp ~/dev/RL-ORBSLAM3/merger.cpp ~/catkin_ws/src/merger/
>```
> Open the merger folder and make some edits to the ```merger.cpp``` script.
> ```bash
> cd ~/catkin_ws/src/merger
> gedit merger.cpp
> ```
> At line 16 of the script, replace the ```PC_name``` with your ```user_name```.
> ```cpp
> std::string image_name = "/home/PC_name/frames/color_.jpg";
> ```
> and then save the file.
> 
> Open and edit the CMakeList.txt in the merger folder
> ```
> gedit CMakeList.txt
> ```
> and replace the whole script with these lines: 
> ```cpp
> cmake_minimum_required(VERSION 3.0.2)
> project(merger)
> 
> ## Compile as C++11, supported in ROS Noetic
> add_compile_options(-std=c++11)
> 
> ## Find catkin macros and libraries
> find_package(catkin REQUIRED COMPONENTS
>   cv_bridge
>   image_transport
>   roscpp
>   rospy
>   std_msgs
> )
> 
> find_package(OpenCV REQUIRED)
> 
> catkin_package()
> ## System dependencies are found with CMake's conventions
> include_directories(
>   ${catkin_INCLUDE_DIRS}
>   ${OpenCV_INCLUDE_DIRS}
> )
> ## Declare a C++ executable
> add_executable(merger merger.cpp)
>
> ## Specify libraries to link a library or executable target against
> target_link_libraries(merger
>   ${catkin_LIBRARIES}
>   ${OpenCV_LIBRARIES}  # Add this line if not already present
> )
> ```
> and then save the file.

> #### c) Compile the Catkin ROS Package:
> After making the changesabove, navigate to catkin workspace:
> ```
> cd ~/catkin_ws/
> ```
> and then compile the package:
> ```
> catkin_make
> ```
This will make the ROS publisher script and it will publish the ```color_.jpg``` in the 'frames' folder onto a ROS topic.

## Step 3) Subscribe Frames:

ORB-SLAM3 ROS node subscribes to "/camera/image_raw" topic and receives continuous stream of image frames from MINOS simulator via publisher.
> **Note:** The ORB-SLAM3 repo is already modified with subscriber, so you need to run ORB_SLAM3.
> Camera Parameters for MINOS Environment:
> The camera caliberation file is already added in the ORB_SLAM3 repo by the name ```Minos.yaml``` in ```/ORB_SLAM3/Examples/ROS/ORB_SLAM3/```.

### Test Run:
![image](https://github.com/aliaxam153/ORB-SLAM3-on-Ubuntu-20.04-WSL/assets/146977640/3c7529a6-cc14-46bb-a538-d305e5365578)
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
