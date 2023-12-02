echo "************* Download latest stable Rotorhazard version *************"

INSTAL_DIR=~

# Download the latest version of RotorHazard
LOCATION=$(curl -s https://api.github.com/repos/RotorHazard/RotorHazard/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/RotorHazard/RotorHazard/archive/" substr($2, 2, length($2)-3) ".zip"}') \
; curl -L -o $INSTAL_DIR/temp.zip $LOCATION

# Save a copy of the old RotorHazard files
mv $INSTAL_DIR/RotorHazard $INSTAL_DIR/RotorHazard.old

# Unzip what was just downloaded
unzip -q -d $INSTAL_DIR/ $INSTAL_DIR/temp.zip

# Find the version of the software
LOCATION=$(curl -s https://api.github.com/repos/RotorHazard/RotorHazard/releases/latest \
| grep "tag_name" \
| awk '{print substr($2, 2, length($2)-3) }') \
;
VERSION="${LOCATION/v/-}" 

# Rename the folder to RotorHazard (remove version no.)
mv $INSTAL_DIR/RotorHazard$VERSION $INSTAL_DIR/RotorHazard/

# Delete temp.zip
rm $INSTAL_DIR/temp.zip

# Copy over the old settings if they exsist
cp $INSTAL_DIR/RotorHazard.old/src/server/config.json $INSTAL_DIR/RotorHazard/src/server/
cp $INSTAL_DIR/RotorHazard.old/src/server/database.db $INSTAL_DIR/RotorHazard/src/server/
cp -R $INSTAL_DIR/RotorHazard.old/src/server/static/user/ $INSTAL_DIR/RotorHazard/src/server/static/user/

#Update python requirements
cd ~
python -m venv .venv
VIRTUAL_ENV_DISABLE_PROMPT=1
source .venv/bin/activate
cd $INSTAL_DIR/RotorHazard/src/server
pip install -r requirements.txt
#sudo pip install --upgrade --no-cache-dir -r $INSTAL_DIR/RotorHazard/src/server/requirements.txt

# Update admin password on new installs and print connect info
FILE=$INSTAL_DIR/RotorHazard/src/server/config.json
if [ -f "$FILE" ]; then
    echo "$FILE already exists."
else 
    echo "$FILE does not exist."
    random=$(openssl rand -hex 3)

    cp $INSTAL_DIR/RotorHazard/src/server/config-dist.json $FILE
    sed -i -e 's/rotorhazard/'$random'/g' $FILE
    sed -i -e 's/admin/'$USER'/g' $FILE

    echo "To login to rotorhazard go to" $(hostname -I) "in a browser"
    echo "username = "$USER
    echo "password = "$random
fi

sudo cp $INSTAL_DIR/RotorHazard/src/server/config.json /boot/RH/RHconfig.json




