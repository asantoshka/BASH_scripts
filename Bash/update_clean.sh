#!/bin/bash

sudo du -sh /var/cache/apt/archives

sudo apt-get update 

sudo apt-get upgrade -y

sudo apt-get autoremove --purge

sudo apt-get clean

sudo sync; echo 3 > /proc/sys/vm/drop_caches
