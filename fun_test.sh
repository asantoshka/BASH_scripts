#!/bin/bash

function na_me() {
	echo "Hello `whoami`"

	echo "LOCAL: $1"
}

na_me hello

echo "GLOBAL: $1"




