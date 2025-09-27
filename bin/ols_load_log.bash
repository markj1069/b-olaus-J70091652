#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_load_log
# Purpose:      Set OLS_LOG to true.
# Returns:      
# Parameteres:  (N/A)
# Throws:       None
# Errors:       (N/A)
# Comments:     None
# See Also:     N/A
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

function ols_load_log() {

    OLS_LOG=$TRUE

    return $EX_OK

} # ols_load_log