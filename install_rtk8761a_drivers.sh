#!/bin/bash

# TO-DO: Get distro name and ADD support for differents distros
#DISTRO=$(lsb_release -i | cut -d ":" -f2 | sed -e 's/\s//g' | sed 's/[A-Z]/\L&/g')

# Installation for Ubuntu
apt install make gcc build-essential bluez wget unzip linux-headers-$(uname -r)
# Download file to /tmp
wget 'https://github.com/zi5t0/drivers/raw/main/drivers_rtk8761a.zip' -O /tmp/drivers_rtk8761a.zip
# Give permissions to downloaded zip
chmod 777 /tmp/drivers_rtk8761a.zip
# Decompress drivers
unzip /tmp/drivers_rtk8761a.zip -d /tmp/drivers_rtk8761a
# Remove temporal zip
rm /tmp/drivers_rtk8761a.zip
# Go to uart module and compile it
cd /tmp/drivers_rtk8761a/uart && sudo make install
# Go to usb module and compile it
cd /tmp/drivers_rtk8761a/usb && sudo make install
# Go to general module and compile it
cd /tmp/drivers_rtk8761a/ && sudo make install INTERFACE=all
# Copy driver files to ubuntu folder
sudo cp -R /tmp/drivers_rtk8761a/rtkbt-firmware/lib/firmware/rtlbt/* /lib/firmware/rtl_bt/
# Remove temporal folder
sudo rm -r /tmp/drivers_rtk8761a
# Successfully drivers installed message
echo "Congratulations! Drivers rtk_8761a successfully installed"

