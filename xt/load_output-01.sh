#! /usr/bin/env bash

#---------------------------------------------------------------------------------------------------
#
# Test load_input for missing argument.
#
#---------------------------------------------------------------------------------------------------

source $OLSLIB

declare    -r    file_name="$1"
declare    -r -x PGMID=TST        # Successful termination
declare -a    -x OLS_SYSIN        # Save input files in OLS_STDIN
declare    -r    BASENAME=$(basename $0)     # Grap command name.
declare    -r    SCRIPT_NAME=${BASENAME%.*}  # Strip any suffix.

source bin/ols_load_output.bash

# Test Missing argument
ols_load_output "$file_name"; EX=$?

ols_wt_excode $EX
ols_end




