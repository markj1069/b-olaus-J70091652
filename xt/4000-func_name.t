#! /usr/bin/env bash

source $OLSLIB

source bin/func_name.sh

test_plan 4

podchecker bin/func_name.sh
EX=$?

is $EX $EX_OK podchecker "Does func_name pass the podchecker?"

func=$(func_name)
EC=$?

is $EC $EX_USERABORT "ExitCode" "Does func_name return the expected exit code?"

is $func "func_name" "Return" "Does func_name return 'func_name'"

pod2man --errors=die bin/func_name.sh >/dev/null
EC=$?

is "$EC" "$EX_OK" "ManGen" "Does Man page generation pass"

ols_wt_excode $EX_OK                  # Reset the exit code for prove.
