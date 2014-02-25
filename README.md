
Testing Vagrant setup
=====================


Usage
-----
* Install Virtualbox
* Install Vagrant
* Clone this repository
* Open command line on it's directory, command
  * `vagrant up --provision`

After startup, the www-directory is available at `http://127.0.0.1:4567/`

Note that `ssh vagrant` will take you to `/home/vagrant`, whereas the shared directory is at `/vagrant`.

Done
----
* Apache2
* PHP5.x, Pear, xdebug, mcrypt, some other tools
* MongoDB & PHP driver
* Ruby & Rubygems
* SASS & Compass
* MySQL

Todo
----

* Composer
* Parameters
* Test compass, mongo etc.

* Sync database(s) ?

* Node.js & npm ?
** https://github.com/semmypurewal/node-dev-bootstrap

* 64-bit Ubuntu & Mongo

Sources
-------

* https://github.com/Divi/vagrant-bootstrap
* http://askubuntu.com/questions/109404/how-do-i-install-latest-php-in-supported-ubuntu-versions-like-5-4-x-in-ubuntu-1

