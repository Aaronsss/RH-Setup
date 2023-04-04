# Clean up and set file permimssions
cd ~
rm ./main.zip
cd /home/aaron/RH-Setup-main
chmod 744 ./scripts/package-installer.sh ./scripts/pi-config-update.sh ./scripts/set-python-version.sh ./scripts/rh-port-forward.sh ./scripts/rh-start-on-boot.sh ./scripts/rh-install.sh

# Stop RotorHazard if it is running
sudo systemctl stop rotorhazard

# Scripts to run
./scripts/package-installer.sh
./scripts/pi-config-update.sh
#./scripts/set-python-version.sh # Not required on newer installs of the Raspbian
./scripts/rh-port-forward.sh
#./scripts/rh-install.sh
#./scripts/rh-start-on-boot.sh

# Print the current version of Python
python --version

# Finish up and reboot the pi
echo "Script completed in: " $SECONDS "Seconds"
echo "Raspberry pi will reboot in 30 seconds - note down the password!"
sleep 30
echo "Rebooting now"
#sudo shutdown -r now