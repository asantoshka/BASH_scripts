#!/bin/bash

for ((;;))
do 
    echo "Lets get to know about the planets :)"
    echo "1. Mercury"
    echo "2. Venus"
    echo "3. Earth"
    echo "4. Mars"
    echo "5. Jupiter"
    echo "6. Saturn"
    echo "7. Urance"
    echo "8. Neptune"
    echo "9. Pluto"
    echo "0. Exit"
    echo -n "Enter the option : "
    read planet
    echo "================================"
    case "$planet" in

    0)
        break;;
    1)
        echo "Mercury is hot, but not too hot for ice";;
    2)
        echo "Venus does not have any moons, and we are not sure why.";;
    3)
        echo "The Planet where we live and we love";;
    4)  
        echo "Mars had a thicker atmosphere in the past.";;
    5) 
        echo "Jupiter is a great comet catcher.";;
    6) 
        echo "No one knows how old Saturn’s rings are";;
    7) 
        echo "Uranus is more stormy than we thought.";;
    8) 
        echo "Neptune has supersonic winds. ";;
    9) 
        echo "Pluto is the smallest planet or demi-planet";;
    *) 
        echo "Sorry we have only 9 planets... :(";;
    esac
    echo "================================"
done




