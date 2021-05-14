#! /usr/bin/env bash

# Quick test of twenty-three script

echo twenty-three: No arguments
./twenty-three.sh

echo
echo twenty-three: One argument
./twenty-three.sh one

echo
echo twenty-three: Two arguments
./twenty-three.sh one two

echo
echo twenty-three: Three arguments
./twenty-three.sh one two three

echo
echo twenty-three: Four arguments
./twenty-three.sh one two three four

function f23()
{
if [[ $# -eq 0 ]]            # Both required arguments are missing.
then
    echo "f23: Missing required arguments 1–2, one and two"
    exit 1
fi
if [[ $# -eq 1 ]]            # Second required argument is missing.
then
    echo "f23: Missing required argument 2, two"
    exit 1
fi
local required1="$1"
local required2="$2"
shift 2                      # Strip off the required arguments on the left.
if [[ $# -ge 1 ]]            # Are there optional arguemnts?
then
    local optional="$*"      # Capture remaining arguments in optional.
else
    local optional=""        # Set optional to the null string.
fi

.
.
.

} # f23

#echo f23: No arguments
#f23
#
#echo
#echo f23: One argument
#f23 one

echo
echo f23: Two arguments
f23 one two

echo
echo f23: Three arguments
f23 one two three

echo
echo f23: Four arguments
f23 one two three four

