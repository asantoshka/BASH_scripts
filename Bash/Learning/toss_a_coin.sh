#!/bin/bash

if [ $(($RANDOM % 2)) == 1 ]
then
    echo "You got Head"
else
    echo "You got Tail"
fi