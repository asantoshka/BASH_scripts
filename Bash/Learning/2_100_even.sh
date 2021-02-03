#!/bin/bash

VAL=0

for ((;;));
do
	(( VAL += 2 ))
	echo -n "$VAL "
	sleep 0.1
	if [ $VAL -eq 100  ];
	then
		echo ""
		exit
	fi


done

