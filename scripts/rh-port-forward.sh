# Enable Rotorhazard to be accessible on both port 5000 (default) and port 80
sudo apt-get --yes --force-yes install iptables
sudo iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-ports 5000
sudo iptables -A PREROUTING -t nat -p tcp --dport 8080 -j REDIRECT --to-ports 80
sudo iptables-save
sudo apt-get i--yes --force-yes nstall iptables-persistent