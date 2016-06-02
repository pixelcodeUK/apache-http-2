#!/usr/bin/env bash
echo "Installing latest software PPA"
echo "deb http://ppa.launchpad.net/ondrej/apache2/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/ondrej/apache2/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list

sudo apt-get update

echo "Installing openSSL 1.0.2h"
sudo apt-get install openssl=1.0.2h-1+deb.sury.org~xenial+1 -y --allow-unauthenticated

#echo "Installing nghttp"
#sudo apt-get install nghttp2 -y

echo "Installing Apache version 2.4.20"
sudo apt-get install apache2=2.4.20-1+deb.sury.org~xenial+4 -y --allow-unauthenticated

echo "Enabling HTTP2.0 and SSL"
sudo a2enmod http2 ssl headers rewrite
sudo /etc/init.d/apache2 restart

echo "Modifying the Apache config"

cat /vagrant/apache2_append.conf | sudo tee -a /etc/apache2/apache2.conf
sudo cp /vagrant/000-default.conf /etc/apache2/sites-available/

#copy over pre-built files
sudo cp -r /vagrant/shop/build/unbundled/ /var/www/html/

echo "Installing HTTPS certificates"
sudo mkdir /etc/apache2/ssl/
cd /etc/apache2/ssl/

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt -subj "/CN=localhost"

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
source ~/.nvm/nvm.sh

echo "Installing Node 5.2.0"
nvm install 5.2.0

#npm install -g bower
#npm install -g polymer-cli

echo "Building Polymer Shop"

cd /home/vagrant/

git clone https://github.com/Polymer/shop.git
cd shop

#bower install
#polymer build

sudo /etc/init.d/apache2 restart
