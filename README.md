# Config
## Usage
Requirements: `make`

- `make i-[folder_name]` - runs the `install.sh` script in the `folder_name`

- `make e-[folder_name]` - runs the `extract.sh` script in the `folder_name`
## Various configuration files
To fix `-bash: $'\r': command not found` error in Cygwin add `igncr` to the SHELLOPTS environment variable. On windows `setx SHELLOPTS "igncr"` will set the variable.

### Using [KDiff3](https://sourceforge.net/projects/kdiff3/files/) as the merge tool. Make sure it's set in PATH.
