#!/bin/bash

echo "This will restore current folder ownership to $id:$id. Are you sure (Ctrl-C) to abort."
read dummy
sudo chown $id:$id -R .
echo "This will restore 644 for files and 755 for folders. Are you sure?"
read dummy
find . -exec restore_perm_single.sh {} \;
