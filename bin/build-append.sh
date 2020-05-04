#!/usr/bin/env bash

# Pull in the needed functions.
OLSLIB=/cygdrive/d/olaus-J70091652/lib/ols_lib  # We are running at project level directory.
source $OLSLIB/ols_begin.sh
source $OLSLIB/ols_err.sh
source $OLSLIB/filename.sh
source $OLSLIB/ols_setex.sh
source $OLSLIB/ols_end.sh

printf "%s\n" "Process $1 file."

# Validate arguments

if [[ -z "$1" ]]             # Filename Argument Required
then
    ols_err 7000 $EX_USAGE "ols-append: missing argument 1, filename"
else
    declare filename="$1"
fi
if [[ -z "$2" ]]             # Libname Argument Required
then
    ols_err 7000 $EX_USAGE "ols-append: missing argument 2, libname"
else
    declare libname="$2"
fi
if [[ ! -f "$filename" ]]    # Filename must exist
then
    ols_err 7000 $EX_MISSINGFILE  "ols-append: '$filename' is missing"
fi
if [[ ! -r "$filename" ]]
then
    ols_err 7000 $EX_NOINPUT  "ols-append: '$filename' is not readable"
fi
touch "$libname"
if [[ ! -w "$libname" ]]     # We need write permission for libname
then
    ols_err 7000 $EX_FATAL "ols-append: '$libname' is not writeable"
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
builtin printf "%s\n" "#-h- END   $timestamp $lb $fname" >> "$libname"

exit $EX_OK
