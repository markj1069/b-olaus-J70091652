#! /usr/bin/env bash

#---------------------------------------------------------------------------------------------------
#
# Test load_debug Function Test Errors
#
#---------------------------------------------------------------------------------------------------

source $OLSLIB

    declare    -r -x PGMID=TST        # Successful termination
    declare -a    -x OLS_SYSIN        # Save input files in OLS_STDIN
    declare    -r    BASENAME=$(basename $0)     # Grap command name.
    declare    -r    SCRIPT_NAME=${BASENAME%.*}  # Strip any suffix.
    declare    -r    unit_test="ols_load_log"

test_plan 3

source bin/ols_load_debug.bash

# Test 1 source
type ols_load_debug >/dev/null 2>/dev/null; EX=$?  # Check that load_input is defined.
is $EX $EX_OK "source" "$SCRIPT_NAME: Source $unit_test load correctly, type EX=$EX?"

# Test 2 Missing argument
ols_load_debug
is $EX $EX_OK "ex_code" "$SCRIPT_NAME: $unit_test: Check exit code, EX=$EX."
is $OLS_DEBUG $TRUE "true" "$SCRIPT_NAME: $unit_test: Check OLS_DEBUG is set to true."

