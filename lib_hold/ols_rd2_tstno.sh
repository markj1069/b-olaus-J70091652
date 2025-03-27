# ols_bmp_tstno - Bump, write & return the Olaus Test No.

cat >/dev/null <<'/*'

=head1 NAME

B<ols_bmp_tstno> - Bump, write & return the Olaus Test No.

=head1 SYNOPSIS

NUM=$(B<ols_bmp_tstno>)

=head1 DESCRIPTION

B<ols_bmp_tstno> reads the Olaus Test No., I<NUM> from a temporary files,
increments it by 1, and writes it to standard out.

=head1 EXAMPLE

    NUM=$(B<ols_bmp_tstno>)

=head1 DIAGNOSTICS

ols_clean: cannot remove $file

=head1 ENVIRONMENT

=over 4

=item OLSMKT

A temporary file to remember temporary file names.

=back

=head1 FILES

OLKMKT

clsfile removes temporary files.

=head1 VERSION

Version V00.00.00

=head1 BUGS

=head1 SEE ALSO

mktemp, mktfile

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

   Date      Version   Description
2025-03-08  V00.00.00  Function created by Mark

=cut

/*
function ols_bmp_tstno() {

    # Synopsis: ols_bmp_tstno NUM

    trap '' EXIT                       # No need to trap exit here

    exit $EX_CODE                      # exit with exit code we have been tracking

} # end ols_bmp_tstno
