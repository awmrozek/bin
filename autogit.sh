#!/bin/bash

echo " "
echo "Automatic commit of DOCUMENTS on $(date)"

cd git/DOCUMENTS
git add .
git commit -m "Autocommit"
git pull origin master
git push origin master
cd


