% title olsusage&mdash;Print Program Synopsis and Exit

# NAME

olsusage -- Print Program Synopsis and Exit

# Synopsis

olsusage "synopis"

| Argument     | **Description**  |
|--------------|------------------|
| **synopsis** | Program Synopsis |

# Description

Print the program synopsis on _STDIN_ and exit with a return code of EX_OK.

# ARGUMENTS

olsusage has a single argument.

## synopsis

A string containing the program synopsis, _e.g._,

```shell
olserr number EX_CODE Message
```

# SECURITY

You do not need to be the superuser/root to run this function.

This function contains no secure/classified information.

# EXAMPLES

## Usage Example for the perl Program

```shell
olsusage "perl [switches] [--] [programfile] [arguments]"
```

produces

```console
Usage: perl [switches] [--] [programfile] [arguments]
```

with an exit code of EX_OK.

## Usage Example for the grep Program

```shell
olsusage "Usage: grep [OPTION]... PATTERN [FILE]..."
```

produces

```console
Usage: grep [OPTION]... PATTERN [FILE]...
```

with an exit code of EX_OK.

## Usage Example for the kill Program

```shell
olsusage "kill [-s sigspec | -n signum | -sigspec] pid | jobspec ... or kill -l [sigspec]"
```

produces

```console
Usage: kill [-s sigspec | -n signum | -sigspec] pid | jobspec ... or kill -l [sigspec]
```

with an exit code of EX_OK.

# Notes & Caveats

# Diagnostics

## OLSLIB7000F olsusage: Missing required synopsis argument

### Explanation

The program synopsis argument was not supplied.

### Standard Corrective Action

The program is ended with an exit code of EX_OK.

### Programmer Response

Make sure that olsusage has a string argument containing
the program sysopsis.

# Return Codes

* EX_SOFTWARE&mdash;Usage called without an argument.
* EX_OK&mdash;Normal return code for usage.

# Configuration & Environment

* EX_CODE is set by olserr and olsrc within Usage

# Dependencies

* olserr
* olssetex
* olsend
  
# Files

**olsusage** writes to _STDIN_.

# STANDARDS tandards

**olsusage** was tested under

* GNU bash, version 4.4.12(3)-release (x86_64-unknown-cygwin)

# VERSION

A2.0.0

# SEE ALSO

olsdef

# AUTHOR

[[Mark J Jensen](mailto:mark@jensen.net)]

# COLOPHON

| Item      | Value           |
|-----------|-----------------|
| Language  | Pandoc Markdown |
| Filename  | _olsusage.md_   |
| Date      | 05 May 2020     |
| Publisher | Mark Jensen     |

The standard installation of the Olaus Shell Library produces man pages.
The other formats may be optionally installed.

| Format     | Filename           |
|------------|--------------------|
| HTML5      | _olsusage.html_    |
| man        | _olsusage.3_       |
| PDF        | _olsusage.pdf_     |
| Plain Text | _olsusage.txt_     |
| TextInfo   | _olsusage.texinfo_ |