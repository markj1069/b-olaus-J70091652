#!/usr/bin/env bash

source $OLS_LIB

export PGMID=OLS

test_plan 3

bash t/10155-ols_err.sh
EX=$?
is $EX $EX_USAGE "PGMID_MISSING" "Expect EX_USAGE exit code for missing pgmid argument."

bash t/10155-ols_err.sh "ONE"
EX=$?
is $EX $EX_USAGE "EXIT_CODE_MISSING" "Expect EX_USAGE exit code for missing errnum argument."

bash t/10155-ols_err.sh "ONE" 9999
EX=$?
is $EX $EX_USAGE "SEVERITY_CODE_MISSING" "Expect EX_USAGE exit code for missing severity_code argument."

ols_wt_excode $EX_OK
