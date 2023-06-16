# RH-Setup

### How to install
1. Instal Raspbian onto your SD card using raspberry pi imager
2. Paste the RH folder into boot folder on your SD card
3. Add the following command to firstrun.sh on the line above 'rm -f /boot/firstrun.sh':
```
sudo cp /boot/RH/rc.local /etc/rc.local
```
4. Open /boot/RH/rc.local file and change USERNAME for the username you set your pi up with and save the file
5. Remove the SD card and install it into yours PI
6. Apply power to the PI and the install script will begin
7. The raspberry pi will then reboot several times, give it 20 to 30 mins and it should all be setup for you

The script will put additional files into /boot/RH which include the config.json file which will show the password for your rotorhazard admin panel as well as a log script of the instal

### How to connect to your timer
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