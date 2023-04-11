while [ "$(hostname -I)" = "" ]; do
  echo "No network detected: $(date)"
  sleep 2
done
echo "Network connection detected, running RH instal script $(date)"

echo "Instal username is: $USER"

cd ~
if [ -d "./RH-Setup-main" ];
then
    echo "Instal script already downloaded"
else
	echo "Downloading instal script"
    wget https://github.com/Aaronsss/RH-Setup/archive/refs/heads/main.zip
    unzip -q main.zip
    chmod 744 ./RH-Setup-main/rh-pi-setup.sh
fi

./RH-Setup-main/rh-pi-setup.sh
