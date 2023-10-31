# README.md

- [English](#english)
- [中文](#中文)



### English

#### Installing a ROS Environment on Ubuntu

First, you need to open the' ros_install.sh 'file and select the ROS installation version according to your Ubuntu release version in line 12.

#rosversion="kinetic" #Ubuntu 14.04LTS/16.04LTS
#rosversion="melodic" #Ubuntu 18.04LTS
rosversion="noetic" #Ubuntu 20.04LTS

This test uses Ubuntu20.04 LTS version, select the noetic version to install



Provide two installation methods, you can choose one of the 1 or 2 to start the installation

1. Step-by-step installation of the ROS environment

```shell
sudo ./ros_install.sh
sudo ./extern_pkg_install.sh
sudo ./dev_tools_install.sh
```

2. Complete installation of ros and peripheral environment

```shell
sudo ./ros_full_install.sh
```

3.   Put the catkin_ws folder under your Linux user folder
4. Add environment variables:

```shell
user$ vim ~/.bashrc
```

  Add the startup configuration at the bottom of. bashrc:

```shell
source /opt/ros/melodic/setup.bash
source ~/catkin_ws/devel/setup.bash
```

-   Please replace the following ROBOT_IP_ADDR with Linux IP, and use "source ~/.bashrc" to load the configuration after configuration
-   Please remember that the IP of strawberry pie and the IP of the virtual machine must be on the same network segment, otherwise the car cannot be controlled at this end of the virtual machine. Please do not use a large local area network similar to the campus network and the company. They are not strictly local area networks. Please use the local area network of the same router.
-   Please remember that if your virtual machine is set to NAT network mode, your virtual machine can ssh to strawberry pie, but it is not on the same network segment, please set the virtual machine to bridge mode
-   Regarding the use of depth cameras, please use them on industrial control machines instead of virtual machines. Virtual machines are USB devices whose software cannot simulate high-speed transmission such as USB, which will lead to various abnormal uses. Do not use them on strawberry pies. The performance of strawberry pies is very poor and very difficult.
-   HOST_IP_ADDR used in single-host mode, when using virtual machines for simulation

#hostname get ip

```shell
HOST_IP_ADDR=$(echo "$(hostname -I)" |sed 's/[ ]*$//g')

export ROS_IP=$HOST_IP_ADDR
export ROS_HOSTNAME=$ROS_IP
export ROS_MASTER_URI=http://$ROS_IP:11311
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/catkin_make/src
echo "IP address : [$ROS_IP]"

export MBSLIDAR=rplidar
export MBSBASE=mecanum

```

```shell
source ~/.bashrc load config
```

4. building project

```shell
cd ~/catkin_ws
catkin_make -j1
```

Run after compile prompt 100%

```shell
roslaunch mbsrobot bringup.launch
```

Start the chassis node test. If the node can start normally, the environment installation is successful.

---

### 中文

#### 在Ubuntu上安装ROS环境

首先需要打开'ros_install.sh'文件, 在12行出根据您的Ubuntu发行版本来选择ROS安装版本

#rosversion="kinetic" #Ubuntu  14.04LTS/16.04LTS
#rosversion="melodic" #Ubuntu 18.04LTS
rosversion="noetic"  #Ubuntu 20.04LTS

本次测试使用的是Ubuntu20.04 LTS版本, 选择noetic版本安装



提供两种安装方式,可以在1.2任选一种开始安装

1. 分步安装ROS环境

```shell
sudo ./ros_install.sh
sudo ./extern_pkg_install.sh
sudo ./dev_tools_install.sh
```

2. 完整安装ros和外设环境

```shell
sudo ./ros_full_install.sh
```

3.   将catkin_ws文件夹放到你的Linux用户文件夹下

4.   添加环境变量:

```shell
user$ vim ~/.bashrc
```

   在.bashrc最下面添加启动配置:

```shell
source /opt/ros/melodic/setup.bash
source ~/catkin_ws/devel/setup.bash
```

-   请将下面的ROBOT_IP_ADDR替换成Linux的IP，配置完后使用"source ~/.bashrc"加载配置

-   请记住树莓派的IP与虚拟机的IP一定要是在同一网段，不然小车在虚拟机这一端不可控制，请不要使用类似于校园网与公司的大局域网，它们不是严格意义上的局域网，请一定使用同一路由器的局域网络。

-   请记住如果你的虚拟机是设置为NAT网络模式，你的虚拟机是能ssh到树莓派的，但不是在同一网段，请设置虚拟机为桥接模式

-   关于深度摄像头的使用，请在工控机上使用，不要用虚拟机，虚拟机是软件不能模拟USB这种高速传输的USB设备，会导致各种使用不正常，不要在树莓派上使用，树莓派性能很差非常非常卡。

-   HOST_IP_ADDR用于单主机模式，使用虚拟机进行仿真的时候使用

#hostname获取ip

```shell
HOST_IP_ADDR=$(echo "$(hostname -I)" |sed 's/[ ]*$//g')

export ROS_IP=$HOST_IP_ADDR
export ROS_HOSTNAME=$ROS_IP
export ROS_MASTER_URI=http://$ROS_IP:11311
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/catkin_make/src
echo "IP address : [$ROS_IP]"

export MBSLIDAR=rplidar
export MBSBASE=mecanum
```

#----------------------------------------------------------------
执行source ~/.bashrc 加载配置

4. 编译工程

```shell
cd ~/catkin_ws
catkin_make -j1
```

编译提示100%后运行

```shell
roslaunch mbsrobot bringup.launch
```

启动底盘节点测试, 如果节点可以正常启动，那就说明环境安装成功
