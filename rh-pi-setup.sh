cd ~
if test -f "./main.zip"; then
    rm ./main.zip
    chmod 744 ./scripts/package-installer.sh ./scripts/pi-config-update.sh ./scripts/set-python-version.sh ./scripts/rh-port-forward.sh ./scripts/rh-start-on-boot.sh ./scripts/rh-install.sh
fi

if grep -Fxq "1" /boot/RH/RHInstalProgress.txt
then
    echo "$(date) RotorHazard first stage install already completed"
else
    cd /home/aaron/RH-Setup-main

    # Stop RotorHazard if it is running
    sudo systemctl stop rotorhazard

    ./scripts/package-installer.sh
    #./scripts/set-python-version.sh # Not required on newer installs of the Raspbian
    ./scripts/pi-config-update.sh

    sudo sh -c 'echo "1" > /boot/RH/RHInstalProgress.txt'
    echo "$(date) RotorHazard first stage install completed in: " $SECONDS "Seconds"
    echo "Rebooting to complete install"
    sudo shutdown -r now
fi

if grep -Fxq "2" /boot/RH/RHInstalProgress.txt
then
    echo "$(date) RotorHazard second stage install already completed"
else
    cd /home/aaron/RH-Setup-main

    # Stop RotorHazard if it is running
    sudo systemctl stop rotorhazard

    ./scripts/rh-port-forward.sh
    ./scripts/rh-install.sh
    ./scripts/rh-start-on-boot.sh

    # Print the current version of Python
    python --version

    sudo sh -c 'echo "2" >> /boot/RH/RHInstalProgress.txt'
    echo "$(date) RotorHazard second stage install completed in: " $SECONDS "Seconds"
    echo "Raspberry pi will reboot in 30 seconds - note down the password!"
    sleep 30
    echo "Rebooting now"
    sudo shutdown -r now
fi