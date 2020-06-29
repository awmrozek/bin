#!/bin/bash

#echo $1 | sed -e "s/\#//g" | sed -e "s/:/_/g" | sed -e "s/ /_/g"
OLDNAME="$1"
NEWNAME=`echo "$1" | tr "#:?|+" "_____"`

if [[ "$OLDNAME" != "$NEWNAME" ]]; then
	mv -- "$OLDNAME" "$NEWNAME"
	#echo "Would move $OLDNAME to $NEWNAME"
fi

