echo "************* This will update the PI and install all required pacakages for RotorHazard *************"

sudo apt-get update

cd ~
# Prevent keyboard input being needed for iptables-persistant install
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
# install required packages
sudo apt-get --yes install python3-dev libffi-dev python3-smbus build-essential python3-pip git scons swig python3-rpi.gpio libjpeg-dev libopenjp2-7-dev iptables iptables-persistent

# Install additional LED options 
sudo pip install pillow

# Instal Java
# For Raspberry Pi 3 or 4 only
sudo apt-get --yes install default-jdk-headless
# For Older Pi's
#sudo apt --yes --force-yes install openjdk-8-jdk-headless

# Instal firewall to re-route port 80 to 5000
#sudo apt-get --yes install iptables iptables-persistent

# Upgrade the pi to the latest versions of files
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
#sudo apt-get --yes upgrade
