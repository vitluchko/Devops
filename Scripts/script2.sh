if [ $# -ne 2 ]; then
     echo "Usage: $0 <directory_path> <search_text>"
     exit 1
fi

directory_path=$1
search_text=$2

if [ ! -d "$directory_path" ]; then
     echo "Error $directory_path is not a directory."
     exit 1
fi

echo "Files containing '$search_text' in $directory_path:"
grep -rl "$search_text" "$directory_path"

