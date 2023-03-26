chmod 744 ./scripts/package-installer.sh ./scripts/pi-config-update.sh ./scripts/set-python-version.sh ./scripts/rh-port-forward.sh ./scripts/rh-start-on-boot.sh ./scripts/rh-install.sh

./scripts/package-installer.sh
#./scripts/pi-config-update.sh
#./scripts/set-python-version.sh
#./scripts/rh-port-forward.sh
#./scripts/rh-start-on-boot.sh
#./scripts/rh-install.sh

echo "Script completed in: " $SECONDS "Seconds"

echo "Raspberry pi will reboot in 30 seconds - note down the password quick! :)"
sleep 30
sudo shutdown -r now