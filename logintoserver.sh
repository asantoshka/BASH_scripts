#!/bin/bash

if true ;
then
	sshpass -p aska012001 ssh sam@192.168.0.120 &> /dev/null | cat /etc/passwd
	exit

else
	echo "Failed"
fi
