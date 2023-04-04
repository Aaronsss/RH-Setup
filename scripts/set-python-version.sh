echo "************* Make sure default version of python is set *************"
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 1 # Add if statment for these two to stop the errors
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 2