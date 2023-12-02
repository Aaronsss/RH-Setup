sed -i '/exit 0/d' /etc/rc.local
echo "while [ "'$(hostname -I)'" = '' ]; do
  sleep 2
done

cd /home/aaron/
if [ ! -d './RH-Setup-main' ]; then
  #wget https://github.com/Aaronsss/RH-Setup/archive/refs/heads/main.zip
  wget https://github.com/Aaronsss/RH-Setup/archive/refs/heads/simple-install.zip
  mv simple-install.zip main.zip
  unzip ./main.zip
  chmod 744 ./RH-Setup-main/rh-pi-setup.sh
  chown aaron -R ./RH-Setup-main/
  chgrp aaron -R ./RH-Setup-main/
  mkdir /boot/RH/
fi

su aaron -c '~/RH-Setup-main/rh-pi-setup.sh' >> /boot/RH/log.txt

exit 0" >> /etc/rc.local
