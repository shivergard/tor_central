#!/bin/sh

# ------------------------------------------
# Create TOR Hidden Service
# ------------------------------------------
if [ ! -d /var/lib/tor/hidden_service ]
then
	echo "HiddenServiceDir /var/lib/tor/hidden_service/" >> /etc/tor/torrc
	echo "HiddenServicePort 22 127.0.0.1:22" >> /etc/tor/torrc
	
	mkdir /var/lib/tor/hidden_service/ 
	chown debian-tor:debian-tor /var/lib/tor/hidden_service/ 
	chmod 0700 /var/lib/tor/hidden_service/
fi

# ------------------------------------------
# Start TOR Service
# ------------------------------------------
service ssh start;
service tor start;

# ------------------------------------------
# Change Passwords
# ------------------------------------------
echo "${SSH_PASSOWRD}\n${SSH_PASSOWRD}"  |passwd tor
echo "${SSH_PASSOWRD}\n${SSH_PASSOWRD}"  |passwd root


# ------------------------------------------
# Add Envimental Setup for Aliases
# ------------------------------------------
echo 'Add Envimental Setup for Aliases'

if [ ! -f /root/.initbrc ]
then
	echo "Source Alias details"
    echo "source /.alias" >> /root/.bashrc
    echo "source /.alias" >> /home/tor/.bashrc  
    echo "Welcome to WAU system" >> /root/.initbrc
    echo "Welcome to WAU system : Report IN in 10 seconds" 
    sleep 10
    /report.sh init  
fi

# ------------------------------------------
# Infinite HostTail
# ------------------------------------------
#tail -F -n0 /etc/hosts

nc -k -l 5030 >&2 2>> /telnet.log