#!/bin/bash
LOCK="/home/welw/.my-ffmpeg.lock"
while [[ -f "$LOCK" ]]; do
	echo "Waiting for lock release";
	sleep 1;
done

[ -f "$LOCK" ] && exit 35; # LOCK error

touch $LOCK;
echo "$PPID" >> $LOCK;

SIZE="320x240"
NAME="lofi/$1-$SIZE.wmv"
NAME_MP3="lofi/$1.mp3"
[ -f "$NAME" ] && exit 17; # File exists error

[ -d lofi ] || mkdir -p lofi;
echo "Converting to: $NAME";
ffmpeg -i "$1" -vcodec wmv2 -s $SIZE -acodec wmav2 "$NAME";
ffmpeg -i "$1" -acodec libmp3lame "$NAME_MP3";

echo "Removing lock file";
rm $LOCK;
