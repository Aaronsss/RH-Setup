echo "************* Update pi settings to support bluepill hardware *************"

sudo raspi-config nonint do_ssh 0
sudo raspi-config nonint do_spi 0
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_serial 2

if grep -nq "dtparam=i2c_baudrate=75000" /boot/config.txt
then
	echo "dtparam=i2c_baudrate=75000 already set"
else
    sudo -- bash -c 'echo "dtparam=i2c_baudrate=75000" >> /boot/config.txt'
fi

if grep -nq "dtoverlay=miniuart-bt" /boot/config.txt
then
	echo "dtoverlay=miniuart-bt already set"
else
    sudo -- bash -c 'echo "dtoverlay=miniuart-bt" >> /boot/config.txt'
fi

if grep -nq "dtoverlay=act-led,gpio=24" /boot/config.txt
then
	echo "dtoverlay=act-led,gpio=24 already set"
else
    sudo -- bash -c 'echo "dtoverlay=act-led,gpio=24" >> /boot/config.txt'
fi

if grep -nq "dtparam=act_led_trigger=heartbeat" /boot/config.txt
then
	echo "dtparam=act_led_trigger=heartbeat already set"
else
    sudo -- bash -c 'echo "dtparam=act_led_trigger=heartbeat" >> /boot/config.txt'
fi

if grep -nq "dtoverlay=gpio-shutdown,gpio_pin=18,debounce=5000" /boot/config.txt
then
	echo "dtoverlay=gpio-shutdown,gpio_pin=18,debounce=5000 already set"
else
    sudo -- bash -c 'echo "dtoverlay=gpio-shutdown,gpio_pin=18,debounce=5000" >> /boot/config.txt'
fi

if grep -nq "core_freq=250" /boot/config.txt
then
	echo "core_freq=250 already set"
else
    sudo -- bash -c 'echo "[pi0]" >> /boot/config.txt'
    sudo -- bash -c 'echo "[pi1]" >> /boot/config.txt'
    sudo -- bash -c 'echo "[pi2]" >> /boot/config.txt'
    sudo -- bash -c 'echo "[pi3]" >> /boot/config.txt'
    sudo -- bash -c 'echo "core_freq=250" >> /boot/config.txt'
    sudo -- bash -c 'echo "[all]" >> /boot/config.txt'
fi