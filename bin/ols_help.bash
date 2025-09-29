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

                  # Fix comment fix for m4.

function ols_help() {

# Print the --help and exit.

    ols_version
    printf "\n"                       # Seperate version from usage.

    ols_usage

    cat <<//

Options & Arguments

 | Options         |  Option Value   | Description                                  |
 |-----------------|-----------------|----------------------------------------------|
 | --input   | -i  |  input_file     | Specify input source [Default: STDIN]        |
 | --output  | -o  |  output_file    | Specify output destination [Default: STDOUT] |
 | --debug         |                 | Include debugging info on STDOUT             |
 | --quiet   | -q  |                 | Run silent, opposite of verbose.             |
 | --verbose | -v  |                 | Opposite of --quiet                          |
 | --log           |                 | Log significant events to script_name.log    |
 | --version       |                 | Print version information                    |
 | --usage         |                 | Print the usage line for this program        |
 | --help          |                 | Print summary for this program               |
 |                 |                 |                                              |
 | Arguments       |                 |                                              |
 | input_file      |                 | Multiple input_files are supported           |

//

    ols_set_excode $EX_OK
    ols_end

} # ols_help