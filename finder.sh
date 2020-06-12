#!/bin/bash

configPath=$(find "$(pwd -P)" -name "a3config")

#checks to make sure the file a3config exists

if [ -z $configPath ]; then
	echo "Error: a3config not found"; exit 1
fi
source $configPath
#check to make sure a3config is not empty
isempty=$(wc -l < $configPath)
if [ $isempty  -eq 0 ]; then
	echo "Error: a3config is empty"; exit 1
fi

#Counts characters in DIRNAME, EXTENSION and SHOW to make sure they're all non-empty strings
if [[ -z "$DIRNAME" ]] || [[ -z "$EXTENSION" ]]; then
	echo "Error DIRNAME and EXTENSION must be set"; exit 2
fi
#Check to see if DIRNAME exists
if [[ ! -d "$DIRNAME" ]]; then
	echo "Error directory $DIRNAME does not exist"; exit 3
fi

#Check if files with the extension exist by counting the number of lines returned
lines=$(find $DIRNAME -name "*$EXTENSION" | wc -l)
if [ $lines -eq 0 ]; then
	echo "Unable to locate files with the extension $EXTENSION in $DIRNAME"; exit 0

fi

#if show is true, the files are found and are cat'd line by line, else just prints the files found
if [ "$SHOW" == "true" ]; then
find $DIRNAME -name "*$EXTENSION" | while read line;
do echo "$line"
	cat "$line";
done; 
else
	find $DIRNAME -name "*$EXTENSION"
fi




