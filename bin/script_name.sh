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
PGMID="SCR"
BASENAME=$(basename $0)
SCRIPT_NAME=${BASENAME%.*}
OLS_LOG_FILE="$SCRIPT_NAME.log"

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
function ols_debug() {

    OLS_DEBUG=$TRUE
    return $EX_OK

} # ols_debug
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
#---------------------------------------------------------------------------------------------------
#
# Usage:        load_input input_file_name
# Purpose:      Save input files into OLS_SYSIN
# Returns:      Missing argument
#               Sets EX_OK exit code
# Parameteres:  input_file
# Throws:       N/A
# Errors:       7001 Missing Argument
#               9999 input_file does not exist.
# Comments:     N/A
# See Also:     N/A
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

function ols_load_input() {
set -v
    local      -r    input_file_name="$1"  # Save input file name.

    if [[ -z "$input_file_name" ]]; then   # Called without an argument?
        ols_err "$PGMID" 7001 "$EX_USAGE" "$SCRIPT_NAME: load_sysin: Argument #1 missing, input_file."
    fi

    full_file="$(readlink -f $input_file_name)"

    if [[ ! -f "$full_file" ]]; then

        ols_err "$PGMID" 9999 $EX_NOINPUT "$SCRIPT_NAME: load_sysin: input_file_name $full_file does not exist or is not a normal file."
    fi

    OLS_SYSIN+=("$full_file")        # Put this input file in the OLS_SYSIN array.
set +v
    return $EX_OK

} # ols_load_input

#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_log
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

function ols_log() {

    OLS_LOG=$TRUE

    return $EX_OK

} # ols_log
#---------------------------------------------------------------------------------------------------
#
# Usage:        load_output output_file
# Purpose:      Save output file into OLS_SYSOUT
# Returns:      Missing argument
# Parameteres:  output_file
# Throws:       None
# Errors:       7001 Missing Argument
#               9999 Only one --output option allowed.
# Comments:     None
# See Also:     N/A
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

function load_output() {

    if [[ -z "$OLS_SYSOUT" ]]; then
        output_file="$1"
        full_file="$(readlink -f $output_file)"
        OLS_SYSOUT="$full_file"       # Save the output file in OLS_SYSOUT.
    else
        ols_err "$OLSID" 9999 EX_USAGE "$SCRIPT_NAME: load_output: Only one --output option allowed."
    fi

    return $EX_OK


} # load_output

#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_usage
# Purpose:      Print script --usage option.
# Returns:      Sets EX_OK exit code
# Parameteres:  None
# Throws:       None
# Comments:     None
# See Also:     ols_help, ols_version
# Source:       bash
#
#---------------------------------------------------------------------------------------------------

function ols_usage() {

# Print the scripts synopsis and exit with a usage exit code.

    printf "%s\n\t%s\n\t%s\n\t%s\n" \
                  "$SCRIPT_NAME [--input=input_file | -i input_file]" \
                  "[--output=output_file | -o output_file] [--help]" \
                  "[--log] [--log=log_file] [--quiet | -q] [--usage] [--debug]" \
                  "[--version] [--verbose] [--] [input_file ...]"

    ols_set_excode $EX_OK

} # ols_usage

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
#---------------------------------------------------------------------------------------------------
#
# Usage:        ols_version
# Purpose:      Print release date, version no., and copyright notice.
# Returns:      Sets EX_OK exit code
# Parameteres:  None
# Throws:       None
# Comments:     None
# See Also:     ols_help, ols_usage
# Source:       bash
#
#---------------------------------------------------------------------------------------------------
function ols_version() {

# Print the release date and version number and exit with usage exit code.
    
    printf "%s\n" "$SCRIPT_NAME $REL_DATE Version: $VERSION"
    printf "%s\n" "$SCRIPT_NAME is licensed under CC BY 4.0 by Mark J. Jensen."

    ols_set_excode $EX_OK

} # ols_version

