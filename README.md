## Various configuration files

To fix `-bash: $'\r': command not found` error in Cygwin add `igncr` to the SHELLOPTS environment variable. On windows `setx SHELLOPTS "igncr"` will set the variable.

### Using [KDiff3](https://sourceforge.net/projects/kdiff3/files/) as the merge tool. Make sure it's set in PATH.
