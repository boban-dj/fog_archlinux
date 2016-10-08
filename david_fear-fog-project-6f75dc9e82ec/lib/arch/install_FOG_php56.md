



# Installing php56

Source older PHP packages: <https://aur.archlinux.org/packages/?O=0&K=php5&PP=50>

**source** AUR: <https://aur.archlinux.org/packages/php56/>

PLEASE READ : For those who are getting "unknown public key" errors, this is NOT caused by this package. It means GPG is not configured to fetch public keys automatically (which is normal by default)

Please read the instructions at
https://wiki.archlinux.org/index.php/Makepkg#Signature_checking

The easiest way to overcome this is to manually import the keys from a keyserver :
$ gpg --keyserver hkp://hkps.pool.sks-keyservers.net --recv-keys C2BF0BC433CFC8B3 FE857D9A90D90EC1

foxxx and I have been working together and this package can now be installed along PHP 7 from the official repos.

Everything has been moved into separate directories :

Config : /etc/php56
Extensions : /usr/lib/php56/modules
Binaries : /usr/bin/php56, /usr/bin/php56-cgi, /usr/bin/phar56, etc.

If you were previously using this as a replacement for php7, you'll have to adjust the new configuration files in /etc/php56/ to reflect the current ones in /etc/php/.

Apache module (provided by php56-apache) also has a specific configuration and CAN NOT cohabit with php7_module. Use php-fpm, fcgi or cgi if you need both versions.

The apache module is installed as libphp56.so, so you should use the following lines your httpd.conf :

# Load php 5.6 module
LoadModule php5_module modules/libphp56.so



*********************************************************************************
# Installing PHP56 packages
*********************************************************************************

First install `pacaur` AUR helper for archlinux

install script:

		cat pacaur_install.sh 
  
		#!/bin/sh
		# Run the following from a terminal to install pacaur:
		# $ curl -s https://gist.githubusercontent.com/Tadly/0e65d30f279a34c33e9b/raw/pacaur_install.sh | bash

		# Make sure our shiny new arch is up-to-date
		#echo "Checking for system updates..."
		#sudo pacman -Syu

		echo "Installing pacaur"

		# Create a tmp-working-dir an navigate into it
		mkdir -p /tmp/pacaur_install
		cd /tmp/pacaur_install

		# If you didn't install the "base-devil" group,
		# we'll need those.
		sudo pacman -S binutils make gcc fakeroot --noconfirm --needed

		# Install pacaur dependencies from arch repos
		sudo pacman -S expac yajl git --noconfirm --needed

		# Install "cower" from AUR
		curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
		makepkg PKGBUILD --skippgpcheck
		sudo pacman -U cower*.tar.xz --noconfirm

		# Install "pacaur" from AUR
		curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
		makepkg PKGBUILD
		sudo pacman -U pacaur*.tar.xz --noconfirm

		# Clean up...
		cd ~
		rm -r /tmp/pacaur_install

*********************************************************************************
Then install packages for php56

		$ pacaur -S php56 php56-gd php56-fpm php56-mssql php56-apache


		==> ERROR: One or more PGP signatures could not be verified!
		:: failed to verify php56-gd,php56-fpm,php56-mssql,php56-apache,php56 integrity
		boban@arch-anywhere ~ $ gpg --keyserver hkp://hkps.pool.sks-keyservers.net --recv-keys C2BF0BC433CFC8B3 FE857D9A90D90EC1

		gpg: key FE857D9A90D90EC1: public key "Julien Pauli <jpauli@php.net>" imported
		gpg: key C2BF0BC433CFC8B3: public key "Ferenc Kovacs <tyrael@php.net>" imported
		gpg: no ultimately trusted keys found
		gpg: Total number processed: 2
		gpg:               imported: 2


solve problem gpg-key by:

		==> ERROR: One or more PGP signatures could not be verified!
				:: failed to verify php56-gd,php56-fpm,php56-mssql,php56-apache,php56 integrity
				boban@arch-anywhere ~ $ gpg --keyserver hkp://hkps.pool.sks-keyservers.net --recv-keys C2BF0BC433CFC8B3 FE857D9A90D90EC1

				gpg: key FE857D9A90D90EC1: public key "Julien Pauli <jpauli@php.net>" imported
				gpg: key C2BF0BC433CFC8B3: public key "Ferenc Kovacs <tyrael@php.net>" imported
				gpg: no ultimately trusted keys found
				gpg: Total number processed: 2
				gpg:               imported: 2


**After install remarks**

You will need to add the following line after the existing LoadModule instructions in `/etc/httpd/conf/httpd.conf` :
	
		LoadModule php5_module modules/libphp56.so

Additionally, include this line at the end of `/etc/httpd/conf/httpd.conf` if you want .php files to be handled by php 5.6 :

		Include conf/extra/php56_module.conf

Be aware that ONLY A SINGLE PHP MODULE can be loaded into an Apache instance.
If you want php 5 and php 7 to cohabitate, you'll have to use another method such as `php-fpm`, `fcgi` or `cgi` for the other PHP version.



So we handle this by editing the functions.sh and config.sh from /lib/arch folder in the fog install directory

systemctl status httpd OK
systemcl status mysld OK

You must use the php.ini from the php56 package, this is located in /etc/php56/php.ini.
Ther you must uncomment the following as the functions.sh script does.

		sed -i 's/;extension=mysqli.so/extension=mysqli.so/g' /etc/php56/php.ini	



*********************************************************************************
# Install FOG
*********************************************************************************


Use edited folder from david_fear-fog-project-6f75dc9e82ec
see /lib/arch for the functions.sh and config.sh. 

sudo /bin/install_fog.sh

TODO:

-DHCPCD Archlinux!!!

- [N]Normal or [S]Storage install

	changed: david_fear-fog-project-6f75dc9e82ec/lib/common/input.sh

- backup the FOG database:

		cd ~;mysqldump --allow-keywords -x -v fog > fogbackup.sql

browse to http://localhost/fog/management/index.php

user:fog
password:password





