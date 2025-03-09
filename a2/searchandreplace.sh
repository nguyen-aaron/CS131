#!/bin/bash

# If user does not input exactly three arguments, show proper usage
if [ "$#" -ne 3 ]; then
    echo "Usage: searchandreplace <directory> <old_string> <new_string>"
    echo "Example: searchandreplace /path/to/files 'string1' 'string2'"
    exit 1
fi

# Set variables
DIRECTORY=$1
OLD_STRING=$2
NEW_STRING=$3

# Ensure that directory is valid
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory $DIRECTORY does not exist."
    exit 1
fi

script_name=$(basename "$0")

# Find all files in the specified directory and execute sed command for string replacement
find "$DIRECTORY" -type f ! -name "$script_name" -exec bash -c '
    # For each file, perform string replacement and count the occurrences
    count=$(grep -o "$1" "$0" | wc -l)
    
    if [ "$count" -gt 0 ]; then
        sed -i "s/$1/$2/g" "$0"
        echo "Replaced $count occurrences in $0"
    fi
' {} "$OLD_STRING" "$NEW_STRING" \;

echo "Finished replacing '$OLD_STRING' with '$NEW_STRING'"

