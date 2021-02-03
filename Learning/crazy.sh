#!/bin/bash

TEMP=$(echo $(date +"%T%m%d") | sed 's/ /_/g' | tr -d ":" )
echo $TEMP
mkdir $TEMP
cd $TEMP

for (( i = 0; i < 10; i++));
do
	FNAME=$(echo $RANDOM | sha1sum | tr -d "-")
	echo $FNAME
	mkdir $FNAME
	cd $FNAME
	touch $RANDOM
	cd ..
done

