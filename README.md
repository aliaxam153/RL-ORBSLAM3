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

## Installation of ORB-SLAM3:
Following are the instruction to install ORB-SLAM3, I have referenced this [repo](https://github.com/aryaman-patel/orb_slam3_implementation) for the installation in Ubuntu 20.04 along with further changes added by me.

> For installation procedure & ROS setup of ORB-SLAM3 refer to this link: 
[ORB_SLAM.md](https://github.com/aliaxam153/ORB-SLAM3-MINOS-Installation-Integration-in-WSL/blob/main/ORB_SLAM3.md)

## Installation of MINOS:
> For installation procedure, refer to this link: 
[MINOS.md](https://github.com/aliaxam153/ORB-SLAM3-MINOS-Installation-Integration-in-WSL/blob/main/MINOS.md)
