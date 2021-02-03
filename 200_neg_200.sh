#!/bin/bash

COUNT=200

while [ $COUNT -gt -201 ];
do
	echo -n "$COUNT "
	sleep 0
	(( COUNT -= 1 ))
	RES=$( expr $COUNT % 10 )
	if [ $RES -eq 0 ];
	then
		echo ""
	fi
done
echo ""
