#!/bin/bash

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
  echo "FFmpeg is not installed. Please install FFmpeg and try again."
  exit 1
fi

# Loop through all .mkv files in the current directory
for input_file in *.mkv; do
  # Set the output file name and extension
  output_file="${input_file%.*}.mp4"

  # Convert the file using FFmpeg
  ffmpeg -i "$input_file" -c:v copy -c:a copy "$output_file"

  # Check if the conversion was successful
  if [ $? -eq 0 ]; then
    echo "Conversion complete. Output file: $output_file"
    # Delete the original .mkv file
    rm "$input_file"
  else
    echo "Conversion failed for file: $input_file"
  fi
done
