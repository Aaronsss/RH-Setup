if grep -Fxq "2" /boot/RH/RHInstalProgress.txt
then
    echo "$(date) RotorHazard has been installed, delete /boot/RH/RHInstalProgress.txt if you want the installer to run again"
    if [ -d "./RH-Setup-main" ];
    then
      rm -R ./RH-Setup-main
    fi
else

  while [ "$(hostname -I)" = "" ]; do
    echo "$(date) No network detected"
    sleep 2
  done
  echo "Network connection detected, running RH install script $(date)"

  echo "Install username is: $USER"

  cd ~
  if [ -d "./RH-Setup-main" ];
  then
      echo "Install script already downloaded"
  else
    echo "Downloading install script"
      wget https://github.com/Aaronsss/RH-Setup/archive/refs/heads/main.zip
      unzip -q main.zip
      chmod 744 ./RH-Setup-main/rh-pi-setup.sh
  fi

  ./RH-Setup-main/rh-pi-setup.sh

  fi
