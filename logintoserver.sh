#!/bin/bash

if true ;
then
	sshpass -p password ssh sam@192.168.0.120 &> /dev/null 
	exit

else
	echo "Failed"
fi
