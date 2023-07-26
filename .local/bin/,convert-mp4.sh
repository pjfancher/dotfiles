#!/bin/bash

# Check if an argument was provided
if [ -z "$1" ]; then
  echo "Usage: $0 input.mkv"
  exit 1
fi

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
  echo "FFmpeg is not installed. Please install FFmpeg and try again."
  exit 1
fi

# Get the input file name and extension
input_file="$1"
input_extension="${input_file##*.}"

# Check if the input file is an MKV file
if [ "$input_extension" != "mkv" ]; then
  echo "Input file must be an MKV file."
  exit 1
fi

# Set the output file name and extension
output_file="${input_file%.*}.mp4"

# Convert the file using FFmpeg
ffmpeg -i "$input_file" -c:v copy -c:a copy "$output_file"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
  echo "Conversion complete. Output file: $output_file"
else
  echo "Conversion failed."
fi
