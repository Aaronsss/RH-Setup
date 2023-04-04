echo "************* Enable Rotorhazard to be accessible on both port 5000 (default) and port 80 *************"
sudo iptables -C PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-ports 5000||sudo iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-ports 5000
sudo iptables -C PREROUTING -t nat -p tcp --dport 8080 -j REDIRECT --to-ports 80||sudo iptables -A PREROUTING -t nat -p tcp --dport 8080 -j REDIRECT --to-ports 80
sudo netfilter-persistent save


