#---------------------------------------------------------------------------------------------------
#
# Usage:        load_input input_file_name
# Purpose:      Save input files into OLS_SYSIN
# Returns:      Missing argument
#               Sets EX_OK exit code
# Parameteres:  input_file
# Throws:       N/A
# Errors:       7001 Missing Argument
#               9999 input_file does not exist.
# Comments:     N/A
# See Also:     N/A
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

function ols_load_input() {

    local      -r    input_file_name="$1"  # Save input file name.

    if [[ -z "$input_file_name" ]]; then   # Called without an argument?
        ols_err "$PGMID" 7001 "$EX_USAGE" "$SCRIPT_NAME: load_sysin: Argument #1 missing, input_file."
    fi

    full_file="$(readlink -f $input_file_name)"

    if [[ ! -f "$full_file" ]]; then

        ols_err "$PGMID" 9999 $EX_NOINPUT "$SCRIPT_NAME: load_sysin: input_file_name $full_file does not exist or is not a normal file."
    fi

    OLS_SYSIN+=("$full_file")        # Put this input file in the OLS_SYSIN array.

    return $EX_OK

} # ols_load_input
