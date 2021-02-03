#!/bin/bash



TARGET=$1
curl -s https://crt.sh/?q=%25.$TARGET > /tmp/curl.out
cat /tmp/curl.out | grep $TARGET | grep TD | sed -e 's/<//g' | sed -e 's/>//g' | sed -e 's/TD//g' | sed -e 's/\///g' | sed -e 's/ //g' | sed -n '1!p' | sort -u > $TARGET-crt.txt
cat $TARGET-crt.txt
