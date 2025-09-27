#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_help
# Purpose:      Print version, usage, and options
# Returns:      Sets EX_OK exit code
# Parameteres:  None
# Throws:       None
# Comments:     None
# See Also:     ols_usage, ols_version
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

changecom(`/*',`*/')                  # Fix comment fix for m4.

function ols_help() {

# Print the --help and exit.

    ols_version
    printf "\n"                       # Seperate version from usage.

    ols_usage

    cat <<//

Options & Arguments

include(`ols_options_src.txt')
//

    ols_set_excode $EX_OK
    ols_end

} # ols_help