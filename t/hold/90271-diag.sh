#! /usr/bin/env bash

. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/is.sh
. ../lib/ols_rmtemp.sh
. ../lib/assert.sh
. ../lib/ols_setex.sh
. ../lib/ols_end.sh
. ../lib/diag.sh

PGMID=OLSTST

diag $*
RC=$?

exit $RC
