#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_usage
# Purpose:      Print script --usage option.
# Returns:      Sets EX_OK exit code
# Parameteres:  None
# Throws:       None
# Comments:     None
# See Also:     ols_help, ols_version
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

function ols_usage() {

# Print the scripts synopsis and exit with a usage exit code.

    printf "%s\n\t%s\n\t%s\n\t%s\n" \
                  "$SCRIPT_NAME [--input=input_file | -i input_file]" \
                  "[--output=output_file | -o output_file] [--help]" \
                  "[--log] [--log=log_file] [--quiet | -q] [--usage] [--debug]" \
                  "[--version] [--verbose] [--] [input_file ...]"

    ols_set_excode $EX_OK

} # ols_usage
