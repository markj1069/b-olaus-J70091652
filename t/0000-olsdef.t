#! /usr/bin/env bash

# Does olaus_def load its global variables correctly.
# Simulate TAP until.

printf '%s\n' '1..4'
RC=$EX_OK

if [[ -z "$OLSDEF" ]]
then
    printf '%s\n' 'ok 1 - OLSDEF undefined before source command'
else
    printf '%s\n' 'not ok 1 - OLSDEF defined before source command'
    RC=$EX_ERROR
fi
if [[ -z "$TRUE" ]]
then
    printf '%s\n' 'ok 2 - Olaus varables undefined before source command'
else
    printf '%s\n' 'not ok 2 - Olaus varables defined before source command'
    RC=$EX_ERROR
fi

source ../lib/olaus/olaus_def.sh

if [[ -z "$OLSDEF" ]]
then
    printf '%s\n' 'not ok 3 - OLSDEF undefined after source command'
    RC=$EX_ERROR
else
    printf '%s\n' 'ok 3 - OLSDEF defined after source command'
fi
if [[ -z "$TRUE" ]]
then
    printf '%s\n' 'not 4 - Olaus varables undefined after source command'
    RC=$EX_ERROR
else
    printf '%s\n' 'ok 4 - Olaus varibles defined after source command'

fi

exit $RC
