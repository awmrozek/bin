#!/bin/bash
[ -f /home/welw/.hourly.lock ] && exit;
touch /home/welw/.hourly.lock;

# Detox Videos 

cd Video
detox *

rm /home/welw/.hourly.lock;
