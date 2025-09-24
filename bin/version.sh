#---------------------------------------------------------------------------------------------------
#
# Usage:        version
# Purpose:      Print release date, version no., and copyright notice.
# Returns:      Sets EX_OK exit code
# Parameteres:  None
# Throws:       None
# Comments:     None
# See Also:     help, usage
# Source:       bash
#
#---------------------------------------------------------------------------------------------------
function version() {

# Print the release date and version number and exit with usage exit code.
    
    printf "\n%s\n\n" "$SCRIPT_NAME $REL_DATE Version: $VERSION"

# Print a shorten copywrite statement.
    cat <</*
BSD 2-Clause License
Copyright (c) Mark Jensen
All rights reserved.
/*

    ols_set_excode $EX_OK

} # version