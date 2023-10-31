#!/bin/bash

# Copyright © 2020 Moebius Incorporated.All rights reserved.
# 2020-2020 China Moebius,inc.All rights reserved.
# e-mail 1260105099@qq.com
# version 1.0.1


# Moebius ROS install erector 

# -----------Install ROS environment-----------
# ROS Varibles
#rosversion="kinetic" #Ubuntu mate 14.04LTS/16.04LTS
rosversion="melodic" #Ubuntu mate 18.04LTS
#rosversion="noetic"  #Ubuntu mate 20.04LTS

#Get current path
cur_dir=$(pwd)
echo "Current path: $cur_dir"
# config network hosts

echo "export ROS_IP=\`hostname -I | awk '{print }'\`" >> ~/.bashrc
echo "export ROS_HOSTNAME=\`hostname -I | awk '{print }'\`" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://\`hostname -I | awk '{print }'\`:11311" >> ~/.bashrc
echo "export MBSBASE=mecanum" >> ~/.bashrc
echo "export MBSLIDAR=rplidar" >> ~/.bashrc

echo "Network setup done"
