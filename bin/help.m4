#---------------------------------------------------------------------------------------------------
#
# Usage:        help
# Purpose:      Print version, usage, and options
# Returns:      Sets EX_OK exit code
# Parameteres:  None
# Throws:       None
# Comments:     None
# See Also:     usage, version
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

changecom(`/*',`*/')                  # Fix comment fix for m4.

function help() {

# Print the --help and exit.

    version

    usage

    cat <<//

Options & Arguments

include(`options_src.txt')
//

    ols_set_excode $EX_OK

} # help