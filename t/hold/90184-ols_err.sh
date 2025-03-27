. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/ols_setex.sh
. ../lib/tst_plan.sh
. ../lib/ols_end.sh
. ../lib/ols_rmtemp.sh

PGMID=OLSERR

tst_plan 1
ols_err 9992 $EX_FATAL
