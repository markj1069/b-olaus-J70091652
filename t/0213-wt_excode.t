#! /usr/bin/env bash

. $OLS_LIB/ols_begin.sh
. $OLS_LIB/ols_def.sh
. $OLS_LIB/ols_end.sh
. $OLS_LIB/ols_err.sh
. $OLS_LIB/is.sh
. $OLS_LIB/ols_setex.sh
. $OLS_LIB/ols_wt_excode.sh
. $OLS_LIB/ols_tst_plan.sh

declare EX_CODE=EX_BASE

    printf "1..4\n"                     # Simulate ols_tst_plan

    ols_wt_excode $EX_CODE              # Should write EX_BASE to OLS_EX_FILE.

    LINES=$(cat $OLS_EX_FILE | wc -l)  # Get the line count of OLS_EX_FILE
    is  $LINES   1      1 "The number of lines in OLS_EX_FILE should be 1."

    WORDS=$(cat $OLS_EX_FILE | wc -w)  # Get the number of words in OLS_EX_FILE
    is  $WORDS   1      2 "The number of words in OLS_EX_FILE should be 1."

    CHARS=$(cat $OLS_EX_FILE | wc -c)  # Get the number of characters in OLS_EX_FILE
    is  $CHARS   4      3 "The number of characters in OLS_EX_FILE should be 4."


    READ_NO=$(cat $OLS_EX_FILE)
    is $READ_NO  $EX_BASE 4 "The number in OLS_EX_FILE should be EX_BASE."





