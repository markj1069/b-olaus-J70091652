#! /usr/bin/env bash

#---------------------------------------------------------------------------------------------------
#
# Test load_output Function Test Errors
#
#---------------------------------------------------------------------------------------------------

source $OLSLIB

    declare    -r -x PGMID=TST        # Successful termination
    declare -a    -x OLS_SYSIN        # Save input files in OLS_STDIN
    declare    -r    BASENAME=$(basename $0)     # Grap command name.
    declare    -r    SCRIPT_NAME=${BASENAME%.*}  # Strip any suffix.

test_plan 4

source bin/ols_load_output.bash

# Test 1 source
type ols_load_output >/dev/null 2>/dev/null; EX=$?  # Check that load_input is defined.

is $EX $EX_OK "source" "Source load_output load correctly, type EX=$EX?"

# Test 2 Missing argument
xt/load_output-01.sh; EX=$?
is $EX $EX_USAGE "missing" "load_output checking for missing file augument, EX=$EX."

ols_load_output "file_name.txt"; EX=$?
is $EX $EX_OK "file_name-ex" "Exit code is $EX. Expected to be $EX_OK."
is "$OLS_SYSOUT" "/mnt/d/b-olaus-J70091652/file_name.txt" "file_name" "OLS_SYSOUT should have the value /mnt/d/b-olaus-J70091652/file_name.txt, $OLS_SYSOUT."
