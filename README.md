
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

### Warning:
The Repo is being modified at this moment, so you will see inconsistency in sections with this mark ⚠️!!!

# Incorporation of Reinforcement Learning Algorithm on ORB_SLAM3 for Enhanced Goal-Directed Navigation in Complex Indoor Environment.
The purpose of this project is to address tracking loss in ORB_SLAM3 caused by sudden shifts in the input camera feed. To tackle this issue, we employ a reinforcement learning (RL) algorithm that uses features from ORB_SLAM3 and image frames from the camera to determine the best course of action, minimizing the possibility of track loss. 

To achieve this, we have integrated an RL algorithm with ORB_SLAM3 to enhance goal-directed navigation in complex indoor environments. This process involves several key steps:

 1. **Ensure Effective Interaction**: Ensure that the RL algorithm can effectively interact with the ORB_SLAM3 algorithm.
 2. **Utilize MINOS Simulator**: Use the MINOS simulator to provide realistic indoor data for training and testing the RL model.

## Pre-requisites:
Before using the DQNorb.py script to apply reinforcement learning (RL) decision-based actions on ORB_SLAM3, you need to install ORB-SLAM3 and the MINOS simulator with ROS Noetic on either WSL-Ubuntu or Ubuntu. 
> #### Note: This setup has been tested on the Ubuntu 20.04 distribution.

> #### a) Installation Guide for ORB-SLAM3:
> For installation procedure & ROS setup of ORB-SLAM3 refer to this link:
>
> https://github.com/aliaxam153/ORBSLAM3-WSL.git

> #### b) Installation Guide for MINOS:
> For installation procedure, refer to this link:
>
> https://github.com/aliaxam153/MINOS-Simulator.git

> #### c) Clone the Git repository:
> ```bash
> cd ~/dev
> git clone https://github.com/aliaxam153/RL-ORBSLAM3.git
> ```

## Integration of MINOS with ORB-SLAM3

At this stage, it is assumed that ORB_SLAM3 and MINOS are installed and operational. Follow this link for integration: 

https://github.com/aliaxam153/RL-ORBSLAM3/blob/main/Integrate_MINOS_ORBSLAM3.md


## ⚠️ DQNorb.py Integration with ORB-SLAM3 (Being Modified)

In the folder  ```/Data/DQNorb```, the file DQNorb.py is the executeable that links with the ORB-SLAM3 ROS publisher and subscriber. The ```agent.pt``` is the pre-trained DQN model, which is trained on
MINOS simulator. Following rqt_graph shows the ROS network:

![rosgraph1](https://github.com/aliaxam153/ORB-SLAM3-MINOS-on-Ubuntu-20.04-WSL/assets/146977640/19d1d1d1-b29e-40b1-9d7c-30ea1a16eef9)

To run the DQN model, first run the bash file that starts MINOS & ORB-SLAM3. Then open a new terminal in ubuntu run the following commands:
```
cd ~/dev/Data/
python3 DQNorb.py --mode dqn_test
```



