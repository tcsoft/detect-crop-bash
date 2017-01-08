#!/usr/bin/env bash

#############################################################################
##                                                                         ##
##  det-crop.sh - Bash Scrip to create crop.txt files from dc-queue.txt    ##
##  For use with Don Metlon's batch.sh for movie encoding                  ##
##                                                                         ##
##  Copyright (c)2016 - Tim Clark - TC Soft Consulting Limited             ##
##  Portions Copyright (c)2013-2017 - Don Melton                           ##
##  Issued under an MIT license                                            ##
##                                                                         ##
##  Version 0.3 07-Jan-2017                                                ##
##          Added error checking for mismatches and write everything       ##
##			to the Crops/<moviename>.txt file                              ##
##  Version 0.2 07-Jan-2017                                                ##
##          Bugfix for mismatch of $crop_return                            ##
##  Version 0.1 20-Apr-2016                                                ##
##          Initial release                                                ##
##                                                                         ##
#############################################################################

readonly work="$(cd "$(dirname "$0")" && pwd)"
readonly rips="$work/rips"
readonly queue="$work/dc-queue.txt"
readonly crops="$work/Crops"

input="$(sed -n 1p "$queue")"

while [ "$input" ]; do
    title_name="$(basename "$input" | sed 's/\.[^.]*$//')"
    crop_file="$crops/${title_name}.txt"

	sed -i '' 1d "$queue" || exit 1

# This version of detect-crop only displays the crop value e.g. 72:72:0:0 which is all we need in the file.
# Since the original batch.sh had the code to find the cropfile.txt we just repurpose that for the output redirect. 
	detect-crop --values-only --quiet "$input" > tempcrop.txt
	crop_return="$(sed -n 1p tempcrop.txt)"
	echo crop_return = \""$crop_return"\"
	
	zero_crop="0:0:0:0"
	different_crop=""
	
	if [[ $crop_return = $zero_crop ]]; then
		echo Nothing to 'do' for "$crop_file"

	elif [[ $crop_return = $different_crop ]]; then
			echo Ther is a difference in the crop return values from HandBrakeCLI and mplayer
			echo Running detect-crop full mode so you can  chose what you want to do
			echo Writing results to "$crop_file"
			detect-crop "$input" > "$crop_file" 

	else	
		echo Writing to "$crop_file"
		echo "$crop_return" > "$crop_file"
	fi
	
    sed -i '' 1d tempcrop.txt
    input="$(sed -n 1p "$queue")"

done