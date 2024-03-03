# Created by user echadbourne
# Requirements:
# creates a new ssh user using the $l parameter
# add a public key from the local repo or curled from the remote repo
# Removed root ability to ssh in
# Created by echadbourne

#!/bin/bash

#Check for username being provided as parameter
if [ $# -ne 1 ]; then
	echo "Usage $0 <username>"
	exit 1
fi

username="$1"

# Create a user that uses passwordless authentication

sudo useradd -m -d /home/"$username" -s /bin/bash "$username"
sudo mkdir -p /home/"$username"/.ssh
sudo cp /home/echadbourne/ChadbourneSYS-265/linux/public-keys/id_rsa.pub /home/"$username"/.ssh/authorized_keys
sudo chmod 700 /home/"$username"/.ssh
sudo chmod 600 /home/"$username"/.ssh/authorized_keys
sudo chown -R "$username:$username" /home/"$username"/.ssh

echo "User '$username' has been created passwordless with the associated key"
