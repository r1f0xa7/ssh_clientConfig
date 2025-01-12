#!/bin/bash

echo "Welcome to the SSH Config Generator!"

# Ask for Host Name
read -p "Enter the Host alias (e.g., myserver): " host
read -p "Enter the HostName (e.g., example.com): " hostname
read -p "Enter the User (e.g., username): " user
read -p "Enter the Port (default: 22): " port
port=${port:-22}

# Ask for advanced settings
read -p "Do you want to specify an IdentityFile (y/n): " identityfile_answer
if [ "$identityfile_answer" == "y" ]; then
    read -p "Enter the path to the identity file: " identityfile
fi

read -p "Do you want to enable KeepAlive (y/n): " tcp_keepalive
if [ "$tcp_keepalive" == "y" ]; then
    keepalive="TCPKeepAlive yes"
else
    keepalive="TCPKeepAlive no"
fi

# Create SSH config file
config_file="$HOME/.ssh/config"

echo "Host $host" >> $config_file
echo "    HostName $hostname" >> $config_file
echo "    User $user" >> $config_file
echo "    Port $port" >> $config_file
[ -n "$identityfile" ] && echo "    IdentityFile $identityfile" >> $config_file
echo "    $keepalive" >> $config_file

echo "SSH config for $host created successfully!"
