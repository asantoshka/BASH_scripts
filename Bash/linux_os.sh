#!/bin/bash

uname -a

#LSB stands for Linux Standard Base and executing this command will give you more OS specific information.
lsb_release -a
cat /etc/os-release
cat /proc/version

#dmesg is a command used to examine and display messages from the kernel and the
dmesg | grep linux 