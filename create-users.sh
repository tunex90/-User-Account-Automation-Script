#!/bin/bash

# Log file
log_file="user_creation.log"

# Check if users.txt exists

if [ ! -f users.txt ]; then
        echo "Error: users.txt not found"
        exit 1
fi

# Read usernames from file

while read username
do
        #skip empty lines
        if [ -z "$username" ]; then
                continue
        fi

# Check if user already exists

if id "$username" &>/dev/null
then
        echo "User '$username' already exists" | tee -a $log_file
else
        # create user
        useradd "$username"

        # check if useradd was successful
        if [ $? -eq 0 ]; then

        # Generate randon number
        password=$RANDOM$RANDOM

        # Set password
        echo "$username:$password" | chpasswd

        #Force password change
        passwd -e "$username"

        echo "User '$username' created successfully. Temporary password: $password" | tee -a $log_file
else
        echo "Failed to create user '$username'" | tee -a $log_file
fi
fi
done <users.txt

echo "User creation process complete"
