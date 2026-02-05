#!/bin/bash

for file in *.txt; do
    mv "$file" "OLD_$file"
done

echo "All .txt files have been renamed."

