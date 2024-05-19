#!/bin/bash

# Function to handle Ctrl+C
cleanup() {
    echo "Caught Ctrl+C, terminating all background processes..."
    pkill -P $$
    wait
    echo "All background processes terminated."
    exit 0
}

# Set trap to catch Ctrl+C and call cleanup function
trap cleanup SIGIN

# Clear the contents of two files
cat /dev/null > abc.txt
cat /dev/null > abc2.txt

# Remove all files in the /home/aazam/frames/ directory
rm -f /home/aazam/frames/*

# Clear the terminal
clear

# Print a message indicating that images are being deleted and then remove the images
echo "Deleting Images"
rm -f /home/aazam/frames/*
echo "Deleted Images"

# Start the ROS core
echo "Starting ROSCORE"
roscore &
sleep 2
echo "Started ROSCORE"

# Navigate to the MINOS directory and run a Python script with specific parameters
cd /home/aazam/dev/minos
python3 -m minos.tools.pygame_client --dataset mp3d --scene_ids JeFG25nYj2p --env_config pointgoal_mp3d_s --save_png --width 600 --height 400 --agent_config agent_gridworld -s map --navmap &
cd /home/aazam/ORB_SLAM3

# Wait for 5 seconds
sleep 5

# Set the ROS package path environment variable
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/aazam

# Launch ORB_SLAM3 and the merger node simultaneously
rosrun ORB_SLAM3 Mono ~/dev/ORB_SLAM3/Vocabulary/ORBvoc.txt ~/dev/ORB_SLAM3/Examples/ROS/ORB_SLAM3/Minos.yaml & 
rosrun merger merger &

# Wait for another 5 seconds
sleep 5