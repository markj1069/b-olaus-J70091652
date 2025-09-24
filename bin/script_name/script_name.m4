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
source $OLSLIB

BEGIN_TIME=$(date +"%Y-%m-%d %H:%M:%S")

VERSION="0.0.0"
REL_DATE="9999-99-99"
BASENAME=$(basename $0)
PGMID="SCR"
SCRIPT_NAME=${BASENAME%.*}
OLS_LOG_FILE="log.log"

include(`help.sh')
include(`usage.sh')
include(`version.sh')

# See the include man.pod at the bottom of this script.


function input() {

    input_file="$1"

    if [[ -z "$input_file" ]]; then
        ols_err "$PGMID" 7001 "$EX_USAGE" "input: Argument #1 missing, input_file."
        ols_set_excode $EX_USAGE
        ols_end
    fi

    full_file="$(readlink -f $input_file)"

    if [[ ! -f "$full_file" ]]; then
        ols_err "$PGMID" 9999 $EX_NOINPUT "$SCRIPT_NAME: input_file $full_file does not exist or is not a normal file."
    fi

    OLS_SYSIN+=("$full_file")        # Put this input file in the OLS_SYSIN array.

    return $EX_OK

} # input

function output() {

    if [[ -z "$OLS_SYSOUT" ]]; then
        output_file="$1"
        full_file="$(readlink -f $output_file)"
        OLS_SYSOUT="$full_file"       # Save the output file in OLS_SYSOUT.
    else
        ols_err "$OLSID" 9999 EX_USAGE "$SCRIPT_NAME: Only one --output option allowed."
    fi

    return $EX_OK


} # output


function log() {

    OLS_LOG=$TRUE
    OLS_LOG_FILE="$1"

    return

} # log

function verbose() {

    OLS_VERBOSE="$1"

    return

} # verbose


function debug() {

    OLS_DEBUG=$TRUE
    return

} # debug

function OLS_EXTRA_OPTIONS () {

    local option="$1"
    OLS_EXTRA_OPT+=("$option")        # Put this input file in the OLS_SYSIN array.

    return $EX_OK

} # OLS_EXTRA_OPTIONS

#---------------------------------------------------------------------------------------------------
#
# Process script_name options and arguments
# Use getopt to process the command, format the argument in a consistant format.
#
#---------------------------------------------------------------------------------------------------


PARSED_ARGUMENTS=$(getopt -a -n script_name -o i:o:qv --long input:,output:,debug,quiet,verbose,logfile:,log,version,usage,help -- "$@")
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
        -i | --input   ) input   "$2";                    shift  2;;
        -o | --output  ) output  "$2";                    shift  2;;
             --debug   ) debug;                           shift   ;;
        -q | --quiet   ) verbose -1;                      shift   ;;
        -v | --verbose ) verbose +1;                      shift   ;;
             --logfile ) log     "$2";                    shift  2;;
             --log     ) log     "script_name.log";       shift   ;;
             --version ) version; exit;                   shift   ;;
             --usage   ) usage;   exit;                   shift   ;;
             --help    ) help;    exit;                   shift   ;;
             --        ) shift;                           break   ;;
             *         ) usage;  exit $EX_USAGE           shift   ;;
    esac # case
done # while

# Process remaining input files.

for input_file in "$@"; do

    input_file="$1"
    input "$input_file"
    shift
    
done

for file in "${OLS_SYSIN[@]}"; do
    if [[ "$file" == "$OLS_SYSOUT" ]]; then
        ols_err "$PGMID" 9999 $EX_USAGE "Input and Output files can not be the same, $OLS_SYSOUT."
    fi
done

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










# Include user documentation.

cat >/dev/null <</*

include(`man.pod')

/*