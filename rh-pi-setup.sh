if grep -Fxq "1" /boot/RH/RHInstalProgress.txt
then
    echo "RotorHazard first stage install already completed"
else
    cd ~
    rm ./main.zip
    cd /home/aaron/RH-Setup-main
    chmod 744 ./scripts/package-installer.sh ./scripts/pi-config-update.sh ./scripts/set-python-version.sh ./scripts/rh-port-forward.sh ./scripts/rh-start-on-boot.sh ./scripts/rh-install.sh

    # Stop RotorHazard if it is running
    sudo systemctl stop rotorhazard

    ./scripts/package-installer.sh
    #./scripts/set-python-version.sh # Not required on newer installs of the Raspbian
    ./scripts/pi-config-update.sh

    sudo sh -c 'echo "1" > /boot/RH/RHInstalProgress.txt'
    echo "Script completed in: " $SECONDS "Seconds"
    echo "RotorHazard first stage instal done"
    echo "Rebooting to complete install"
    #sudo shutdown -r now
fi

if grep -Fxq "2" /boot/RH/RHInstalProgress.txt
then
    echo "RotorHazard second stage instal complete"
else
    cd /home/aaron/RH-Setup-main

    # Stop RotorHazard if it is running
    sudo systemctl stop rotorhazard

    ./scripts/rh-port-forward.sh
    #./scripts/rh-install.sh
    #./scripts/rh-start-on-boot.sh

    # Print the current version of Python
    python --version

    echo "Script completed in: " $SECONDS "Seconds"
    sudo sh -c 'echo "2" >> /boot/RH/RHInstalProgress.txt'
    echo "RotorHazard second stage instal done"
    echo "Raspberry pi will reboot in 30 seconds - note down the password!"
    sleep 30
    echo "Rebooting now"
    #sudo shutdown -r now
fi