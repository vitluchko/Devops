#!/bin/bash

while getopts "p:s:" opt; do
  case $opt in
    p)
      directory_path=$OPTARG
      ;;
    s)
      search_text=$OPTARG
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

if [ -z "$directory_path" ] || [ -z "$search_text" ]; then
     echo "Usage: $0 -p <directory_path> -s <search_text>"
     exit 1
fi

if [ ! -d "$directory_path" ]; then
     echo "Error $directory_path is not a directory."
     exit 1
fi

echo "Files containing '$search_text' in $directory_path:"
grep -rl "$search_text" "$directory_path"

