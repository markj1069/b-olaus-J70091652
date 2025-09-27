#! /usr/bin/env bash

source $OLSLIB

test_plan 1


bin/script_name.sh >/dev/null
EC=$?
is $EC $EX_USERABORT "ExitCode" "script_name has an exit code of $EC, expecting $EX_USERABORT."




