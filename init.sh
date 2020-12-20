#!/bin/bash

# this script inits a new esp32 for use with micropython

esp32_device=/dev/ttyUSB0

# TODO:
# check that esptool.py is installed
# check that ampy is installed
# check that screen is installed
# fix the ampy sudo permissions
# user input ion the esp32_device variable
# script status and friendly output
# is there a way to configure webrepl without doing it manually?
# check that webrepl_cli.py is installed (maybe warn only?)
# check that ConnectWiFi.py exists

# erase the esp32
esptool.py --chip esp32 --port $esp32_device erase_flash
esptool.py --chip esp32 --port $esp32_device --baud 460800 write_flash -z 0x1000 esp32-idf4-20200902-v1.13.bin

echo "You will now enter the repl, to setup webrepl type 'import webrepl_setup' at the prompt then follow the instructions" 
screen $esp32_device 115200 

echo "Make sure you have the right network settings and credentials in your ConnectWiFi.py script"
read -p "press any key to continue" x
sudo ampy --port $esp32_device --baud 115200 put ConnectWiFi.py
sudo ampy --port $esp32_device --baud 115200 put boot.py
sudo ampy --port $esp32_device --baud 115200 put main.py
sudo ampy --port $esp32_device --baud 115200 put run.py

echo "Now that you're device is connected to your wifi and setup with webrepl you can push code to the device using the following command (once you update it with your devices ip, and a few other variables including the password you chose for the webrepl)."
echo "webrepl_cli.py -p WEBREPL_PASSWORD run.py 192.168.0.10:"
echo "Note: you can not be connected to the webrepl at the same time that you run this command or it will not work, so disconnect first"
