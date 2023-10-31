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

#Get current path
cur_dir=$(pwd)
echo "Current path: $cur_dir"
# Install the ros

echo "Start to install the ros, http://wiki.ros.org/$rosversion/Install/Ubuntu"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

echo "Update the software list..."
sudo apt-get update

echo "Install curl tools..."
sudo apt-get install curl -y

echo "Install the ros from apt"
sudo apt-get install ros-$rosversion-desktop-full -y

echo "Install python rosdep"
sudo apt-get install python3-rosdep -y

#sudo rm /etc/ros/rosdep/sources.list.d/20-default.list
sudo echo "151.101.84.133 raw.githubusercontent.com">>/etc/hosts

sudo rosdep init
sudo rosdep update

echo "source ${cur_dir}/devel/setup.bash">>~/.bashrc
echo "source /opt/ros/$rosversion/setup.bash">>~/.bashrc
source ~/.bashrc


