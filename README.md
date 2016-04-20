# detect-crop-bash

This project came about as I started creating big lists of movies that I was encoding using Don Melton's fabulous scripts for video_transcoding.

It replies on you having the batch file setup that Don describes in his release here. https://github.com/donmelton/video_transcoding#batch-control-for-transcode-video
Once you have that set and follow that structure you can use this script to create the crop text files needed for that batch process to work.

# Instalation
Copy the 'det-crop.sh' into the work directory and make sure it's executable. e.g. # chmod 755 det-crop.sh

# Usage
- Take a copy of your 'queue.txt' (as described in Don's instructions) and call it 'dc-queue.txt' and keep it in the 'work' directory.
at your command prompt 
- Run the # ./det-crop.sh and the crop.txt files get created in the 'work/Crops' directory.
- Now you can run the 'batch.sh' without having to create the crops.txt by hand

# Thanks
Big thanks to Don Melton (@DonMelton) for the original scripts and hard work that has gone into creating this resource for us all.
Also thanks to Joe Hurley (@Rhapsodians) for pointing this out and explaining it all to me.

TimsterC ;o)
