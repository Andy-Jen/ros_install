#!/bin/bash

# Copyright © 2022 AndyJen Incorporated.All rights reserved.
# 2022-2023 China AndyJen,inc.All rights reserved.
# e-mail ren126010@gmail.com
# version 1.2.2


# ROS install erector 

# -----------Install ROS environment-----------
# ROS Varibles
#rosversion="kinetic" #Ubuntu mate 14.04LTS/16.04LTS
#rosversion="melodic" #Ubuntu mate 18.04LTS
rosversion="noetic"  #Ubuntu mate 20.04LTS

sudo apt-get update

sudo apt-get install -y qt4-dev-tools    qt4-designer
sudo apt-get install -y qt4-doc
sudo apt-get install -y qt4-qtconfig
sudo apt-get install -y qt4-demos
sudo apt-get install -y qt4-designer
sudo apt-get install -y libgeographic-dev
sudo apt-get install -y libv4l-dev 
sudo apt-get install -y build-essential
sudo apt-get install -y chrony
sudo apt-get install -y libbullet-dev 
sudo apt-get install -y libudev-dev
sudo apt-get install -y libusb-dev
sudo apt-get install -y mini-httpd
sudo apt-get install -y ros-$rosversion-roslint
sudo apt-get install -y ros-$rosversion-rosserial
sudo apt-get install -y ros-$rosversion-imu-filter-madgwick
sudo apt-get install -y ros-$rosversion-gmapping
sudo apt-get install -y ros-$rosversion-navigation
sudo apt-get install -y ros-$rosversion-map-server
sudo apt-get install -y ros-$rosversion-rgbd-launch
sudo apt-get install -y ros-$rosversion-costmap-2d
sudo apt-get install -y ros-$rosversion-pcl-ros
sudo apt-get install -y ros-$rosversion-camera-info-manager
sudo apt-get install -y ros-$rosversion-image-transport
sudo apt-get install -y ros-$rosversion-teleop-twist-keyboard 
sudo apt-get install -y ros-$rosversion-robot-upstart
sudo apt-get install -y ros-$rosversion-slam-karto
sudo apt-get install -y ros-$rosversion-geographic-msgs 
sudo apt-get install -y ros-$rosversion-pluginlib
sudo apt-get install -y ros-$rosversion-rosbridge-suite
sudo apt-get install -y ros-$rosversion-robot-pose-publisher
sudo apt-get install -y ros-$rosversion-tf2-web-republisher
sudo apt-get install -y ros-$rosversion-web-video-server
sudo apt-get install -y ros-$rosversion-driver-base 
sudo apt-get install -y ros-$rosversion-driver-libuvc


mkdir ~/catkin_ws/src -p
cd ~/catkin_ws/src
mkdir depth_camera lidar teleop

cd ~/catkin_ws/src
echo "add camera ros packages!!"
git clone https://github.com/ktossell/camera_umd.git

echo "reinstall geometry2 sloved imu error"
git clone https://github.com/ros/geometry2.git


cd depth_camera
echo "add Astra xtion live"
echo "Astra xtion driver please: https://orbbec3d.com/develop/"
git clone https://github.com/orbbec/ros_astra_launch.git
git clone https://github.com/orbbec/ros_astra_camera.git
git clone https://github.com/xaxxontech/depthimage_to_laserscan.git

cd  ~/catkin_ws/src
echo "add opencv demo"
git clone https://github.com/ykevin/opencv_apps.git

echo "slove rosserial indigo version"
#git clone  https://github.com/ros-drivers/rosserial.git 

echo "add ps3"
#sudo apt-get install -y libusb-dev libspnav-dev  libbluetooth-dev libcwiid-dev
#sudo pip install pybluez
#git clone https://github.com/ros-drivers/joystick_drivers.git

echo "add Twist multiplexer"
#git clone https://github.com/ros-teleop/twist_mux.git

cd teleop
echo "add Generic Keyboard Teleop"
git clone https://github.com/ykevin/teleop_twist_keyboard.git

cd ~/catkin_ws/src
cd lidar
echo "add hector slam"
git clone https://github.com/tu-darmstadt-ros-pkg/hector_slam.git

echo "add rplidar ros packages"
git clone -b slam https://github.com/robopeak/rplidar_ros.git

echo "add EAI X4 lidar ros packages"
git clone -b 1.2.3 https://github.com/EAIBOT/ydlidar.git

cd ~/catkin_ws/src
echo "add robot_localization"
git clone https://github.com/cra-ros-pkg/robot_localization.git

echo "add imu filter"
git clone https://github.com/ykevin/imu_filter_madgwick.git

# -----------Build ROS workspace-----------
cd ~/catkin_ws/
catkin_make -j1

echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo usermod -aG dialout $USER

echo "ROS Packages Installed Successfully"
