
# ESP Bootstrap

This repo is an abstraction of the boilerplate code that I have been using in my recent esp32 projects. 
The idea is to be able to go from a new esp32 to coding on what I want it to do without needing to remember how I get it setup each time.

On first setup you need to run ./init.sh which should (untested) take care of erasing the esp32, flashing micropython to it, copying over the necessary python files to connect to your wifi, and configuring the webrepl.

Before running init.sh you need to copy ConnectWiFi.py.example to ConnectWiFi.py and update the credentials inside along with the network settings if required for your home network.

Once the script is done you will be able to connect to the webrepl on your esp32.
http://micropython.org/webrepl/

Your code should go in run.py 

When you want to upload a new version of run.py to the esp32 use the command

`webrepl_cli.py -p WEBREPL_PASSWORD run.py 192.168.0.10:`

Note: you can not be connected to the webrepl at the same time that you run this command or it will not work, so disconnect first
also make sure you replaced WEBREPL_PASSWORD with the password you chose for the webrepl during setup, and are using the correct ip address for the esp32 (you can find it in ConnectWiFi.py).
You should also make sure you have installed webrepl_cli.py from https://github.com/micropython/webrepl

After copying a file to the esp32 you need to either hit the reset button, or reset the device via the reset command

`import machine; machine.reset()`

After resetting you have to reconnect to the webrepl, at which point you can execute your code by running 

```
import run
run.run()
```
