#!/usr/bin/env bash

source $OLS_LIB/ols_def.sh
source $OLS_LIB/ols_err.sh

source $OLS_LIB/test_plan.sh
source $OLS_LIB/ols_end.sh

source $OLS_LIB/is.sh

PGMID=OLSERR

pwd

test_plan 3
bash t/0182-ols_err.sh
EX=$?
is $EX 70 "Expect EX_SOFTWARE exit code for missing num argument."

bash t/0183-ols_err.sh
EX=$?
is $EX 70 "Expect EX_SOFTWARE exit code for missing ex_code argument."

bash t/0182-ols_err.sh
EX=$?
#is $EX 70 "Expect EX_SOFTWARE exit code for missing msg argument."

