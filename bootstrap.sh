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

# Directories
# ------------------------------------------------
rm -rf /var/www
mkdir -p /vagrant/www
ln -fs /vagrant/www /var/www