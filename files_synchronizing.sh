#!/bin/bash
### The following script takes two files and ensures that the files are synced in each second

### Taking files locations from the user
echo "Enter the first file location: "
read first_file_name
echo "Enter the second file name: "
read second_file_name

### Checking if the given locations are correct
if [ ! -f "$first_file_name" ] | [ ! -f "$second_file_name" ]
then
	### if the locations are correct, the condition is going to be escaped
	### but if the locations are not correct, the script will be terminated
	echo "Problem with files"
	exit
fi

### Going to copy the newly added content to the first_file to the second_file
### This process will be continued till the user terminates it
while true 
do
	### diff command is going to check for the difference between two files

	### tail command in here is going to delete the first line of the output,
	### since it contains the required lines to be changed to match the destination file
	### in order to be identical 

	### sed command is going to remove '< ' added to each line as a result of diff command 
	diff $first_file_name $second_file_name | tail -n +2 | sed 's/< //' > $second_file_name
	sleep 1
done


