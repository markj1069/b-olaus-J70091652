#!/usr/bin/env bash

# Pull in the needed functions.

PGMID=OLSBLD
source lib/ols_lib/filename.sh
source lib/ols_lib/olserr.sh 

# Validate arguments

if [[ -z "$1" ]]             # Filename Argument Required
then
    olserr 7000 $EX_USAGE "build-append: missing argument 1, filename"
else
    declare filename="$1"
fi
if [[ -z "$2" ]]             # Libname Argument Required
then
    olserr 7000 $EX_USAGE "build-append: missing argument 2, libname"
else
    declare libname="$2"
fi
if [[ ! -f "$filename" ]]    # Filename must exist
then
    olserr 7000 $EX_MISSINGFILE  "build-append: '$filename' is missing"
fi
if [[ ! -r "$filename" ]]
then
    olserr 7000 $EX_NOINPUT  "build-append: '$filename' is not readable"
fi
if [[ ! -w "$libname" ]]     # We need write permission for libname
then
    olserr 7000 $EX_FATAL "build-append: '$libname' is not writeable"
fi

fname=$( filename "$filename" )

# Get the modification time for this filename
timestamp=$( stat --printf="%y" "$filename" )
timestamp=${timestamp/ /T}   # Insert a "T" in the timestamp.
timestamp=${timestamp:0:19}  # Strip off the nanoseconds.


# How big is the filename
# wc returns #lines #bytes filename
lbf=$( wc --lines --bytes "$filename" )
lb=${lbf% *}                 # Strip off the filename from the wc answer.

# Write shell library member header
builtin printf "%s\n" "#-h- BEGIN $timestamp $lb $fname" >> "$libname"
/usr/bin/cat   "$filename"                               >> "$libname"
builtin printf "%s\n" "#-e- END   $timestamp $lb $fname" >> "$libname"

exit $EX_OK
