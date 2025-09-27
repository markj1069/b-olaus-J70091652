#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_debug
# Purpose:      Set OLS_DEBUG to true.
# Returns:      
# Parameteres:  (N/A)
# Throws:       None
# Errors:       (N/A)
# Comments:     None
# See Also:     N/A
# Source:       bash
#
#---------------------------------------------------------------------------------------------------
function ols_load_debug() {

    OLS_DEBUG=$TRUE
    return $EX_OK

} # ols_load_debug