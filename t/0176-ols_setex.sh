. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/ols_setex.sh
. ../lib/ols_end.sh
. ../lib/tst_plan.sh
. ../lib/is.sh
. ../lib/rmtemp.sh
PGMID=OLSTST

tst_plan 4
    
is $EX_CODE $EX_OK "Initial Exit Code = Zero. line: $LINENO"

ols_setex $EX_WARNING
is $EX_CODE $EX_WARNING "Warning Exit Code. line: $LINENO"

ols_setex $EX_ERROR
is $EX_CODE $EX_ERROR "Error Exit Code. line: $LINENO"

ols_setex $EX_WARNING
is $EX_CODE $EX_ERROR  "Exit Code remains $EX_ERROR. line: $LINENO"

exit $EX_CODE