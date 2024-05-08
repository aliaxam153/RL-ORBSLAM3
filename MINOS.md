## Installation & Setup of Multi-model Indoor Simulator (MINOS)
This has been tested on Ubuntu 20.04 only.
```
 sudo apt-get update && sudo apt-get upgrade
```
## Installation Python Version & Dependencies:
```
sudo apt install python3-pip
sudo apt install python2.7-dev
```
```
sudo apt-get install python3-tk && sudo apt-get install build-essential libxi-dev libglu1-mesa-dev libglew-dev libopencv-dev libboost-all-dev libglib2.0-dev libsdl2-dev
```
We need to install libvips separately, since if we run the ```sudo apt install libvips``` command; it installs libvips42 instead of libvips.
```
cd ~/dev/
wget https://github.com/libvips/libvips/releases/download/v8.5.5/vips-8.5.5.tar.gz
```
Extract the package and remove the downloaded tar.gz afterwards:
```
tar -xzvf vips-8.5.5.tar.gz
rm vips-8.5.5.tar.gz
mv vips-8.5.5 libvips
```
```
cd libvips/
sudo apt-get update
```
```
chmod +x configure
./configure
make
sudo make install
````
## Installation of minos:
```
cd ~/dev/
git clone --branch v0.7.x https://github.com/minosworld/minos.git
cd ~/dev/minos/
git checkout v0.7.x
```
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.7/install.sh | bash
source ~/.bashrc
```
```
nvm install v10.13.0
nvm alias default 10.13.0
```
```
cd minos/server/
npm config set python /usr/bin/python2.7
```
This command might take upto to a hour to complete. Be patience if it feels like its stuck.
```
npm install node-gyp@3.8.0 bufferutil@4.0.1 utf-8-validate@5.0.2
```

## Install Python Requirements:
First, we will install socketIO-client-2
```
cd ~/dev/minos/
```
> If already installed, and signs of corruption: ```pip3 uninstall socketIO-client-2 -y```

```
git clone https://github.com/msavva/socketIO-client-2
cd socketIO-client-2
pip3 install -e .
rm -rf socketIO_client_2.egg-info
```
```
export PATH=$PATH:/home/aazam/.local/bin
source ~/.bashrc
```
```
cd ..
pip3 install -e . -r requirements.txt
```
## Download Matterport3D Dataset
```
sudo apt install unzip
unzip /PATH/to/mp3d_minos.zip -d $HOME/work/
```
Extract the mp3d_minos.zip file to $HOME/work/ directory
### Test MINOS by running matterport3d dataset
```
python3 -m minos.tools.pygame_client --dataset mp3d --scene_ids 17DRP5sb8fy --env_config pointgoal_mp3d_s
```
