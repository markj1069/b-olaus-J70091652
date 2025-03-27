# olaus_end - Olaus program end housekeeping

function olaus_end() {

    trap '' EXIT                       # No need to trap exit here

    ols_rmtemp                         # Remove temporary files

    exit $EX_CODE                      # exit with exit code
    
} # end olaus_end

cat >/dev/null <<'=cut'

=head1 NAME

olaus_end - Olaus program end housekeeping

=head1 SYNOPSIS

olaus_end

=head1 DESCRIPTION

B<olaus_end> removes temporary files created by mktmpfile,
sets the exit code,
and then terminates the program.

=head1 EXAMPLE

    olaus_end

=head1 DIAGNOSTICS

(N/A)

=head1 ENVIRONMENT

(N/A)

=head1 FILES

Program temporary files are removed.

=head1 VERSION

$Date: 2007-05-09 12:38:51 -0500 (Wed, 09 May 2007) $

$Rev: 203 $

$Id: olaus_end.sh 203 2007-05-09 17:38:51Z a0214394 $

$URL: file:///cygdrive/c/svn/olaus/trnk/src/bash/lib/olaus_end.sh $

=head1 BUGS

(N/A)

=head1 SEE ALSO

mktmpfile, olaus_begin, rmtmpfile

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-12 - Function created by nuf ver. 3.0.0

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2007 Texas Instruments. All rights reserved.

include(license.txt)

=cut
