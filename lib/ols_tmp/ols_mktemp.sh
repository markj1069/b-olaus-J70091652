# ols_mktemp - make and remember a unique temporary filename

# Keep track of temporary filenames.
export   OLSMKT=$(mktemp -t OLSMKT.XXXXXXXX)
readonly OLSMKT

cat >/dev/null <<'/*'

=head1 NAME

ols_mktemp - make and remember a unique temporary filename

=head1 SYNOPSIS

B<ols_mktemp> I<template>

=head1 DESCRIPTION

B<ols_mktemp> returns a temporary filename built by mktemp.

The temporary file is built in one of the following directories:

=over 4

=item 1.

$TMPDIR

=item 2.

$TEMP

=item 3.

~/tmp

=item 4.

/tmp

=back

=head1 ARGUMENTS

=over 4

=item I<template>

A filename template with trailing Xs (optional),
for example, "xspy_sed_XXXX".
If no template is specified, a default of
"tmp.XXXXXXXXXX" is used.

=back

=head1 EXAMPLES

=head2 Personal temporary directory

    TMPDIR=~/tmp
    sed_file=$(ols_mktemp sed.XXXX)
    echo $sed_file

results in

    /cygdrive/c/Documents and Settings/a0214394/tmp/sed.4212

=head2 System temporary directory

    TMPDIR=
    tmp_file=$(ols_mktemp)
    echo $tmp_file

results in

    /tmp/tmp.lEpAvh4624

=head2 Working directory

    TMPDIR=.
    tmp_file=$(ols_mktemp)
    echo $tmp_file

results in

    ./tmp.RdyxIl4276

=head1 DIAGNOSTICS

mktfile: cannot make temporary file, directory/template

=head1 ENVIRONMENT

=over 4

=item _OLSMKT

Array to remember temporary file names.

=item TEMP

Variable pointing to desired temporary directory.

=item TMPDIR

Variable pointing to desired temporary directory.

=back

=head1 FILES

mktfile creates temporary files.

=head1 VERSION

$Id: mktfile.sh 87 2006-09-13 17:06:10Z a0214394 $

$URL: file:///cygdrive/c/svn/olaus/trnk/src/bash/mktfile/mktfile.sh $

=head1 BUGS

=over 4

=item Directory Existance

B<ols_mktemp> does not check for the existance
of a directory at $TMPDIR or $TEMP.

=back

=head1 SEE ALSO

B<mktemp>, B<ols_clean>

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-12 - Function created by nuf ver. 3.0.0

=cut

/*
function ols_mktemp()
{
  # Test for argument.
    set +o nounset
    local template
    if [[ "$1" = "" ]]; then template="tmp.XXXXXXXXXX"
    else                     template=$1
    fi

    if [[ $OLSTMPQUEUE[0]!=$OLSSTACK ]]
    then
        list_queue_new OLSTMPQUEUE
    fi

    local tmp_dir
    if [[   -n "$TMPDIR"   ]]; then tmp_dir="$TMPDIR"
    elif [[ -n "$TEMP"     ]]; then tmp_dir="$TEMP"
    elif [[ -d "$HOME/tmp" ]]; then tmp_dir="$HOME/tmp"
    else                            tmp_dir="/tmp"
    fi
    set -o nounset

  # Build temporary file, error if it cannot be made.
    local tmp_file
    tmp_file=$(mktemp -q "${tmp_dir}/${template}") \
        || error_exit \
          "mktfile: cannot make temporary file, ${tmp_dir}/${template}"
    list_queue_push OLSTMPQUEUE tmp_file

    echo $tmp_file

    return $EX_OK
} # end ols_mktemp
