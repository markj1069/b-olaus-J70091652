#! /usr/bin/env bash

#---------------------------------------------------------------------------------------------------
#
# Test usage
#
#---------------------------------------------------------------------------------------------------

source $OLSLIB

declare    -r -x PGMID=TST        # Successful termination
declare -a    -x OLS_SYSIN        # Save input files in OLS_STDIN
declare    -r    BASENAME=$(basename $0)     # Grap command name.
declare    -r    SCRIPT_NAME=${BASENAME%.*}  # Strip any suffix.

source bin/ols_usage.bash

ols_usage

ols_wt_excode $EX_OK
ols_end




