#!/usr/bin/env bash

#############################################################################
##                                                                         ##
##  det-crop.sh - Bash Scrip to create crop.txt files from dc-queue.txt    ##
##  For use with Don Metlon's batch.sh for movie encoding                  ##
##                                                                         ##
##  Copyright (c)2016 - Tim Clark - TC Soft Consulting Limited             ##
##  Portions Copyright (c)2013-2016 - Don Melton                           ##
##  Issued under an MIT license                                            ##
##                                                                         ##
#############################################################################

readonly work="$(cd "$(dirname "$0")" && pwd)"
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
	echo crop_return = "$crop_return"
	
	zero_crop="0:0:0:0"
	
	if [[ $crop_return = $zero_crop ]]; then
		echo nothing to 'do' for "$crop_file"
	else	
		echo Writing to "$crop_file"
		echo "$crop_return" > "$crop_file"
	fi
	
    sed -i '' 1d tempcrop.txt
    input="$(sed -n 1p "$queue")"

done