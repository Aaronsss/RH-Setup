







# Enable SSH, SPI, I2C, and 'Serial Port'
# Disable 'Serial Console'
# For remote access to the desktop (using a program like RealVNC viewer), enable VNC


# Select 'Interface Options' and enable: SSH, SPI, and I2C
# Select 'Interface Options' | 'Serial Port', and configure:
# "login shell accessible serial": No
# "serial port hardware enabled": Yes


# Open a terminal window and enter:

# sudo nano /boot/config.txt
# Add the following lines to the end of the file:

# dtparam=i2c_baudrate=75000
# dtoverlay=miniuart-bt
# If the Raspberry Pi in use is a Pi 3 model or older (not a Pi 4) then also add this line:

# core_freq=250


# dtoverlay=act-led,gpio=24
# dtparam=act_led_trigger=heartbeat
# dtoverlay=gpio-shutdown,gpio_pin=18,debounce=5000