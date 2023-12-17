# RH-Setup

These scripts will setup your raspberry pi for the latest stable release of RotorHazard by adding a few files to your SD card and changing a few lines of code 

### How to install
Please note the automated instal does not work corretly with Bookworm (version 12), you will either need to instal manually or use an older version of Raspberry pi OS Bullseye (version 11)
1. Install Pi OS onto your SD card using raspberry pi imager (https://www.raspberrypi.com/software/)
2. Paste the RH folder from this repository into your SD card (note 2 drives will appear use the one you can see files in)
3. Add the following command to firstrun.sh on the line above 'rm -f /boot/firstrun.sh':
```
sudo cp /boot/RH/rc.local /etc/rc.local
```
4. Open /boot/RH/rc.local file and change USERNAME for the username you set your pi up with and save the file
5. Remove the SD card from your PC and install it into your Pi
6. Apply power to the PI and the install script will begin
7. The raspberry pi will then reboot several times, give it 20 to 30 mins and it should all be setup for you

The script will put additional files into /boot/RH which include the config.json file which will show the password for your rotorhazard admin panel as well as a log script of the install. 

Once the installer is complete you can turn off the pi remove the SD card and look at it on your PC to get the admin login for the web interface.

### How to connect to your timer
You will need to find out the IP of your laptimer. For this you could download an app on your phone called fing. Make sure you are on the same network as the timer and then scan the network. The raspberry pi will likely be identified as a raspberrypi, you should use this ip to connect to your timer. You can also use the hostname to connector. FOr example if you set the hostname to laptimer during the SD card setup in the raspberry pi imager you can connect to the pi with the address laptimer.local

The last thing to do is to install the STM32 firmware from within the rotorhazard settings -> system page

### Manual installation
 
if you are logged into SSH and want to run the setup manually run these commands to install RotorHazard and all of it's dependencies

```
cd ~
wget https://github.com/Aaronsss/RH-Setup/archive/refs/heads/main.zip
unzip main.zip
sudo chmod 744 ~/RH-Setup-main/rh-pi-setup.sh
~/RH-Setup-main/rh-pi-setup.sh
```
The raspberry pi will then reboot and you will have to run the following command to complete manual installation once the pi is booted up again
```
~/RH-Setup-main/rh-pi-setup.sh
```

### Updating the timer software

Should you wish to update the timer software you will need to delete /boot/RH/RHInstalProgress.txt this can be done vis SSH or on the SD card
