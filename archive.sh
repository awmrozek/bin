#!/bin/bash

OUTPUT="$(echo $1 | sed -e 's/\ /_/g' | sed -e 's/\///g').tar.bz2"
echo "Output to: $OUTPUT"
BASENAME="$(basename $OUTPUT)"
echo "Creating archive $OUTPUT"
tar -cjf "$OUTPUT" "$1"

echo "Size report summary:"
echo "---------------------"
du -h "$1" 2>&1 | tail -n 1
du -h "$OUTPUT"
echo "---------------------"
echo ""

echo "Remove original directory"
echo "========================="
echo "Will remove original directory. Would you like that?"
read decision 

if [[ "$decision" == "y" ]]; then
	echo "Removing original directory"
	rm -rf "$1"
else
	echo "Leaving original directory. Are you sure that you would like things to be this way?";
fi

echo "Move to archive"
echo "==============="
echo "Archive name: $BASENAME";
echo "File detection: "
file "$BASENAME"
echo ""
echo "Would you like to move the archive to backup/ directory?"
read decision

if [[ "$decision" == "y" ]]; then
	echo "Moving archive file to ~/backup/";
	mv "$BASENAME" ~/backup
fi

