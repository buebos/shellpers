#!/bin/bash

# Resolve the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check for ffmpeg and run installer if not found
if ! command -v ffmpeg &> /dev/null; then
    echo "FFmpeg not found. Trying to run install-ffmpeg.sh..."
    INSTALL_SCRIPT="$SCRIPT_DIR/install-ffmpeg.sh"
    if [ -f "$INSTALL_SCRIPT" ]; then
        bash "$INSTALL_SCRIPT"
    else
        echo "Error: install-ffmpeg.sh not found in $SCRIPT_DIR"
    fi
    exit 1
fi

echo "Note: On macOS, you may need to drag and drop the file into the terminal to bypass permission issues."

# Ask user for input/output
read -p "Enter the input video file path: " input
read -p "Enter the output video file path: " output

# Sanitize and resolve paths
input=$(echo "$input" | xargs)
output=$(echo "$output" | xargs)
input=$(eval echo "$input")
output=$(eval echo "$output")

# Validate input file
if [ ! -f "$input" ]; then
    echo "Error: Input file does not exist: $input"
    exit 1
fi

# Validate output directory
output_dir=$(dirname "$output")
if [ ! -d "$output_dir" ]; then
    echo "Error: Output directory does not exist: $output_dir"
    exit 1
fi

# Perform conversion
ffmpeg -i "$input" -vcodec h264_videotoolbox -b:v 4000k -acodec aac -b:a 128k "$output"
