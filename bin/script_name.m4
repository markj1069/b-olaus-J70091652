#! /usr/bin/env bash

#---------------------------------------------------------------------------------------------------
#
# Name: script_name.m4 --> script_name.sh
#
#---------------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------------
#
# Include Olaus Setup and Functions
#
#---------------------------------------------------------------------------------------------------

BEGIN_TIME=$(date +"%Y-%m-%d %H:%M:%S")

VERSION="0.0.0"
REL_DATE="9999-99-99"
PGMID="SCR"
BASENAME=$(basename $0)
SCRIPT_NAME=${BASENAME%.*}
OLS_LOG_FILE="$SCRIPT_NAME.log"

source $OLSLIB

if [[ -z "$OLS_DEF" ]]; then          # Check that OLSLIB loaded correctly.
    ols_err  "$PGMID" 9999 $EX_MISSINGFILE "OLSLIB is missing or did not load."
fi

include(`ols_help.bash')
include(`ols_load_debug.bash')
include(`ols_load_input.bash')
include(`ols_load_log.bash')
include(`ols_load_output.bash')
include(`ols_load_quiet.bash')
include(`ols_load_verbose.bash')
include(`ols_usage.bash')
include(`ols_version.bash')

# See the include ols_man.pod at the bottom of this script.



#---------------------------------------------------------------------------------------------------
#
# Process script_name options and arguments
# Use getopt to process the command, format the argument in a consistant format.
#
#---------------------------------------------------------------------------------------------------


PARSED_ARGUMENTS=$(getopt -a -n script_name -o i:o:qv --long input:,output:,debug,quiet,verbose:,log,version,usage,help -- "$@")
VALID_ARGUMENTS=$?

if [[ $VALID_ARGUMENTS -ne 0 ]]; then
    ols_err "$PGMID" 9999 $EX_USAGE "Unrecoognized options in calling sequence."
    usage
    ols_set_excode $EX_USAGE
    exit
fi

eval set -- "$PARSED_ARGUMENTS"       # Reset the script arguments with the canonical format.

while :; do
    case $1 in #
        -i | --input   ) ols_load_input     "$2";     shift  2;;
        -o | --output  ) ols_load_output    "$2";     shift  2;;
             --debug   ) ols_load_debug;              shift   ;;
        -q | --quiet   ) ols_load_quiet;              shift   ;;
        -v | --verbose ) ols_load_verbose;            shift   ;;
             --log     ) ols_load_log;                shift   ;;
             --version ) ols_version;       ols_end;  shift   ;;
             --usage   ) ols_usage;         ols_end;  shift   ;;
             --help    ) ols_help;          ols_end;  shift   ;;
             --        ) shift;             break             ;;
             *         ) ols_usage;         ols_end;  shift   ;;
    esac # case
done # while

# Process remaining input files.

for input_file_name in "$@"; do
    ols_load_input "$input_file_name"
    shift  
done  # for input_file_name

for file in "${OLS_SYSIN[@]}"; do
    if [[ "$file" == "$OLS_SYSOUT" ]]; then
        ols_err "$PGMID" 9999 $EX_USAGE "Input and Output files can not be the same, $OLS_SYSOUT."
    fi
done  # for file

#---------------------------------------------------------------------------------------------------
#
#   Processing of script_name arguments and options complete.
#   Time to get on to business
#
#---------------------------------------------------------------------------------------------------


# Print the status of the

    >"$OLS_LOG_FILE"

    printf "\n%s\n" "----------------------------------------------------------------------------------------------------" >>"$OLS_LOG_FILE"
    printf "%s\n"                                                                                                          >>"$OLS_LOG_FILE"
    printf "%s\n"   "Options and Arguments"                                                                                >>"$OLS_LOG_FILE"
    printf "%s\n"                                                                                                          >>"$OLS_LOG_FILE"
    printf "%s\n\n" "----------------------------------------------------------------------------------------------------" >>"$OLS_LOG_FILE"
      
    if ((${#OLS_SYSIN[@]} == 0)); then
        printf "%s\n" "Input file: STDIN"                                  >>"$OLS_LOG_FILE"
    else
        printf "%s\n" "Input files:"                                       >>"$OLS_LOG_FILE"
        for file in "${OLS_SYSIN[@]}"; do
            printf "\t%s\n" "$file"                                        >>"$OLS_LOG_FILE"
        done
    fi
    if [[ -n "$OLS_SYSOUT" ]]; then
        printf "%s\n" "Output file: $OLS_SYSOUT"                           >>"$OLS_LOG_FILE"
    else
        printf "%s\n" "Output file: STDOUT"                                >>"$OLS_LOG_FILE"
    fi

    printf "%s\n" "Debug Flag: $OLS_DEBUG"                                 >>"$OLS_LOG_FILE"
    printf "%s\n" "Verbose Flag: $OLS_VERBOSE"                             >>"$OLS_LOG_FILE"
    printf "%s\n" "Log Flag: $OLS_LOG"                                     >>"$OLS_LOG_FILE"
    printf "%s\n" "Log File: $OLS_LOG_FILE"                                >>"$OLS_LOG_FILE"
    
    











ols_wt_excode $EX_USERABORT




# script map

script_name 



# Include user documentation.

cat >/dev/null <</*

include(`ols_man.pod')

/*
