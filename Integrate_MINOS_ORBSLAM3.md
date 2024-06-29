## Integration of MINOS with ORB-SLAM3

At this stage, it is assumed that ORB_SLAM3 and MINOS are installed and operational. Below is a flow diagram detailing their integration:

![board-whimsical-farceur (1)](https://github.com/aliaxam153/RL-ORBSLAM3/assets/146977640/c39ae34e-c5f3-4cfd-b58c-e3da0fce1a26)

Follow the steps shown below to achieve this:

### Step 1) Frame Storage
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
### Step 2) Publish Frames:

merger.cpp ROS package reads frames from "Frames" folder.
Publishes frames to "/camera/image_raw/image_topics" ROS topic.
Step 3: Subscribe Frames:

ORB-SLAM3 ROS node subscribes to "/camera/image_raw" topic.
Receives continuous stream of image data from MINOS simulator.
End:

ORB-SLAM3 processes the received frames for SLAM (Simultaneous Localization and Mapping) tasks.


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
