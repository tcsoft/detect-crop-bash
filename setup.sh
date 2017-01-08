#!/usr/bin/env bash

#############################################################################
##                                                                         ##
##  setup.sh - Bash Scrip to create crop.txt files from dc-queue.txt       ##
##  For use with Tim Clark's det-crop.sh and                               ##
##  Don Metlon's batch.sh for movie encoding                               ##
##                                                                         ##
##  Copyright (c)2017 - Tim Clark - TC Soft Consulting Limited             ##
##  Portions Copyright (c)2013-2017 - Don Melton                           ##
##  Issued under an MIT license                                            ##
##                                                                         ##
##  Version 0.1 07-Jan-2017                                                ##
##          Initial release                                                ##
##                                                                         ##
#############################################################################

echo "ignore the next two errors, they are not errors and this has worked. Honestly ;o)"
find -f Rips/* [.mkv] | grep -i mkv > dc-queue.txt
find -f Rips/* [.mkv] | grep -i mkv > queue.txt
echo 
echo "Written movies to crop and rip to dc-queue.txt and queue.txt"
echo 
echo "Next step is to run ./det-crop.sh and have it detect the cropping parameters"
echo 
echo "If any give errors, then we will run detect-crop manually and write the results to the crop file."
echo "You can then edit the crop file and decide which crop value to leave in the file before you encode."
echo 
echo "The last step is to run ./batch.sh to encode the movies to .mp4"
echo 
