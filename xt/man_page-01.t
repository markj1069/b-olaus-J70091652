#! /usr/bin/env bash

source $OLSLIB

test_plan 3

podchecker bin/script_name.sh
EX=$?

is $EX $EX_OK podchecker "Does script_name pass the podchecker?"

bin/script_name.sh >/dev/null
EC=$?
is $EC $EX_USERABORT "ExitCode" "script_name has an exit code of $EC, expecting $EX_USERABORT."

pod2man --errors=die bin/script_name.sh >/dev/null
EC=$?
is "$EC" "$EX_OK" "ManGen" "Does Man page generation pass"

ols_wt_excode $EX_OK                  # Reset the exit code for prove.



