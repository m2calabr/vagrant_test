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


# PHP 5.x
# ------------------------------------------------
apt-get install -y php5 libapache2-mod-php5

# Install "add-apt-repository" binaries
apt-get install -y python-software-properties

# Drivers
apt-get install -y php5-cli
apt-get install -y php5-mysql


# Directories
# ------------------------------------------------
rm -rf /var/www
mkdir -p /vagrant/www
ln -fs /vagrant/www /var/www


# Finalize
# ------------------------------------------------

# Update repositories
apt-get update -y
#apt-get upgrade -y

# Finally, restart apache
sudo service apache2 restart
