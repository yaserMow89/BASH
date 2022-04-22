#!/bin/bash


### This script is going to copy files over network

### Asks for file location on current System and check whether it exist or not
echo "Enter your file location: " 
read file_location 

if [ ! -f "$file_location" ]
then
	echo "The file does not exist"
	exit
fi


### Asks for Remote IP Address and pings the IP to know if it is reachable or not

echo "Please enter the IP of the host machine: "
read host_IP

if ping -c 1 $host_IP 1>/dev/null
then
	echo "The host is valid"
else
	echo "Host is not valid, exiting the program"
	exit
fi

### Asks for Remote Machine User Name
echo "Please enter the username of the remote machine: "
read remote_user_name

### Asks for Remote Machine directory in which you like to copy the file
echo "on which remote end direcotry you want to transfer the file to"
read read_dir

### Asks for the remote machine user password
echo "insert your password: "
read password

### Actual file uploading
echo "Uploading the file"
sshpass -p $password scp -v $file_location $remote_user_name@$host_IP:$read_dir
echo "File Upload completed"
