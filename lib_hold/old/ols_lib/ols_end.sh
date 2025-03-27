# ols_end - Olaus BASH Shell Housekeeping Function at End of Script

cat >/dev/null <<'/*'

=head1 NAME

ols_end - Olaus BASH Shell Housekeeping Function at End of Script

=head1 SYNOPSIS

ols_end

=head1 DESCRIPTION

B<ols_end> removes temporary files created by mktfile.

=head1 EXAMPLE

    TMPDIR=.
    mktfile
    mktfile
    mktfile
    mktfile
    mktfile
    clsfile

results in

    ./tmp.oLQAKu3856
    ./tmp.YYPgYWa576
    ./tmp.bleTsL1664
    ./tmp.cQPswSq872
    ./tmp.JVydYl5792
    ./tmp.IinrNW1440
    /tmp/OLSMKT.SDwX6040

temporary files being removed.

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

$Revision$

$Id: clsfile.sh 87 2006-09-13 17:06:10Z a0214394 $

$URL: file:///cygdrive/c/svn/olaus/trnk/src/bash/clsfile/clsfile.sh $

=head1 BUGS

=head1 SEE ALSO

mktemp, mktfile

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-12 - Function created by nuf ver. 3.0.0

=cut

/*
function ols_end() {

    trap '' EXIT                       # No need to trap exit here

#   ols_rmtemp                         # Remove temporary files

    exit $EX_CODE                      # exit with exit code

} # end ols_end
