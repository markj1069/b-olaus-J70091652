#! /usr/bin/env bash

source $OLS_LIB

PGMID=OLS

test_result="$1"
test_name="$2"

if [[ $# -gt 2 ]]                            # Diagnostic message argument is optional.
    then
        shift 2
        diag="$@"
        ols_tap_print "$test_result" "$test_name" "$diag"
    else
        ols_tap_print "$test_result" "$test_name"
    fi

