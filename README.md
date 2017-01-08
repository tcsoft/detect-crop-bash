# detect-crop-bash

This project came about as I started creating big lists of movies that I was encoding using Don Melton's fabulous scripts for [video_transcoding](https://github.com/donmelton/video_transcoding).

# PreReqs
This batch relies on you having the batch file setup that Don describes in his video-transcode release, as described here. <https://github.com/donmelton/video_transcoding#batch-control-for-transcode-video>.
We also rely on you having a `Rips` directory in your working directory. This is where I put all my subdirectories with the .mkv files in from MakeMKV. 
Once you have that set and follow that structure you can use this script to create the crop text files needed for that batch process to work.

# Instalation
- Copy the `setup.sh` & `det-crop.sh` into the work directory you set up in the PreReqs above
- Make sure they are executable. e.g. `# chmod 755 setup.sh` & `# chmod 755 det-crop.sh`

# Usage
- run `./setup.sh` to create the dc-queue.txt and the queue.txt files.
- Run the `# ./det-crop.sh` and the crop.txt files get created in the 'work/Crops' directory.
- If detect-crop spots any differences in the results from HandBrakeCLI and mplayer then the whole result is written to `Crops/>moviename>.txt` file so that you can decide which value you like best.
- Edit that file and leave only the crop value you want to use with the video_transcode in the next step 
- Now you can run the `./batch.sh` without having to create the crops.txt by hand

# Thanks
- Big thanks to Don Melton (@DonMelton) for the original scripts and hard work that has gone into creating this resource for us all.
- Thanks to Joe Hurley (@Rhapsodians) for pointing this out and explaining it all to me.

@TimsterC ;o)
