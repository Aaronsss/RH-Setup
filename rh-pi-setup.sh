chmod 744 ./scripts/package-installer.sh ./scripts/pi-config-update.sh ./scripts/set-python-version.sh ./scripts/rh-port-forward.sh ./scripts/rh-start-on-boot.sh ./scripts/rh-install.sh

#if sudo systemctl status rotorhazard.service
#then
    sudo systemctl stop rotorhazard
#fi

./scripts/package-installer.sh
#./scripts/pi-config-update.sh
#./scripts/set-python-version.sh
#./scripts/rh-install.sh
#./scripts/rh-port-forward.sh
#./scripts/rh-start-on-boot.sh

echo "Script completed in: " $SECONDS "Seconds"

echo "Raspberry pi will reboot in 30 seconds - note down the password!"
sleep 30
echo "Rebooting now"
#sudo shutdown -r now