# See the include man.pod at the bottom of this script.



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
        -i | --input   ) ols_load_input   "$2";     shift  2;;
        -o | --output  ) ols_load_output  "$2";     shift  2;;
             --debug   ) ols_debug;                 shift   ;;
        -q | --quiet   ) ols_verbose      -1;       shift   ;;
        -v | --verbose ) ols_verbose      +1;       shift   ;;
             --log     ) ols_log                    shift   ;;
             --version ) ols_version;     ols_end;  shift   ;;
             --usage   ) ols_usage;       ols_end;  shift   ;;
             --help    ) ols_help;        ols_end;  shift   ;;
             --        ) shift;                     break   ;;
             *         ) ols_usage;       ols_end   shift   ;;
    esac # case
done # while

# Process remaining input files.

for input_file in "$@"; do
    input_file="$1"
    ols_input "$input_file"
    shift  
done  # for input_file

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










# Include user documentation.

cat >/dev/null <</*

=head1 Name

B<E<lt>${SCRIPT_NAME}E<gt>> E<mdash> E<lt>One-line description of this script's purposeE<gt>

=head1 Synopsis

B<E<lt>${SCRIPT_NAME}E<gt>>
[B<--input>=F<input_file> | B<-i> F<input_file>]
[B<--output>=F<output_file> | B<-o> F<output_file>]
[B<--help>]
[B<--log>]
[B<--log=F<log_file>>]
[B<--quiet>]
[B<--usage>]
[B<--debug>]
[B<--version>]
[B<--verbose>]
[B<-->]
[F<input_file> ...]

=head1 Description

Copy B<E<lt>${SCRIPT_NAME}E<gt>> into your new script file. Change B<E<lt>${SCRIPT_NAME}E<gt>> to your new script name.
Update L<"/Synopsys"> and L<"/Options & Arguments"> section.

Remove sections that do not apply.

Write a detailed describe of the function of B<E<lt>${SCRIPT_NAME}E<gt>>. What does it do?

May include numerous subsections (I<i.e.>, =head2, =head3, I<etc.>).

=head1 Options & Arguments

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


=head2 Standard Options

=over 4

=item [B<--input>=F<input_file> | -i F<input_file>]

Input file, default is standard in, F<STDIN>.
Single dash,
C<->,
means read from F<STDIN>.

=item [B<--output>=F<output_file> | -o F<output_file>]

Output file, default is standard out, F<STDOUT>.

B<Note:> Do not use the same file as an input_file and as an output_file.

Single dash,
C<->,
means write to F<STDOUT>.

=item [B<--help>]

Print the help message to standard error, F<STDERR>, and exit.

=item [B<--log>]

Log significant events to B<F<${SCRIPT_NAME}.log>>.

=item [B<--logfile=F<log_file>>]

Log significant events to B<F<${SCRIPT_NAME}.log>>.

=item [B<--quiet>]

Only print fatal error messages to F<STDERR>.

=item [B<--usage>]

Print the usage message to standard error, F<STDERR>, and exit.

=item [B<--debug>]

Turn on the debug switch.

=item [B<--version>]

Print the version, copyright, and license message
to standard error, F<STDERR>, and exit.

=item [B<--verbose>]

Turn on the verbose switch.

=item [B<-->] File list marker

The the double dash, C<-->,
on the command line signals the end options.
The remaining items arguments,
even if some look like options.

=back

=head2 Arguments

Only file names are allowed to be arguments.
For all other items use options.

=over 4

=item [F<input_file>]

Input file, default is standard in, F<STDIN>.
Single dash,
C<->,
also means read from F<STDIN>.

=back

=head1 STDIN

=head2 Input Files

=head1 STDOUT

=head1 STDERR

=head1 Security

B<NOTE:> You must be the superuser to run this script.

B<WARNING:> This script contains security info.
Do not set world-readable. Better yet, redesign
so that security information is not saved
in your source code.

This script does not need root/superuser/administrator
permission to function.

This script does not contain any security info.

=head1 Examples

Multiple input files are valid, I<e.g.>,

 B<E<lt>${SCRIPT_NAME}E<gt>> -i file1 --input=file2 file3 file4 file5

A single output file is valid, I<e.g.>,

 B<E<lt>${SCRIPT_NAME}E<gt>> -i file1 -o output.file

Insert instructive examples here.



=head1 Notes & Caveats


=head2 Warning: Input file and Output File Restriction

Do not use the same file as an input and output in the same command of B<E<lt>${SCRIPT_NAME}E<gt>>. You will
destroy your data. B<E<lt>${SCRIPT_NAME}E<gt>> checks for --input and --output being equal; however,
you should not do

E<0x10062> ${SCRIPT_NAME} --input=file_one >file_one E<0x10062>

=head1 Diagnostics

A list of every error and warning message that the script can generate
(even the ones that will E<ldquo>never happenE<rdquo>), with a full explanation
of each problem, one or more likely causes, and any suggested remedies.

=head2 ZZZ9999X

routine: Error message

=head3 Severity

Fatal Error, Exit Code 16

=head3 Explanation

Why was this error message generated.

=head3 System Action

The system action depends upon the error conditions described in the accompanying messages.

=head3 User Response

See the specific error message to determine the user action.

=head3 Programmer Response

See the specific error message to determine the programmer action.

=head3 System Programmer Response

See the specific error message to determine the system programmer action.

=head1 Configuration & Environment

No environmental variables were hurt during the development of this script.

=head1 Dependencies

A list of all of the other scripts that
this script relies upon,
including any restrictions on versions,
part of this script's distribution,
or must be installed separately.

=head1 Incompatabilities

The programmer and user can not use this script with the following commands.
This restriction may be due to name conflicts in the interface, competition
for system or program resources, or internal limitations of BASH (for example,
many modules that use source code filters are mutually incompatible).

=head1 Files

A list of the files that are used by this script.

=head1 Standards

A list of the standards that this script complies with.

=head1 Version

Version 0.0.1

=head1 History

 Version  | Author         | Description     | Date       |
 0.0.1    | Mark J. Jensen | Initial Release | 2025-99-99 |

=head1 Bugs & Limitations

A list of known problems with the module, together with some indication of
whether they are likely to be fixed in an upcoming release.

Also, a list of restrictions on the features the module does provide:
data types that cannot be handled,
performance issues
and the circumstances in which they may arise,
practical limitations on the size of data sets,
special cases that are not (yet) handled, etc.

The initial release usually just has:

There are no known bugs in this script.

Please report problems to Mark Jensen.

Patches are welcome.

=head1 Incompatibilities

A list of any known scripts that this script cannot be used in conjunction with.
This may be due to name conflicts in the interface, or competition for system
or program resources, or due to internal limitations of BASH.

=head1 Resources

=over 4

=item Barrett I<et al.> 2005

Daniel J. Barrett, Richard E. Silverman, and Robert G. Byrnes.
2005.
I<SSH, the Secure Shell: The Definitive Guide>,
2nd Edition.
(Sebastopol: OE<rsquo>Reilly Media)

=item Robbins and Beebe 2005

Arnold Robbins and Nelson H. F. Beebe.
2005.
I<Classic Shell Scripting>.
(Sebastopol: OE<rsquo>Reilly Media)

=back

=head1 See Also

B<ols_begin>

=head1 Copyright & License

B<${SCRIPT_NAME}> is licensed under
L<CC BY 4.0|https://creativecommons.org/licenses/by/4.0/?ref=chooser-v1>
by L<Mark J. Jensen|https://www.linkedin.com/in/jensenmark/>.

=head1 Author

Mark Jensen E<lt>mark@jensen.netE<gt>

=head1 Source

%Note%: Add the link for B<${SCRIPT_NAME}> after merging back into the master branch.
B<${SCRIPT_NAME}> may be found at [xxx](yyy).

=cut


/*