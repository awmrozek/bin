#!/bin/bash
echo "Enter output name: "
read n
pip install --upgrade --user youtube-dl
youtube-dl  "$1" -o - > file.bin 
ffmpeg -i "file.bin" -acodec libmp3lame -ab 192k "$n.mp3"
rm file.bin
