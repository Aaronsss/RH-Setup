# RH-Setup

Once you have installed Raspbian on your SD card open the boot drive from the SD card on your PC, paste the RH folder into boot and then add the following command firstrun.sh on the line above 'rm -f /boot/firstrun.sh':
```
sudo cp /boot/RH/rc.local /etc/rc.local
```
The raspberry pi will then reboot several times, give it 20 to 30 mins and it should all be setup for you

You will need to find out the IP of your laptimer. For this you could download an app on your phone called fing. Make sure you are on the same network as the timer and then scan the network. The raspberry pi will likely be identified as a raspberrypi, you should use this ip to connect to your timer.

The last thing to do is to install the STM32 firmware
 
if you are logged into SSH and want to run the setup manually run these commands to install RotorHazard and all of it's dependancies

```
cd ~
wget https://github.com/Aaronsss/RH-Setup/archive/refs/heads/main.zip
unzip main.zip
sudo chmod 744 ~/RH-Setup-main/rh-pi-setup.sh
~/RH-Setup-main/rh-pi-setup.sh
```