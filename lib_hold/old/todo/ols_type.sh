function ols_type() {
cat >/dev/null <<'/*'

=head1 NAME

ols_type - Return the path name to a command.

=head1 SYNOPSIS

B<ols_type> I<command>

=head1 DESCRIPTION

The path to I<command> is returned.
B<ols_type> used the path in I<command> if supplied.
If not supplied it uses the Bash builtin function type
to determine the path.

=head1 ARGUMENTS

=over 4

=item I<command>

(optional) command that you wish to find.
If I<command> is missing, B<ols_type> will use $0,
the command name of the current script.

=back

=head1 EXAMPLES

=head1 NOTES

=head1 CAVEATS

=head1 DIAGNOSTICS

=over 4

=item OLSLIB2006F Can not find I<command> path.

=over 4

=item Severity:

Fatal

=item User Response

Contact programmer for assistance
with the text of how you issued
the command.
You may use B<script> to capture
the input and output.

=item Programmer Response

It is debugging time.

=item System Action

Script terminates with error message.

=back

=back

=head1 ENVIRONMENT

=head1 FILES

=head1 STANDARDS

=head1 VERSION

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-18 - Function created by nuf ver. 3.0.0

B<ols_type> was designed to find
the comamnd path to allow
the Pod documentation to be extracted
for B<usage>, B<help>, and B<man>
fuctions.

=head1 RESOURCES

=head1 BUGS

Path of a command script is not found invoked as:

    bash script.sh

You can a find the path by invoking as

    bash ./script.sh

=head1 SEE ALSO

B<errmsg>, B<filepath>, B<filesffx>, B<type>

=head1 COPYRIGHT

=cut

/*
    local sffxlist="sh bash bat pl exe dll"

    if [[ -z "$1" ]]; then local cmd="$0" # Use current command
    else                   local cmd="$1" # if one is not supplied
    fi

    local fp=$(filepath "$cmd")  # Break command into
    local fx=$(filesfx  "$cmd")  # its interesting parts.

  # if a path has been supplied, then we have the command's long filename.
    if [[ "$fp" != "(N/S)" ]]; then echo "$cmd";  return $EX_OK; fi 

  # if type returns a path then use it as the command's long filename.
    local tcmd=$(type -p "$cmd")
    if [[ -n "$tcmd" ]]; then echo "$tcmd"; return $EX_OK; fi

  # Now try again with a suffex list of possible command endings.
    if [[ "$fx" =  "(N/S)" ]]; then
        for sx in $sffxlist; do
            tcmd=$(type -p "$cmd.$sx") && { echo "$tcmd"; return $EX_OK; }
        done
    fi
    errmsg $EX_MISSINGFILE 2006 "Can not find $cmd path."
    return $EX_MISSINGFILE # We should never get here.
} # end ols_type
