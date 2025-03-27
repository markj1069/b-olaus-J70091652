#! /usr/bin/env bash

. lib/ols_def.sh
. lib/ols_end.sh
. lib/ols_err.sh
. lib/is.sh
. lib/ols_setex.sh
. lib/ols_bmp_tstno.sh
. lib/ols_rd_tstno.sh
. lib/ols_wt_tstno.sh
. lib/ols_tst_plan.sh

declare -r TST_NO=7297
declare -r TST_NO1=$((TST_NO+1))

    printf "1..1\n"                     # Simulate ols_tst_plan

    ols_wt_tstno $TST_NO                # Should write 7297 to OLS_TSTFILE
    
    ols_bmp_tstno                       # OLS_TSTFILE should contain 7298

    is $NUM   $TST_NO1 1 "The number in OLS_TSTFILE should be 7298."
