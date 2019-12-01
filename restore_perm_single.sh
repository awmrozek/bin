#!/bin/bash

if [ -f "$1" ]; then
	echo "$1 is a file";
	chmod 644 "$1"
else
	echo "$1 is a folder";
	chmod 755 "$1"
fi
