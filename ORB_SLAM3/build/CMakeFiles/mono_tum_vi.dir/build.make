# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/aazam/dev/ORB_SLAM3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aazam/dev/ORB_SLAM3/build

# Include any dependencies generated for this target.
include CMakeFiles/mono_tum_vi.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mono_tum_vi.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mono_tum_vi.dir/flags.make

CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.o: CMakeFiles/mono_tum_vi.dir/flags.make
CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.o: ../Examples/Monocular/mono_tum_vi.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aazam/dev/ORB_SLAM3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.o -c /home/aazam/dev/ORB_SLAM3/Examples/Monocular/mono_tum_vi.cc

CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aazam/dev/ORB_SLAM3/Examples/Monocular/mono_tum_vi.cc > CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.i

CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aazam/dev/ORB_SLAM3/Examples/Monocular/mono_tum_vi.cc -o CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.s

# Object files for target mono_tum_vi
mono_tum_vi_OBJECTS = \
"CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.o"

# External object files for target mono_tum_vi
mono_tum_vi_EXTERNAL_OBJECTS =

../Examples/Monocular/mono_tum_vi: CMakeFiles/mono_tum_vi.dir/Examples/Monocular/mono_tum_vi.cc.o
../Examples/Monocular/mono_tum_vi: CMakeFiles/mono_tum_vi.dir/build.make
../Examples/Monocular/mono_tum_vi: ../lib/libORB_SLAM3.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_dnn.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_gapi.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_highgui.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_ml.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_objdetect.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_photo.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_stitching.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_video.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_calib3d.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_features2d.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_flann.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_videoio.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_imgcodecs.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_imgproc.so.4.4.0
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libopencv_core.so.4.4.0
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/libcv_bridge.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_dnn.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_video.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_videoio.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_aruco.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_bgsegm.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_bioinspired.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_ccalib.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_datasets.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_dnn_objdetect.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_dnn_superres.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_dpm.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_face.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_freetype.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_fuzzy.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_hdf.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_hfs.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_img_hash.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_line_descriptor.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_optflow.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_phase_unwrapping.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_plot.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_quality.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_reg.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_rgbd.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_saliency.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_shape.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_stereo.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_structured_light.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_surface_matching.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_text.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_tracking.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_viz.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_ximgproc.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_xobjdetect.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_xphoto.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_core.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.4.2.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libopencv_imgcodecs.so.4.2.0
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/libimage_transport.so
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/libmessage_filters.so
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/libclass_loader.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libPocoFoundation.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libdl.so
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/libroslib.so
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/librospack.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libpython3.8.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.71.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/libroscpp.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libpthread.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/librosconsole.so
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/librosconsole_log4cxx.so
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/librosconsole_backend_interface.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/libxmlrpcpp.so
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/libroscpp_serialization.so
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/librostime.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
../Examples/Monocular/mono_tum_vi: /opt/ros/noetic/lib/libcpp_common.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_glgeometry.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_geometry.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_plot.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_python.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_scene.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_tools.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_display.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_vars.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_video.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_packetstream.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_windowing.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_opengl.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_image.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libpango_core.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libGLEW.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libOpenGL.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libGLX.so
../Examples/Monocular/mono_tum_vi: /usr/lib/x86_64-linux-gnu/libGLU.so
../Examples/Monocular/mono_tum_vi: /usr/local/lib/libtinyobj.so
../Examples/Monocular/mono_tum_vi: ../Thirdparty/DBoW2/lib/libDBoW2.so
../Examples/Monocular/mono_tum_vi: ../Thirdparty/g2o/lib/libg2o.so
../Examples/Monocular/mono_tum_vi: CMakeFiles/mono_tum_vi.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/aazam/dev/ORB_SLAM3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../Examples/Monocular/mono_tum_vi"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mono_tum_vi.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mono_tum_vi.dir/build: ../Examples/Monocular/mono_tum_vi

.PHONY : CMakeFiles/mono_tum_vi.dir/build

CMakeFiles/mono_tum_vi.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mono_tum_vi.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mono_tum_vi.dir/clean

CMakeFiles/mono_tum_vi.dir/depend:
	cd /home/aazam/dev/ORB_SLAM3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aazam/dev/ORB_SLAM3 /home/aazam/dev/ORB_SLAM3 /home/aazam/dev/ORB_SLAM3/build /home/aazam/dev/ORB_SLAM3/build /home/aazam/dev/ORB_SLAM3/build/CMakeFiles/mono_tum_vi.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mono_tum_vi.dir/depend

