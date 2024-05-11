## OpenCV 4.4.0 Installation Guide on Ubuntu 20.04
To install OpenCV 4.4.0 on Ubuntu 20.04, you can follow these steps:

1. **Update your package list**: This ensures that you have the latest information about what packages and versions are available to install. You can do this by running the following command¹:

```bash
sudo apt update
```

2. **Install the necessary dependencies**: OpenCV requires several dependencies to build. You can install them with the following command¹:

```bash
sudo apt install build-essential cmake git pkg-config libgtk-3-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
    gfortran openexr libatlas-base-dev python3-dev python3-numpy \
    libtbb2 libtbb-dev libdc1394-22-dev libopenexr-dev \
    libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
```

3. **Download and unpack the OpenCV sources**: You can download the OpenCV 4.4.0 sources from the official OpenCV GitHub repository¹:

```bash
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.4.0.zip
unzip opencv.zip
rm -rf opencv.zip
```

4. **Create a build directory and switch into it**: You can do this with the following commands¹:

```bash
cd opencv-4.4.0
mkdir build && cd build
```

5. **Configure the build with CMake**: You can do this with the following command¹:

```bash
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D BUILD_EXAMPLES=ON ..
```

6. **Build and install OpenCV**: You can do this with the following commands¹:

```bash
make -j4
sudo make install
```

Please note that the `-j4` option in the `make` command specifies that it should use 4 cores for the build process. You can adjust this number based on the number of cores in your system¹.
```
sudo apt install libopencv-dev
pip3 install opencv-python=='4.2.0.34'
```

