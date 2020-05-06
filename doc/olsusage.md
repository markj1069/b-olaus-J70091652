% title olsusage &mdash; Print Program Synopsys and Exit

# Name olsusage &mdash; print usage help and exit

# Synopsis

olsusage("synopstring")

| Argument        | **Description**  |
|-----------------|------------------|
| **synopstring** | Program Synopsis |

# Description

Print the program synopsis on _STDERR_ and exit with a return code of EX_USAGE.

# Argument

olsusage has a single argument.

## synopstring

A string containing the program synopsis, _e.g._,

```shell
olserr number EX_CODE Message
```

# Security

You do not need to be the superuser/root to run this function.

This function contains no secure/classified information.

# Examples

## Usage Example for the perl Program

```shell
olsusage("perl [switches] [--] [programfile] [arguments]")
```

produces

```console
Usage: perl [switches] [--] [programfile] [arguments]
```

with an exit code of EX_USAGE.

## Usage Example for the grep Program

```shell
olsusage("Usage: grep [OPTION]... PATTERN [FILE]...")
```

produces

```console
Usage: grep [OPTION]... PATTERN [FILE]...
```

with an exit code of EX_USAGE.

## Usage Example for the kill Program

```shell
olsusage("kill [-s sigspec | -n signum | -sigspec] pid | jobspec ... or kill -l [sigspec]")
```

produces

```console
Usage: kill [-s sigspec | -n signum | -sigspec] pid | jobspec ... or kill -l [sigspec]
```

with an exit code of EX_USAGE.

# Notes & Caveats

# Diagnostics

## OLSLIB7000F olsusage: Missing required synopsys argument

### Explanation

The program synopsis argument was not supplied.

### Standard Corrective Action

The program is ended with an exit code of EX_SOFTWARE.

### Programmer Response

Make sure that olsusage has a string argument containing
the program sysopsis.

# Return Codes

* EX_SOFTWARE &mdash; Usage called without an argument.
* EX_USAGE &mdash; Normal return code for usage.

# Configuration & Environment

* EX_CODE is set by olserr and olsrc within Usage
  
# Files

**olsusage** writes to _STDERR_.

# Standards

**olsusage** was tested under

* GNU bash, version 4.4.12(3)-release (x86_64-unknown-cygwin)

# Version

A2.0.0

# See Also

olsdef

# Author

[[Mark J Jensen](mailto:mark@jensen.net)]

# Colophon

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