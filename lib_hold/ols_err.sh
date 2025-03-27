# olserr -- Print an Olaus Shell Library Error Message

function ols_err() {
    if [[ -z "$1" ]]
    then
        ols_err 7001 $EX_SOFTWARE "${FUNCNAME}: Augument #1 missing, num"
    else
        local num=$(printf "%4u" "$1"); num=${num// /0}
    fi
    if [[ -z "$2" ]]
    then
        ols_err 7002 $EX_SOFTWARE "${FUNCNAME}: Augument #2 missing, ex_code"
    else
        local ex_code=$2
    fi
    shift 2
    if [[ -z "$1" ]]; then
        ols_err 7003 $EX_SOFTWARE "${FUNCNAME}: Augument #3 missing, msg"
    else
        local msg="$*"
    fi

    case $ex_code in
        ( $EX_OK      ) local sev="I";;
        ( $EX_WARNING ) local sev="W";;
        ( $EX_ERROR   ) local sev="E";;
        ( $EX_SEVERE  ) local sev="S";;
        ( *           ) local sev="F";;
    esac

    printf "%s%s%s%s%s\n" $PGMID $num $sev ' ' "$msg" >&2

    ols_set_excode $ex_code
    if [[ $sev ==  "F" ]]; then ols_end; fi
    
    return $EX_CODE
} # end ols_err

cat >/dev/null <<'=cut'

=head1 NAME

ols_err - write an error message to STDERR, set exit code, exit if fatal.

=head1 SYNOPSIS

ols_err num ex_code msg

=head1 DESCRIPTION

=head1 ARGUMENTS

=over 4

=item I<num>

(required) Error message number.

=item I<ex_code>

(required) Exit Code and Severity of message.

=item I<msg>

(required) Error message text. 

=back

=head1 SECURITY

B<ols_err> does not require root access.

=head1 AVAILABILITY

=head1 EXAMPLES

    ols_err 7001 $EX_SOFTWARE "${FUNCNAME}: missing argument 1, num"

=head1 NOTES

=head1 CAVEATS

=head1 DIAGNOSTICS

=head1 ENVIRONMENT

=over 4

=item EX_CODE

Current exit code.

=item PGMID

Program ID, see B<olausbegin>.

=back

=head1 FILES

=head1 STANDARDS

=head1 VERSION

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

Re

$Revision: 162 $

$Id: ols_err.sh 162 2007-03-13 00:19:18Z a0214394 $

2006-09-17 - Function created by nuf ver. 3.0.0

=head1 RESOURCES

=head1 BUGS

=head1 SEE ALSO

B<olausbegin>, B<setexcode>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2013, Mark Jensen.

include(licsense.txt)

=cut

