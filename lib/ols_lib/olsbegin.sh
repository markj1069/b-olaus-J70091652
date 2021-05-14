# ols_begin - Olaus BASH Shell Housekeeping Function at Beginning of Script

cat >/dev/null <<'/*'

=head1 NAME

ols_begin - Olaus BASH Shell Housekeeping Function at Beginning of Script

=head1 SYNOPSIS

. $OLSLIB/ols_begin.sh

ols_begin 

=head1 DESCRIPTION

=head1 SUBROUTINES/FUNCTIONS/METHODS

=head1 SECURITY

B<ols_begin> does not need to run as root.

=head1 AVAILABILITY

=head1 EXAMPLES

=head1 NOTES

=head1 CAVEATS

=head1 DIAGNOSTICS

=head1 RETURN STATUS

=over 4

=item EX_OK

=back

=head1 DEPENDENCIES

=head1 INCOMPATABILITIES

=head1 CONFIGURATION AND ENVIRONMENT

=over 4

=item DATE

=item EX_OK

B<errmsg>, 

=item PGMDATE

=item PGMREL

=item YEAR

=back

=head1 FILES

=head1 STANDARDS

=head1 VERSION

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-22 - Function created by nuf ver. 3.0.0

=head1 RESOURCES

=head1 BUGS AND LIMITATIONS

=head1 SEE ALSO

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2006 Texas Instruments. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

=over 4

=item 1.

Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

=item 2.

Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

=back

THIS SOFTWARE IS PROVIDED BY TEXAS INSTRUMENTS ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL TEXAS INSTRUMENTS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

The views and conclusions contained in the software and
documentation are those of the authors and should not be interpreted
as representing official policies, either expressed or implied, of
Texas Instruments.

=cut

/*

declare -a SYSIN=('')            # Input  files
declare -a SYSOUT=('')           # Output files

function olsbegin() {

  # Setup default Exception Handeling
    trap 'ols_signal SIGTERM' SIGTERM  # Process Terminal signal
    trap 'ols_signal SIGHUP'  SIGHUP   # Process Hang Up signal
    trap 'ols_signal SIGINT'  SIGINT   # Cleanup after cntl-C
    trap 'ols_signal EXIT'    EXIT     # Insure a graceful exit
    trap 'ols_signal ERR'     ERR      # Trap failing commands

  # Make some pretty date strings
    DATE=$(date +'%Y-%m-%d')
    YEAR=$(date +'%Y')
    readonly DATE
    readonly YEAR

    return $EX_OK
} # end olsbegin

