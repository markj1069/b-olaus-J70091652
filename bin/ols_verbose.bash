#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_verbose
# Purpose:      Set OLS_VERBOSE to true.
# Returns:      
# Parameteres:  (N/A)
# Throws:       None
# Errors:       (N/A)
# Comments:     None
# See Also:     N/A
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

function ols_verbose() {

    OLS_VERBOSE=$TRUE

    return $EX_OK

} # ols_verbose