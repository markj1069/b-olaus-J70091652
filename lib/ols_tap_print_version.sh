# ols_tap_print_version - Write the TAP version to STDOUT.

# Synopsis: ols_tap_print_version

function ols_tap_print_version() {

    printf "%s\n" "$OLS_TAP_VERSION"
 
    return $EX_OK

} # end ols_tap_print_version

