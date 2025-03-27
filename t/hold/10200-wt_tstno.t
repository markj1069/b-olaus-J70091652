#! /usr/bin/env bash

. lib/ols_def.sh
. lib/ols_end.sh
. lib/ols_err.sh
. lib/is.sh
. lib/ols_set_excode.sh
. lib/ols_wt_tstno.sh
. lib/ols_tst_plan.sh
. lib/ols_begin.sh

declare -r TST_NO=7297

    printf "1..4\n"                     # Simulate ols_tst_plan

    ols_wt_tstno $TST_NO                # Should write 7297 to OLS_TSTFILE

    LINES=$(cat $OLS_TSTFILE | wc -l)  # Get the line count of OLS_TSTFILE
    is  $LINES   1      1 "The number of lines in OLS_TSTFILE should be 1."

    WORDS=$(cat $OLS_TSTFILE | wc -w)  # Get the number of words in OLS_TSTFILE
    is  $WORDS   1      2 "The number of words in OLS_TSTFILE should be 1."

    CHARS=$(cat $OLS_TSTFILE | wc -c)  # Get the number of characters in OLS_TSTFILE
    is  $CHARS   5      3 "The number of characters in OLS_TSTFILE should be 5."

    READ_NO=$(cat $OLS_TSTFILE)
    is $READ_NO   $TST_NO 4 "The number in OLS_TSTFILE should be TST_NO."





