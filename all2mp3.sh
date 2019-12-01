#!/bin/bash

for x in *.opus *.mkv; do
	ffmpeg -i "$x" -acodec libmp3lame -ab 96k "$x.mp3";
	if [ -f "$x" ]; then
		mkdir -p ~/garbage
		mv "$x" ~/garbage
	fi
done
