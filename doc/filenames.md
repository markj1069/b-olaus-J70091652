# Name filenames

**filenames**&mdash;functions operate on filename strings

## Synopsis

```bash
source $OLSLIB/filenames.sh  # Include filename functions.  
AB=$( fileabs  "$file" )     # Return absolute filename with path.
BN=$( filebase "$file" )     # Retuen basename of file.
FN=$( filename "$file" )     # Return simple filename w/o path.
FP=$( filepath "$file" )     # Return filename path.
FS=$( filesfx  "$file" )     # Return filename suffix.
```

### Arguments and Options

*file* is a string that contains the filename you are working with.


## Security

You **do not** need to be superuser or root to run these functions.

These functions **do not** contain security information.

## AVAILABILITY

How to get this function.

## EXAMPLES

The full filename with path used in these examples is:
*/qqq/rrr/sss/ttt.uuu/vvv_www.yyy.zzz*

### Absolute Filename with Path

```bash
 filename='rrr/sss/ttt.uuu/vvv_www.yyy.zzz'
 AB=$( fileabs "$filename" )
```

AB: '*/qqq/rrr/sss/ttt.uuu/vvv_www.yyy.zzz*'

### Base of Filename

```bash
 filename='/qqq/rrr/sss/ttt.uuu/vvv_www'
 fn=$(filebase "$filename")
```

filename: '/qqq/rrr/sss/ttt.uuu/vvv_www'
fn: vvv_www

### Filename without path with extention

```bash
 filename='vvv_www.yyy.zzz'
 fn=$(filebase "$filename")
```

 filename: 'vvv_www.yyy'
       fn: 'vvv_www.yyy'

### Filename without path

```bash
 filename='vvv_www'
 fn=$(filebase "$filename")
```

 filename: 'vvv_www'
       fn: 'vvv_www'



## Notes & Caveats

What additional information would be useful to a programmer.

## Diagnostics

**filenames** functions do not generate diagnostic messages.

## Exit Status

EX_CODE is set to EX_OK. See *olas_def.sh*.

## Configuration and Environment

**filebase sets the global variable EX_CODE.

## Dependencies

**filebase** uses *olaus_def.sh* to load the Olaus Global
Constants, Types, and Variables definitions.

**filebase** uses the BASH builtin printf function.

## Incompatibilities

No knows incompatabilities.

## Bugs & Limitations

There are no known bugs in this module.

Please report problems to [Mark Jensen](mailto:mark@jensen.net).

Patches are welcome.

## History

Version 0.0 Initial Release

## Resources

Damian Conway. 2005.
*Ten Essential Development Practice*, Retrieved March 15, 2007, from [http://www.perl.com/pub/a/2005/07/14/bestpractices.html](http://www.perl.com/pub/a/2005/07/14/bestpractices.html).

Daniel J. Barrett, Richard E. Silverman, and Robert G. Byrnes.
2005. *SSH, the Secure Shell: The Definitive Guide, 2nd Edition. (Sebastopol: O'Reilly Media)

Arnold Robbins and Nelson H. F. Beebe. 2005.
*Classic Shell Scripting*. (Sebastopol: O'Reilly Media)

## See Also

fileabs, filename, filenamedate, filepath, filesfx, filexsfx

## Author

Mark J Jensen **mark@jensen.net**

## License & Copyright

Copyright (c) 2020 Mark Jensen. All rights reserved.

include(license.txt)
