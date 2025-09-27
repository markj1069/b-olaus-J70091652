#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_version
# Purpose:      Print release date, version no., and copyright notice.
# Returns:      Sets EX_OK exit code
# Parameteres:  None
# Throws:       None
# Comments:     None
# See Also:     ols_help, ols_usage
# Source:       bash
#
#---------------------------------------------------------------------------------------------------
function ols_version() {

# Print the release date and version number and exit with usage exit code.
    
    printf "%s\n" "$SCRIPT_NAME $REL_DATE Version: $VERSION"
    printf "%s\n" "$SCRIPT_NAME is licensed under CC BY 4.0 by Mark J. Jensen."

    ols_set_excode $EX_OK

} # ols_version