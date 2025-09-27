#! /usr/bin/env bash

#---------------------------------------------------------------------------------------------------
#
# Test load_input function Test Errors
#
#---------------------------------------------------------------------------------------------------

source $OLSLIB

    declare    -r -x PGMID=TST        # Successful termination
    declare -a    -x OLS_SYSIN        # Save input files in OLS_STDIN
    declare    -r    BASENAME=$(basename $0)     # Grap command name.
    declare    -r    SCRIPT_NAME=${BASENAME%.*}  # Strip any suffix.

test_plan 4

source bin/ols_load_input.bash

# Test 1 source
type ols_load_input >/dev/null 2>/dev/null; EX=$?  # Check that load_input is defined.

is $EX $EX_OK "source" "Source load_input load correctly, type EX=$EX?"

# Test 2 Missing argument
xt/load_input-01.sh; EX=$?
is $EX $EX_USAGE "missing" "load_input checking for missing file, EX=$EX."


xt/load_input-01.sh "load_input_missing_file.sh"; EX=$?
is $EX $EX_NOINPUT "exist" "$SCRIPT_NAME: load_input: Input file does not exist, EX=$EX."

xt/load_input-01.sh "load_input_directory"; EX=$?
is $EX $EX_NOINPUT "invalid" "$SCRIPT_NAME: load_input: Input file is not a normal file, EX=$EX."
