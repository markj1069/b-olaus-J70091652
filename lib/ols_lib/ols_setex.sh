function ols_setex()
{
    if [[ -z "$1" ]]; then
        ols_err 7001 $EX_SOFTWARE "ols_setex: missing argument 1, ex_code"
    else
        local -i ex_code=$1
    fi

    if [[ $EX_CODE -lt $ex_code ]]; then EX_CODE=$ex_code; fi
    
    return $EX_CODE
} # end ols_setex

cat >/dev/null <<'=cut'

=head1 NAME

setexcode - set the exit code for a program.

=head1 SYNOPSIS

B<setexcode> I<ex_code>

=head1 DESCRIPTION

B<setexcode> remembers the highest exit code set
in the EX_CODE global variable.
EX_CODE is initialized to 0 (successful termination)
in the Olaus General Symbol Definitions file,
F<olausdef.sh>.

=head1 ARGUMENTS

=over 4

=item I<xcode>

(required) Exit Code and Severity of message.
The exit code definitions are defined
in the Olaus General Symbol Definitions file,
F<olausdef.sh>.

=back

=head1 SECURITY

B<setexcode> does not require root access.
It does not contain security information.

=head1 AVAILABILITY

B<setexcode> is available as part of the Olaus Library

=head1 EXAMPLES

    setexcode $EX_USAGE

=head1 NOTES & CAVEATS

=head1 DIAGNOSTICS

=head2 7001 missing argument

=over 4

=item Error Code

7001

=item Error Message

[FUNCNAME]: missing argument [NUMBER], [AUGUMENT_NAME]

=item Severity Level

Fatal - 70

=item Message Origin

[FUNCNAME]

=item Message Audience

Programmer

=item Problem Determination

Argument left off [FUNCNAME] call.

=item User Response

Include the appropriate Argument in [FUNCNAME] call.

=item System Action

The program exits with an exit code of 70.

=back

=head1 ENVIRONMENT

=over 4

=item EX_CODE

Current exit code.

=item EX_OK

Successful termination

=item EX_SOFTWARE

Internal software error

=back

=head1 FILES

=over 4

=item F<olsdef.sh>

Olaus General Symbol Definitions

=back

=head1 STANDARDS

=head1 VERSION

$Date: 2007-05-09 12:38:51 -0500 (Wed, 09 May 2007) $

$Rev: 203 $

$URL: file:///cygdrive/c/svn/olaus/trnk/src/bash/lib/setexcode.sh $

$Id: setexcode.sh 203 2007-05-09 17:38:51Z a0214394 $

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2007-03-10 - Function created by nuf ver. 3.0.0

=head1 RESOURCES

=head1 BUGS

When I<xcode> is not numeric,
it is interpreted as zero
without an error message.

=head1 SEE ALSO

B<olsbegin>, B<errmsg>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2013 Mark Jensen.
Copyright (c) 2007 Texas Instruments.

include(license.txt)

=cut
