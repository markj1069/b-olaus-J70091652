#! /usr/bin/env bash

source $OLS_LIB/ols_begin.sh
source $OLS_LIB/ols_err.sh
source $OLS_LIB/ols_def.sh
source $OLS_LIB/ols_wt_tstno.sh
source $OLS_LIB/ols_set_excode.sh
source $OLS_LIB/ols_rd_excode.sh
source $OLS_LIB/ols_wt_excode.sh
source $OLS_LIB/test_plan.sh
source $OLS_LIB/ols_rmtemp.sh

PGMID=OLS

test_plan "$1"                    # Set the plan from 1st option
