#!/bin/bash

directory_path=""
file_extensions=()

while getopts "p:e:" opt; do
  case $opt in
    p)
      directory_path=$OPTARG
      ;;
    e)
      file_extensions+=("$OPTARG")
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ -z "$directory_path" ] || [ ${#file_extensions[@]} -eq 0 ]; then
     echo "Usage: $0 -p <directory_path> -e <file_extension1> [-e <file_extension2> ...]"
     exit 1
fi

if [ ! -d "$directory_path" ]; then
     echo "Error $directory_path is not a directory."
     exit 1
fi

file_count=0

for ext in "${file_extensions[@]}"; do
     current_count=$(find "$directory_path" -maxdepth 1 -type f -name "*.$ext" | grep -c '.*')
     file_count=$((file_count + current_count))
done

echo "Number of files with extensions ${file_extensions[@]} in $directory_path: $file_count"

