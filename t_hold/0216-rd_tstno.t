#! /usr/bin/env bash

. lib/ols_def.sh
. lib/ols_end.sh
. lib/ols_err.sh
. lib/is.sh
. lib/ols_setex.sh
. lib/ols_rd_tstno.sh
. lib/ols_wt_tstno.sh
. lib/ols_tst_plan.sh

declare -r TST_NO=7297

    printf "1..1\n"                     # Simulate ols_tst_plan

    ols_wt_tstno $TST_NO                # Should write 7297 to OLS_TSTFILE
    NUM=$(ols_rd_tstno)                 # Should read  7297 from OLS_TSTFILE

    is $NUM   $TST_NO 1 "The number in OLS_TSTFILE should be TST_NO."





