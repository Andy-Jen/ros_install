用户构建mbsrobot环境须知
1、请将我们提供的ROS工作环境里面的代码拷贝到你要构建的环境，就是catkin_ws这个目录，然后删除build与devel这两个文件夹

2、如果没安装ROS，请先安装ROS，里面有install_ROS.sh这个脚本.

3、初始化User目录下的ros_packages_install.sh这个脚本 
4、安装好相关的依赖包后，请进入到catkin_ws的工作空间目录进行编译，编译请一定要开单线程 catkin_make -j1
5、如果编译通过后请执行mbshost_network.sh这个脚本，把mbsrobot的网络环境与环境变量添加
6、请把58-mbs.rules这个规则文件拷贝到 /etc/udev/rules.d/目录下面， 可以执行 sudo cp 58-mbs.rules /etc/udev/rules.d/
