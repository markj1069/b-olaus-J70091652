#! /usr/bin/env bash

. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/is.sh
. ../lib/ols_rmtemp.sh
. ../lib/ok.sh
. ../lib/ols_setex.sh
. ../lib/ols_end.sh

PGMID=OLSTST

    if [[ $# -eq 0 ]]                            # The Condition arguemnt is required.
    then
        ols_err $EX_USAGE 7001 "ok: missing argument 1, condition"
    else
        CONDITION="$1"
    fi
    if [[ $# -ge 2 ]]                            # The Test Name argument is optional.
    then
        TEST_NAME="$2"
    else
        TEST_NAME=""
    fi
    if [[ $# -ge 3 ]]                            # Diagnostic message argument is optional.
    then
        DIAGNOSTIC_MESSAGE="$*"
    else
        DIAGNOSTIC_MESSAGE=""
    fi

ok "$CONDITION" "$TEST_NAME" "$DIAGNOSTIC_MESSAGE"
RC=$?

exit $RC
