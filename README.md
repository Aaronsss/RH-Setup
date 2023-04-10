# RH-Setup

Once you have installed Raspbian on your SD card open the boot drive on your PC, paste in the contents of the boot folder and then add the following command to the end of firstrun.sh:
```
sudo cp /boot/RH/rc.local /etc/rc.local
```
The raspberry pi will then reboot several times, give it 20 to 30 mins and it should all be setup for you
 
if you are logged into SSH and want to run the setup manually run these commands to install RotorHazard and all of it's dependancies

```
cd ~
wget https://github.com/Aaronsss/RH-Setup/archive/refs/heads/main.zip
unzip main.zip
sudo chmod 744 ~/RH-Setup-main/rh-pi-setup.sh
~/RH-Setup-main/rh-pi-setup.sh
```