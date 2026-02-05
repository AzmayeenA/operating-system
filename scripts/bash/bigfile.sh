#!/bin/bash

# Check if a filename was provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILE=$1
MAX_SIZE=1048576  # 1 MB in bytes

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo "File does not exist."
    exit 1
fi

FILE_SIZE=$(stat -c %s "$FILE")

if [ $FILE_SIZE -gt $MAX_SIZE ]; then
    echo "Warning: File is too large"
else
    echo "File size is within limits."
fi

