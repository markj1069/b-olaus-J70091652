#!/usr/bin/env bash

. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/ols_setex.sh
. ../lib/ols_end.sh
. ../lib/tst_plan.sh
. ../lib/is.sh
. ../lib/ols_rmtemp.sh

PGMID=OLSERR
    
ols_err

# Expect EX_SOFTWARE exit code.
