#!/usr/bin/env bash

TZ="Europe/Berlin";


# Really dirty work around to fix the annoying "stdin is not a tty" error
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile;


# Set a timezone
if [[ `grep -Ri "$TZ"` ]]; then
    echo "$TZ" | sudo tee /etc/timezone
    dpkg-reconfigure --frontend noninteractive tzdata
fi


# make sure apt-cache is available
if [[ ! -f "/apt-get-run" ]]; then
    sudo apt-get update && sudo touch "/apt-get-run";
fi


# is required to work with PPA's
if [[ `dpkg -s software-properties-common` ]]; then
    apt-get -y install software-properties-common
fi


usermod -a -G www-data vagrant
id vagrant
groups vagrant


source "/vagrant/scripts/update-ansible.sh"
