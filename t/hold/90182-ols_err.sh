#!/usr/bin/env bash

source $OLS_LIB/ols_def.sh
source $OLS_LIB/ols_err.sh
source $OLS_LIB/ols_end.sh
source $OLS_LIB/test_plan.sh
source $OLS_LIB/is.sh
source $OLS_LIB/ols_rmtemp.sh
source $OLS_LIB/ols_wt_tstno.sh

PGMID=OLS
    
ols_err

# Expect EX_SOFTWARE exit code.
