echo "************* Setup RTC service *************"

if [ -f "/lib/systemd/system/hwclock-start.service" ]; then
    echo "RTC service already exsists."
else 
    sed -i -e 's/pi/'$USER'/g' ./resources/hwclock-start.service

    sudo cp ./resources/hwclock-start.service /lib/systemd/system/hwclock-start.service
    sudo chmod 644 /lib/systemd/system/hwclock-start.service
    sudo chown root:root /etc/systemd/system/hwclock-start.service

    # reload the daemon and enable
    sudo systemctl daemon-reload
    sudo systemctl enable hwclock-start.service
    sudo systemctl start hwclock-start.service
fi