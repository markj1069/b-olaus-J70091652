. lib/ols_def.sh
. lib/ols_err.sh
. lib/ols_setex.sh
. lib/ols_end.sh
. lib/ols_rmtemp.sh

PGMID=OLS

ols_err 9999 $EX_OK Informational Message

ols_err 9998 $EX_WARNING Warning Message

ols_err 9997 $EX_ERROR Error Message

ols_err 9996 $EX_SEVERE Severe Error Message

ols_err 9995 $EX_FATAL Fatal Error Message
