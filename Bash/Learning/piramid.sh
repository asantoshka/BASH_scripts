#!/bin/bash

echo -n "Enter a number: "
read VAL

#COUNT=0

for (( i = 0; i <= $VAL; i++));
do
	for (( k = 0; k < $(( $VAL - i + 1 )); k++ ));
	do
		echo -n " " 
	done
	for (( j=0; j < $(( $i * 2 - 1 )); j++));
	do
		echo -n "*"
	done
	echo ""
	sleep 0.1
done

