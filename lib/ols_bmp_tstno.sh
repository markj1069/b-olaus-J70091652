# ols_rd_tstno - Read Olaus Test Number from temporary file.

cat >/dev/null <<'/*'

=head1 NAME

B<ols_rd_tstno> - Read Olaus Test No. from a temporary file.

=head1 SYNOPSIS

NUM=$(B<ols_rd_tstno>)

=head1 DESCRIPTION

B<ols_rd_tstno> reads the Olaus Test No., I<NUM> from a temporary files and writes it to standard out.

=head1 EXAMPLE

    NUM=NUM=$(B<ols_rd_tstno>)

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

    # Increment the TAP Test Number by 1

    NUM=$(ols_rd_tstno)
    NUM=$((NUM+1))
    ols_wt_tstno $NUM

} # end ols_bmp_tstno
