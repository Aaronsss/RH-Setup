echo "************* Download latest fan control script *************"
#note this is used instead of the build in Pi fan control as the build in one only supports temps between 60 and 120C

cd ~
sudo git clone https://github.com/Aaronsss/Raspberry-Pi-Fan-Control.git
cd Raspberry-Pi-Fan-Control

echo "************* Setup fan control service *************"

if [ -f "/lib/systemd/system/pi-fan-control.service" ]; then
    echo "fan control service already exsists."
else 
    sed -i -e 's/pi/'$USER'/g' ./resources/pi-fan-control.service

    sudo cp ./resources/rotorhazard.service /lib/systemd/system/pi-fan-control.service
    sudo chmod 644 /lib/systemd/system/pi-fan-control.service

    # reload the daemon and enable
    sudo systemctl daemon-reload
    sudo systemctl enable pi-fan-control.service
fi