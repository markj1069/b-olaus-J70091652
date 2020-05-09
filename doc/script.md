---
title: "%script-name% — One-line description of this script&rsquo;s purpose%"
author:
    - Mark Jensen
keywords: [script, markdown, man page, template]
date: 05 MAY 2020
abstract: |
Script.md is a markdown template for a man page for your script.

1. Replace %script-name% with your program name.
2. Add your options to the SYNOPSIS and OPTIONS sections.
3. Complete the DESCRIPTION section.
4. Delete sections that you do not need to document.
...

# NAME

**%script-name%** -- %**One-line description of this script&rsquo;s purpose**%

# SYNOPSIS

**%script-name%** %**add your options here**%
[-i _input file_]*
[--input=_input file_]*
[-o _output file_]
[--output=_output file_]
[--debug]
[-q]
[--quiet]
[-v]
[--verbose[=_verbose level_]]
[--log[=_logfile_]]
[--version]
[--usage]
[--man]
[_input file_]*

# OPTIONS

| **Name**          |      **Value**     | **Description**                             |
|-------------------|:------------------:|---------------------------------------------|
| **Options**       |                    | **Custom Options**                          |
| %**--Custom**%    | %**Custom Value**% | %**Custom option description**%             |
| **Options**       |                    | **Standard Options**                        |
| [--input \| -i]*  | _input file_       | Specify input source (Default: STDIN)       |
| [--output \| -o]  |    _output file_   | Specify output destination (Default STDOUT) |
| [--debug]         |                    | Include debugging info on STDOUT            |
| [--quiet \| -q]   |                    | Run silent, opposite of verbose.            |
| [--verbose \| -v] |   [verbose level]  | --quiet is equivalent to level 0            |
| [--log]           |     [_logfile_]    | Log significant events to _logfile_         |
| [--version]       |                    | Print version information                   |
| [--usage]         |                    | Print the Synopsys line for this script     |
| [--help]          |                    | Print the summary for this script           |
| [--man]           |                    | Print the complete man page for this script |
|                   |                    |                                             |
| **Arguments**     |                    |                                             |
| [_input file_]*   |                    | Multiple _input files_ are supported        |

## Custom Options

%**Add your custom option descriptions here.**%

### [--%custom%=%value%]

Enter description of custom option.

## Standard Options

### [--input=_input file_ | -i _input file_]*

Input file, default is standard in, _STDIN_.
Single dash,
'-',
means read from _STDIN_.

### [--output=_output file_ | -o _output file_]

Output file, default is standard out, _STDOUT_.
Single dash,
'-',
means write to _STDOUT_.

### [--help | -h]

Print the help message to standard error, _STDERR_, and exit.

### [--log=_logfile_]

Copy all _STDOUT_ and _STDERR_ output to the _logfile_.
If the _logfile_ is not specified, use _%script-name%.log_>.

### [--man]

Print the man page to standard error, _STDERR_, and exit.

### [--quiet]

Only print fatal error messages to _STDERR_.
--quiet is equivalent to --verbose=0.

### [--usage]

Print the Synopsys Line to standard error, _STDERR_, and exit.

### [--debug]

Turn on the debug switch.

### [--version>]

Print the version, copyright, and license message
to standard error, _STDERR_, and exit.

### [--verbose=verboselvl]

Set the verbose level for this script. If no verboselvl is specified, the level is set to 2.
A verboselvl of 0 is equivalent to --quite. A verboselvl of 1 is normal.

### [--] File list marker

The the double dash, '--',
on the command line signals the end options.
The remaining items arguments,
even if some look like options.

## Arguments

Only file names are allowed to be arguments.
For all other items use options.

### [_input_file_]*

Input file, default is standard in, _STDIN_.
Single dash,
'-',
also means read from _STDIN_.

# DESCRIPTION

A full description of the script and its features.

May include numerous subsections _i.e._, head2, head3, _etc_.

=head2 System Identification

=over 4

=item SYSTEM ID

System Identification

=item COMPONENT ID

Component Identificaiton

=item PROGRAM ID

Program ID

=back

# CONTEXT

# IMPLEMENTATION NOTES

# RETURN VALUE

What does this script produce?

# EXIT STATUS

What exit codes exist?

# FILES

A list of the files that are used by this script.

# EXAMPLES

Insert instructive examples here.

# ERROR MESSAGES

A list of every error and warning message that the script can generate
(even the ones that will &ldquo;never happen&rdquo;), with a full explanation
of each problem, one or more likely causes, and any suggested remedies.

# OVERVIEW

# DEFAULTS

# ENVIRONMENT

No environmental variables were hurt during the development of this script.

# Availability

How to get this script.

# Notes & Caveats

What additional information would be useful to a user.

# CONFIGURATION

# DEPENDENCIES

A list of all of the other scripts that
this script relies upon,
including any restrictions on versions,
part of this script's distribution,
or must be installed separately.

# SEE ALSO

xxxyyyzzz

# STANDARDS COMPLIANCE

A list of the standards that this script complies with.

# NOTES

# VERSION

Version 0.0&mdash;Initial Release

# HISTORY

Version 0.1&mdash;Bug fix
Version 0.0&mdash;Initial Release

# BUGS & LIMITATIONS

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

# INCOMPATIBILITIES

A list of any known scripts that this script cannot be used in conjunction with.
This may be due to name conflicts in the interface, or competition for system
or program resources, or due to internal limitations of BASH.

# RESOURCES

* Barrett _et al._ 2005

Daniel J. Barrett, Richard E. Silverman, and Robert G. Byrnes.
2005.
_SSH, the Secure Shell: The Definitive Guide_,
2nd Edition.
(Sebastopol: O&rsquo;Reilly Media)

* Robbins and Beebe 2005

Arnold Robbins and Nelson H. F. Beebe.
2005.
_Classic Shell Scripting_.
(Sebastopol: O&rsquo;Reilly Media)

# COPYRIGHT & LICENSE

Copyright: (c) 2020, Mark Jensen. All Rights Reserved.

License: BSD 2-Clause License

# AUTHOR

[Mark Jensen](mailto:mark@jensen.net)

# SECURITY CONSIDERATIONS

**Note:** You must be the superuser to run this script.

**Warning:** This script contains security info.
Do not set world-readable. Better yet, redesign
so that security information is not saved
in your source code.

# COLOPHON
