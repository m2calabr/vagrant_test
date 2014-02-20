#!/usr/bin/env bash

# ----------------------------------------
# https://github.com/Divi/VagrantBootstrap
# ----------------------------------------

# Include parameteres file
# ------------------------------------------------
source /vagrant/bootstrap_parameters.sh

# Update the box release repositories
# ------------------------------------------------
apt-get update

# APACHE
# ------------------------------------------------
apt-get install -y apache2
# Add ServerName to httpd.conf for localhost
echo "ServerName localhost" > /etc/apache2/httpd.conf
# Enable "mod_rewrite"
a2enmod rewrite
# Finally, restart apache
service apache2 restart


# PHP 5.x (last official release)
# See: https://launchpad.net/~ondrej/+archive/php5
# ------------------------------------------------
apt-get install -y php5 libapache2-mod-php5
# Install "add-apt-repository" binaries
apt-get install -y python-software-properties

apt-get install -y php5-cli
sudo apt-get install -y php5-mysql

# Install PHP 5.x
# Use "ppa:ondrej/php5-oldstable" for old and stable release
# add-apt-repository ppa:ondrej/php5
# Update repositories
apt-get update -y
apt-get upgrade -y
#apt-get install php5


# Directories
# ------------------------------------------------
rm -rf /var/www
mkdir -p /vagrant/www
ln -fs /vagrant/www /var/www