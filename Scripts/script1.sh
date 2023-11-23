#!/bin/bash

if [ $# -lt 2 ]; then
     echo "Usage: $0 <directory_path> <file_extension1> [<file_extension2> ...]"
     exit 1
fi

directory_path=$1
shift

if [ ! -d "$directory_path" ]; then
     echo "Error $directory_path is not a directory."
     exit 1
fi

echo "Files with extension $@ in $directory_path:"
for ext in "$@"; do
    find "$directory_path" -maxdepth 1 -type f -name "*.$ext"
done

