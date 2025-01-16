#!/bin/bash

# This script uses flock to prevent race conditions

file_to_process="my_file.txt"

# Create the file if it doesn't exist
if [ ! -f "$file_to_process" ]; then
  touch "$file_to_process"
fi

# Process the file in a loop
while true; do
  # Acquire an exclusive lock on the file
flock -x "$file_to_process" || exit 1
  # Check if the file exists (after acquiring the lock)
  if [ -f "$file_to_process" ]; then
    # Read the file
    content=$(cat "$file_to_process")
    # Process the content (replace with your actual processing logic)
    echo "Processing: $content"
    # Remove the file
    rm "$file_to_process"
  else
    echo "File not found, exiting."
    break
  fi
  # Release the lock
unflock "$file_to_process"
sleep 1
done