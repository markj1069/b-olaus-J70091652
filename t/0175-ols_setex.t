#! /bin/bash

. ../lib/tst_plan.sh
. ../lib/is.sh
. ../lib/ols_setex.sh

bash 0176-ols_setex.sh
RC=$?                        # Capture exit code from setex.sh

tst_plan 1
is $RC 8 "Exit code from ols_setex.sh should return 8. line: $LINENO"
