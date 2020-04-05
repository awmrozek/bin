#!/bin/bash
echo "Synchronization with A3 on $(date)"

echo "Git autopull"
cd git/DOCUMENTS
git pull origin master
git add .
git commit -m "Autosync from cron"
git push origin master
cd

echo "downloading master git repo from a3"
rsync -a a3:DOCUMENTS.git/ DOCUMENTS.git/

#detox videos
echo "Detox videos"
cd Video
detox *

