echo "************* This will update the PI and install all required pacakages for RotorHazard *************"

sudo apt-get update

cd ~
# Prevent keyboard input being needed for iptables-persistant install
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
# install required packages
sudo apt-get --yes install python3-dev libffi-dev python3-smbus build-essential python3-pip git scons swig python3-rpi.gpio libjpeg-dev libopenjp2-7-dev iptables iptables-persistent python3-venv default-jdk-headless openjdk-8-jdk-headless

# Upgrade the pi to the latest versions of files
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
#sudo apt-get --yes upgrade
