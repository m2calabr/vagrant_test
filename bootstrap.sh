#!/usr/bin/env bash

source /vagrant/bootstrap_parameters.sh

apt-get update

# APACHE
# ------
# Prevent from existing custom "000-default.conf"
rm -rf /etc/apache2/sites-available/000-default.conf
apt-get install -y apache2
# Add ServerName to httpd.conf for localhost
echo "ServerName localhost" > /etc/apache2/httpd.conf
# Enable "mod_rewrite"
a2enmod rewrite
# Finally, restart apache
service apache2 restart

# DIRECTORIES
# -----------
rm -rf /var/www
mkdir -p /vagrant/www
ln -fs /vagrant/www /var/www