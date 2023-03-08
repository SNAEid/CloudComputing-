#!/bin/bash

# Define variables
WEBSITE_DIR="/var/www/SimpleApp"
APACHE_CONF="/etc/apache2/sites-available/simpleApp.conf"
LOG_FILE="install_$(date +"%Y-%m-%d").log"
GITHUB_REPO="https://github.com/mkassaf/SimpleApacheApp.git"

# Log start of script
echo "[$(date)] Starting installation" >> $LOG_FILE

# Update packages and install apache2
echo "[$(date)] Updating packages and installing apache2" >> $LOG_FILE
sudo apt-get update >> $LOG_FILE
sudo apt-get install -y apache2 >> $LOG_FILE

# Remove old website directory and create new one
echo "[$(date)] Removing old website directory and creating new one" >> $LOG_FILE
sudo rm -rf $WEBSITE_DIR
sudo mkdir $WEBSITE_DIR

# Clone website code from GitHub repo
echo "[$(date)] Cloning website code from GitHub repo" >> $LOG_FILE
git clone $GITHUB_REPO $WEBSITE_DIR >> $LOG_FILE

# Move configuration file to apache2 sites-available directory
echo "[$(date)] Moving configuration file to apache2 sites-available directory" >> $LOG_FILE
sudo mv $WEBSITE_DIR/simpleApp.conf $APACHE_CONF

# Disable default apache2 config and enable new config
echo "[$(date)] Disabling default apache2 config and enabling new config" >> $LOG_FILE
sudo a2dissite 000-default >> $LOG_FILE
sudo a2ensite simpleApp >> $LOG_FILE

# Restart apache2 service
echo "[$(date)] Restarting apache2 service" >> $LOG_FILE
sudo systemctl restart apache2 >> $LOG_FILE

# Verify installation by checking the status code of the website
echo "[$(date)] Verifying installation by checking the status code of the website" >> $LOG_FILE
curl -Is http://localhost | head -n 1 >> $LOG_FILE

# Log end of script
echo "[$(date)] Installation complete" >> $LOG_FILE
