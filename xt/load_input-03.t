#! /usr/bin/env bash

#---------------------------------------------------------------------------------------------------
#
# Test Load Files Test
#
#---------------------------------------------------------------------------------------------------

source $OLSLIB

    declare    -r -x PGMID=TST        # Successful termination
    declare -a    -x OLS_SYSIN        # Save input files in OLS_STDIN
    declare    -r    BASENAME=$(basename $0)     # Grap command name.
    declare    -r    SCRIPT_NAME=${BASENAME%.*}  # Strip any suffix.

test_plan 22

source bin/ols_load_input.bash

# Test 1 One File
ols_load_input "xt/load_input_file_01.txt"; EX=$?
is $EX $EX_OK "OneFile" "Load Single File EX=$EX?"
is ${#OLS_SYSIN[@]} 1 "Num1" "$SCRIPT_NAME: load_file: Length of OLS_SYSIN should be 1, ${#OLS_SYSIN[@]}."

ols_load_input "xt/load_input_file_02.txt"; EX=$?
is $EX $EX_OK "OneFile" "Load Single File EX=$EX?"
is ${#OLS_SYSIN[@]} 2 "Num2" "$SCRIPT_NAME: load_file: Length of OLS_SYSIN should be 2, ${#OLS_SYSIN[@]}."

ols_load_input "xt/load_input_file_03.txt"; EX=$?
is $EX $EX_OK "OneFile" "Load Single File EX=$EX?"
is ${#OLS_SYSIN[@]} 3 "Num3" "$SCRIPT_NAME: load_file: Length of OLS_SYSIN should be 3, ${#OLS_SYSIN[@]}."

ols_load_input "xt/load_input_file_04.txt"; EX=$?
is $EX $EX_OK "OneFile" "Load Single File EX=$EX?"
is ${#OLS_SYSIN[@]} 4 "Num4" "$SCRIPT_NAME: load_file: Length of OLS_SYSIN should be 4, ${#OLS_SYSIN[@]}."

ols_load_input "xt/load_input_file_05.txt"; EX=$?
is $EX $EX_OK "OneFile" "Load Single File EX=$EX?"
is ${#OLS_SYSIN[@]} 5 "Num5" "$SCRIPT_NAME: load_file: Length of OLS_SYSIN should be 5, ${#OLS_SYSIN[@]}."

ols_load_input "xt/load_input_file_06.txt"; EX=$?
is $EX $EX_OK "OneFile" "Load Single File EX=$EX?"
is ${#OLS_SYSIN[@]} 6 "Num6" "$SCRIPT_NAME: load_file: Length of OLS_SYSIN should be 6, ${#OLS_SYSIN[@]}."

ols_load_input "xt/load_input_file_07.txt"; EX=$?
is $EX $EX_OK "OneFile" "Load Single File EX=$EX?"
is ${#OLS_SYSIN[@]} 7 "Num7" "$SCRIPT_NAME: load_file: Length of OLS_SYSIN should be 7, ${#OLS_SYSIN[@]}."

ols_load_input "xt/load_input_file_08.txt"; EX=$?
is $EX $EX_OK "OneFile" "Load Single File EX=$EX?"
is ${#OLS_SYSIN[@]} 8 "Num8" "$SCRIPT_NAME: load_file: Length of OLS_SYSIN should be 8, ${#OLS_SYSIN[@]}."

ols_load_input "xt/load_input_file_09.txt"; EX=$?
is $EX $EX_OK "OneFile" "Load Single File EX=$EX?"
is ${#OLS_SYSIN[@]} 9 "Num9" "$SCRIPT_NAME: load_file: Length of OLS_SYSIN should be 9, ${#OLS_SYSIN[@]}."

ols_load_input "xt/load_input_file_10.txt"; EX=$?
is $EX $EX_OK "OneFile" "Load Single File EX=$EX?"
is ${#OLS_SYSIN[@]} 10 "Num10" "$SCRIPT_NAME: load_file: Length of OLS_SYSIN should be 10, ${#OLS_SYSIN[@]}."

is "/mnt/d/b-olaus-J70091652/xt/load_input_file_01.txt" ${OLS_SYSIN[0]} "FirstElement" "$SCRIPT_NAME: load_file: First element is ${OLS_SYSIN[0]}."
is "/mnt/d/b-olaus-J70091652/xt/load_input_file_10.txt" ${OLS_SYSIN[9]} "LastElement"  "$SCRIPT_NAME: load_file: Last element is ${OLS_SYSIN[9]}."
