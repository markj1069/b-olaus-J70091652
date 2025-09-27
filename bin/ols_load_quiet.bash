#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_load_quiet
# Purpose:      Set OLS_QUIET to TRUE.
# Returns:      
# Parameteres:  (N/A)
# Throws:       None
# Errors:       (N/A)
# Comments:     None
# See Also:     N/A
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

function ols_load_quiet() {

    OLS_QUIET=$TRUE

    return $EX_OK

} # ols_load_quiet