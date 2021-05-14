#!/usr/bin/env bash

# Process 2 required and other optional arguments

if [[ $# -eq 0 ]]            # Both required arguments are missing.
then
    echo "twenty-three: Missing required arguments 1–2, one and two"
    exit 1
fi
if [[ $# -eq 1 ]]            # Second required argument is missing.
then
    echo "twenty-three: Missing required argument 2, two"
    exit 1
fi
required1="$1"
required2="$2"
shift 2                      # Strip off the required arguments on the left.
if [[ $# -ge 1 ]]            # Are there optional arguemnts?
then
    optional="$*"            # Capture remaining arguments in optional.
else
    optional=""              # Set optional to the null string.
fi

echo "twenty-three: required1: '$required1'"
echo "twenty-three: required2: '$required2'"
echo "twenty-three:  optional: '$optional'"

exit 0
