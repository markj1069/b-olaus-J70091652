## Error Messages

### AAA9999Z

Error Message

#### Severity: Information

An informational message leaves the exit unchanged.

#### Severity: Warning

A warning message insures the exit code is greater than or equal to 4.

#### Severity: Error

An error message insures the exit code is greater or equal to 8.

#### Severity: Severe Error

A severe error insures the exit code is greater or equal to 12.

#### Severity: Fatal Error

A fatal error aborts the program and insures the exit code is greater or equal to 16.

#### Explanation:

#### User Response:

#### Programmer Response:

#### System Programmer Response:

## Exit Codes

Exit code definitions:

| Prog Var       | Num Val | Description                            |
|:---------------|--------:|:---------------------------------------|
| EX_OK          |       0 |  Successful termination
| EX_WARNING     |       4 |  Warning
| EX_ERROR       |       8 |  Error
| EX_SEVERE      |      12 |  Severe error
| EX_FATAL       |      16 |  Fatal error
| EX_BASE        |      64 |  Base value for error messages
| EX_USAGE       |      64 |  Command line usage error
| EX_DATAERR     |      65 |  Data format error
| EX_NOINPUT     |      66 |  Cannot open input
| EX_NOUSER      |      67 |  Addressee unknown
| EX_NOHOST      |      68 |  Host name unknown 
| EX_UNAVAILABLE |      69 |  Service unavailable
| EX_SOFTWARE    |      70 |  Internal software error
| EX_OSERR       |      71 |  System error (_e.g._, can't fork)
| EX_OSFILE      |      72 |  Critical OS file missing
| EX_CANTCREAT   |      73 |  Can't create (user) output file
| EX_IOERR       |      74 |  Input/output error
| EX_TEMPFAIL    |      75 |  Temp failure; user is invited to retry
| EX_PROTOCOL    |      76 |  Remote error in protocol
| EX_NOPERM      |      77 |  Permission denied
| EX_CONFIG      |      78 |  Configuration error
| EX_MISSINGFILE |      79 |  A file is missing
| EX_CANTC8TEMP  |      80 |  Can't create temporary file
| EX_ASSERTFAIL  |      81 |  Assertion failed
| EX_CANTC8LOCK  |      82 |  Can't create lock file.
| EX_USERABORT   |      83 |  Aborted by user
| EX_TERMINATION |      84 |  Trapped termination interrupt
| EX_TRAPINT     |      85 |  Trapped interrupt
| EX_TESTMAXERR  |     254 |  Maximum error count for Olaus Test
| EX_TESTBAIL    |     255 |  BAIL_OUT function terminated script
 | 
