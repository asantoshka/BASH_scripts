#!/bin/bash
echo -n "Your First name :"
read FNAME

echo -n "Your Last name :"
read LNAME

FUNAME=$FNAME" "$LNAME

echo "Hello "$FUNAME
