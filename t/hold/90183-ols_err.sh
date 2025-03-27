source $OLS_LIB/ols_def.sh
source $OLS_LIB/ols_err.sh
source $OLS_LIB/ols_setex.sh
source $OLS_LIB/tst_plan.sh
source $OLS_LIB/ols_end.sh
source $OLS_LIB/ols_rmtemp.sh

PGMID=OLSERR

ols_err 9993

# Expect EX_SOFTWARE exit code.
