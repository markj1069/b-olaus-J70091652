#!/bin/bash

# If files are provided, read them; otherwise, read from STDIN
if [ $# -gt 0 ]; then
    for file in "$@"; do
        while read -r line; do
            echo "From file $file: $line"
        done < "$file"
    done
else
    while read -r line; do
        echo "From STDIN: $line"
    done
fi
