echo "************* Setup Rotorhazard service *************"

if [ -f "/lib/systemd/system/rotorhazard.service" ]; then
    echo "Rotorhazard service already exsists."
else 
    sed -i -e 's/pi/'$USER'/g' ./resources/rotorhazard.service

    # Note you will need to update the rotorhazard.service file if you are not using the pi username
    sudo cp ./resources/rotorhazard.service /lib/systemd/system/rotorhazard.service
    sudo chmod 644 /lib/systemd/system/rotorhazard.service

    # reload the daemon and enable
    sudo systemctl daemon-reload
    sudo systemctl enable rotorhazard.service
fi