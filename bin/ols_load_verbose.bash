#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_load_verbose
# Purpose:      Set OLS_VERBOSE to TRUE.
# Returns:      
# Parameteres:  (N/A)
# Throws:       None
# Errors:       (N/A)
# Comments:     None
# See Also:     N/A
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

function ols_load_verbose() {

    OLS_VERBOSE=$TRUE

    return $EX_OK

} # ols_load_verbose