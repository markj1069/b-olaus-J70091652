#! /usr/bin/env bash

source $OLSLIB

test_plan 2

podchecker bin/ols_man.pod
EX=$?

is $EX $EX_OK podchecker "Does script_name pass the podchecker?"

pod2man --errors=die bin/ols_man.pod >/dev/null
EC=$?
is "$EC" "$EX_OK" "ManGen" "Does Man page generation pass"

ols_wt_excode $EX_OK                  # Reset the exit code for prove.




