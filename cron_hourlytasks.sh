#!/bin/bash
cd /home/amr

echo "Capturing https://kamera.etf.nu/out.jpg at $(date)"

mkdir -p /home/amr/ETF_bigbrother/
wget https://kamera.etf.nu/out.jpg -O "/home/amr/ETF_bigbrother/$(date).jpg"
wget https://kamera.etf.nu/mek.jpg -O "/home/amr/ETF_bigbrother/$(date)-mek.jpg"
