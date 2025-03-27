#! /usr/bin/env bash


source $OLS_LIB/ols_begin.sh            # Include Olaus Bash Library Definitions
source $OLS_LIB/ols_wt_tstno.sh

printf '%s\n' '1..3'                    # Simulate tst_plan
RC=$EX_OK

if [ -n "$OLS_TSTFILE" ]; then
    printf "ok 1 - OLS_TSTFILE: $OLS_TSTFILE\n"
else
    printf "no ok 1 - OLSTST_FILE is the null string. mktemp fail.\n"
fi

# ols_wt_tstno 0

if [ -f "$OLS_TSTFILE" ]; then
    printf "ok 2 - OLS_TSTFILE exists.\n"
else
    printf "no ok 2 - OLS_TSTFILE does not exists.\n"
fi

if [ -w "$OLS_TSTFILE" ]; then
    printf "ok 3 - OLS_TSTFILE is writeable.\n"
else
    printf "no ok 3 - OLS_TSTFILE is not writeable.\n"
fi
