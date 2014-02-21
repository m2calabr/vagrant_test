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

# Tools
apt-get install -y php5-curl php5-mcrypt php5-gd php-pear php5-xdebug php5-intl php5-dev



# php.ini
# Setting the timezone
PHP_TIMEZONE="Europe/Helsinki"
sed 's#;date.timezone\([[:space:]]*\)=\([[:space:]]*\)*#date.timezone\1=\2\"'"$PHP_TIMEZONE"'\"#g' /etc/php5/apache2/php.ini > /etc/php5/apache2/php.ini.tmp
mv /etc/php5/apache2/php.ini.tmp /etc/php5/apache2/php.ini
sed 's#;date.timezone\([[:space:]]*\)=\([[:space:]]*\)*#date.timezone\1=\2\"'"$PHP_TIMEZONE"'\"#g' /etc/php5/cli/php.ini > /etc/php5/cli/php.ini.tmp
mv /etc/php5/cli/php.ini.tmp /etc/php5/cli/php.ini
# Showing error messages
sed 's#display_errors = Off#display_errors = On#g' /etc/php5/apache2/php.ini > /etc/php5/apache2/php.ini.tmp
mv /etc/php5/apache2/php.ini.tmp /etc/php5/apache2/php.ini
sed 's#display_startup_errors = Off#display_startup_errors = On#g' /etc/php5/apache2/php.ini > /etc/php5/apache2/php.ini.tmp
mv /etc/php5/apache2/php.ini.tmp /etc/php5/apache2/php.ini
sed 's#error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT#error_reporting = E_ALL#g' /etc/php5/apache2/php.ini > /etc/php5/apache2/php.ini.tmp
mv /etc/php5/apache2/php.ini.tmp /etc/php5/apache2/php.ini

# MONGO
# ------------------------------------------------
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo service mongodb start # Is this needed?

# MongoDB driver, has to be after pear install
sudo apt-get install -y build-essential
sudo pecl install mongo
sudo sed -i '$ a\extension=mongo.so' /etc/php5/apache2/php.ini


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
