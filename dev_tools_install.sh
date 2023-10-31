#!/bin/bash

# Copyright © 2022 AndyJen Incorporated.All rights reserved.
# 2022-2023 China AndyJen,inc.All rights reserved.
# e-mail ren126010@gmail.com
# version 1.2.2


sudo apt-get update
sudo apt-get install python-gudev
sudo apt-get install -y avahi-daemon
sudo apt-get install -y openssh-server
sudo apt-get install -y arduino-core
sudo easy_install pip
sudo pip install -U platformio
sudo rm -rf ~/.platformio/
#wget https://www.pjrc.com/teensy/49-teensy.rules
sudo cp 49-teensy.rules /etc/udev/rules.d/
sudo cp 58-mbs.rules /etc/udev/rules.d/
sudo cp 558-orbbec-usb.rules /etc/udev/rules.d/

echo "Installation Done"

