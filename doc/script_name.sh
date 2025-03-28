#! /usr/bin/env bash

source $OLSLIB

VERSION="0.1.0"
REL_DATE="9999-99-99"
BASENAME=$(basename $0)
SCRIPT_NAME=${BASENAME%.*}

function input() {

    return

} # input

function output() {

    OLS_OUT_FILE="$1"

    return

} # output

function help() {

# Print the <script_name> help and exit with a usage exit code.

    version

    usage

    printf "\n%s\n" "Options & Arguments"

    printf "%s\n" "| **Options**     |   Option Value  | Description                                  |"
    printf "%s\n" "|-----------------|:---------------:|----------------------------------------------|"
    printf "%s\n" "| --input   | -i  |  input_file     | Specify input source [Default: STDIN]        |"
    printf "%s\n" "| --output  | -o  |  output_file    | Specify output destination [Default: STDOUT] |"
    printf "%s\n" "| --debug         |                 | Include debugging info on STDOUT             |"
    printf "%s\n" "| --quiet   | -q  |                 | Run silent, opposite of verbose.             |"
    printf "%s\n" "| --verbose | -v  |                 | Opposite of --quiet                          |"
    printf "%s\n" "| --logfile       |  log_file       | Log significant events to log_file           |"
    printf "%s\n" "| --log           |                 | Log significant events to script_name.log    |"
    printf "%s\n" "| --version       |                 | Print version information                    |"
    printf "%s\n" "| --usage         |                 | Print the usage line for this program        |"
    printf "%s\n" "| --help          |                 | Print summary for this program               |"
    printf "%s\n" "|                 |                 |                                              |"
    printf "%s\n" "| **Arguments**   |                 |                                              |"
    printf "%s\n" "| input_file      |                 | Multiple input_files are supported           |"
    printf "\n"

    ols_set_excode $EX_USAGE


} # help

function log() {

    OLS_LOG=$TRUE
    OLS_LOG_FILE="$1"

    return

} # log

function verbose() {

    OLS_VERBOSE="$1"

    return

} # verbose

function usage() {

# Print the <script_name> Synopsis and exit with a usage exit code.

    printf "%s\n\t%s\n\t%s\n\t%s\n" \
                  "$SCRIPT_NAME [--input=input_file | -i input_file]" \
                  "[--output=output_file | -o output_file] [--help]" \
                  "[--log] [--log=log_file] [--quiet | -q] [--usage] [--debug]" \
                  "[--version] [--verbose] [--] [input_file ...]"

    ols_set_excode $EX_USAGE

} # usage

function debug() {

    OLS_DEBUG=$TRUE
    return

} # debug

function version() {

# Print the release date and version number and exit with usage exit code.
    
    printf "\n%s\n\n" "$SCRIPT_NAME $REL_DATE Version: $VERSION"

    ols_set_excode $EX_USAGE

} # version

# Use getopt to process the command, format the argument in a consistant format.

PARSED_ARGUMENTS=$(getopt -a -n script_name -o i:o:qv --long input:,output:,debug,quiet,verbose,logfile:,log,version,usage,help -- "$@")
VALID_ARGUMENTS=$?

if (("$VALID_ARGUMENTS" != "0" )); then
    usage
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
             *         ) echo "Unexpected Option: $1";    usage   ;;
    esac # case
done # while

# Process remaining input files.


exit











: <<=cut
=head1 Name

E<lt>script_nameE<gt> E<mdash> E<lt>One-line description of this script's purposeE<gt>

=head1 Synopsis

B<script_name>
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

Copy B<script_name> into your new script file. Change B<script_name> to your new script name.
Update L<"/Synopsys"> and L<"/Options & Arguments"> section.

Remove sections that do not apply.

Write a detailed describe of the function of B<script_name>. What does it do?

May include numerous subsections (I<i.e.>, =head2, =head3, I<etc.>).

=head1 Options & Arguments

 | **Options**     |   Option Value  | Description                                  |
 |-----------------|:---------------:|----------------------------------------------|
 | --input   | -i  |  input_file     | Specify input source [Default: STDIN]        |
 | --output  | -o  |  output_file    | Specify output destination [Default: STDOUT] |
 | --debug         |                 | Include debugging info on STDOUT             |
 | --quiet   | -q  |                 | Run silent, opposite of verbose.             |
 | --verbose | -v  |                 | Opposite of --quiet                          |
 | --logfile       |  log_file       | Log significant events to log_file           |
 | --log           |                 | Log significant events to script_name.log    |
 | --version       |                 | Print version information                    |
 | --usage         |                 | Print the usage line for this program        |
 | --help          |                 | Print summary for this program               |
 |                 |                 |                                              |
 | **Arguments**   |                 |                                              |
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
Single dash,
C<->,
means write to F<STDOUT>.

=item [B<--help>]

Print the help message to standard error, F<STDERR>, and exit.

=item [B<--log>]

Log significant events to _B<F<script_name.log>.

=item [B<--logfile=F<log_file>>]

Log significant events to F<script_name.log>

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

Insert instructive examples here.

=head1 Notes & Caveats

What additional information would be useful to a user.

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

B<script_name> is licensed under
L<CC BY 4.0|https://creativecommons.org/licenses/by/4.0/?ref=chooser-v1>
by L<Mark J. Jensen|https://www.linkedin.com/in/jensenmark/>.

=head1 Author

Mark Jensen E<lt>mark@jensen.netE<gt>

=head1 Source

B<script_name> may be found at [xxx](yyy).

=cut
