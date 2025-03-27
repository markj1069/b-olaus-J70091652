#! /usr/bin/env bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 arg1 arg2"
    exit 1
fi

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "All arguments: $@"
echo "Number of arguments: $#"