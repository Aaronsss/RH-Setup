cd ~
sudo git clone https://github.com/Aaronsss/Raspberry-Pi-Fan-Control.git
cd Raspberry-Pi-Fan-Control

sed -i -e 's/pi/'$USER'/g' ../resources/pi-fan-control.service

# Note you will need to update the pi-fan-control.service file if you are not using the pi username
sudo cp ../resources/pi-fan-control.service /lib/systemd/system/pi-fan-control.service
sudo chmod 644 /lib/systemd/system/pi-fan-control.service

# reload the daemon and enable
sudo systemctl daemon-reload
sudo systemctl enable pi-fan-control.service