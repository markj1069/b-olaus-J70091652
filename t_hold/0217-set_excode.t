#! /usr/bin/env bash

source $OLS_LIB/ols_begin.sh
source $OLS_LIB/ols_end.sh
source $OLS_LIB/ols_err.sh
source $OLS_LIB/is.sh
source $OLS_LIB/ols_set_excode.sh
source $OLS_LIB/ols_set_excode.sh
source $OLS_LIB/ols_rd_excode.sh
source $OLS_LIB/ols_wt_excode.sh
source $OLS_LIB/ols_tst_plan.sh

    printf "1..1\n"                     # Simulate ols_tst_plan

    ols_wt_excode $EX_BASE              # Should write EX_BASE to OLS_EX_FILE

    ols_set_excode $EX_FATAL            # Since EX_FATAL < EX_BASE,
                                        # OLS_EX_FILE should contain EX_BASE
    
    NUM=$(ols_rd_excode)                # OLS_EX_FILE should contain EX_BASE

    is $NUM   $EX_BASE 1 "The number in OLS_EX_FILE should be EX_BASE."
