#!/bin/sh

for var in "$@"
do
  ffmpeg -i "$var" -acodec aac -vcodec libx264 "${var.%}.mp4"
done
