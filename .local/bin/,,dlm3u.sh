#!/bin/bash

echo "Enter m3u8 link:";
read link;

echo "Enter output filename:";
read filename;

#filename="${filename// /-}"

ffmpeg -i "$link" -bsf:a aac_adtstoasc -vcodec copy -c copy -crf 50 "$filename.mp4"
