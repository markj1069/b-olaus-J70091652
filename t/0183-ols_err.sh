. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/ols_setex.sh
. ../lib/tst_plan.sh
. ../lib/ols_end.sh
. ../lib/ols_rmtemp.sh

PGMID=OLSERR

ols_err 9993

# Expect EX_SOFTWARE exit code.
