#!/usr/bin/env bash

. lib/ols_def.sh
. lib/ols_err.sh
. lib/ols_setex.sh
. lib/tst_plan.sh
. lib/ols_end.sh
. lib/ols_rmtemp.sh
. lib/is.sh

PGMID=OLSERR

tst_plan 3
bash 0182-ols_err.sh
EX=$?
is $EX 70 "Expect EX_SOFTWARE exit code for missing num argument."

bash 0183-ols_err.sh
EX=$?
is $EX 70 "Expect EX_SOFTWARE exit code for missing ex_code argument."

bash 0182-ols_err.sh
EX=$?
#is $EX 70 "Expect EX_SOFTWARE exit code for missing msg argument."

