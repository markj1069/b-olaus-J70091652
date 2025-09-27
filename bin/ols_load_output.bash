#---------------------------------------------------------------------------------------------------
#
# Usage:        load_output output_file_name
# Purpose:      Save output file into OLS_SYSOUT
# Returns:      Missing argument
# Parameteres:  output_file
# Throws:       None
# Errors:       7001 Missing Argument
#               9999 Only one --output option allowed.
# Comments:     None
# See Also:     N/A
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

function ols_load_output() {

    local      -r    output_file_name="$1"  # Save input file name.
    local            full_file

    if [[ -z "$output_file_name" ]]; then   # Called without an argument?
        ols_err "$PGMID" 7001 "$EX_USAGE" "$SCRIPT_NAME: load_output: Argument #1 missing, output_file_name."
    fi

    full_file="$(readlink -f $output_file_name)"

    if [[ -z "$OLS_SYSOUT" ]]; then
        full_file="$(readlink -f $output_file_name)"
        OLS_SYSOUT="$full_file"       # Save the output file in OLS_SYSOUT.
    else
        ols_err "$OLSID" 9999 EX_USAGE "$SCRIPT_NAME: load_output: Only one --output option allowed."
    fi

    return $EX_OK

} # ols_load_output
