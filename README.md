# RH-Setup

These scripts will setup your raspberry pi for the latest stable release of RotorHazard by adding a few files to your SD card and changing a few lines of code 

### How to install
1. Instal Raspbian onto your SD card using raspberry pi imager (https://www.raspberrypi.com/software/)
2. Paste the RH folder from this repository into your SD card (note 2 drives will appear use the one you can see files in)
3. Add the following command to firstrun.sh on the line above 'rm -f /boot/firstrun.sh':
```
sudo sed -i -e 's/USERNAME/'$USER'/g' /boot/RH/rc.local
sudo cp /boot/RH/rc.local /etc/rc.local
```
4. Open /boot/RH/rc.local file and change USERNAME for the username you set your pi up with and save the file
5. Remove the SD card from your PC and install it into your Pi
6. Apply power to the PI and the install script will begin
7. The raspberry pi will then reboot several times, give it 20 to 30 mins and it should all be setup for you

The script will put additional files into /boot/RH which include the config.json file which will show the password for your rotorhazard admin panel as well as a log script of the instal. 

Once the instller is complete you can turn off the pi remove the SD card and look at it on your PC to get the admin login for the web interfae

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