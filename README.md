# Config
## Usage
Requirements: `make`

- `make i-[folder_name]`
  - Installs the configuration files from the `folder_name` directory
  - Installs the aliases from the `folder_name` directory if they exist
  - Runs additional steps from the `install.sh` script from the `folder_name` directory, if it exists

- `make e-[folder_name]`
  - Extracts the configuration files into the `folder_name` directory
  - Extracts the aliases into the `folder_name` directory if they exist
  - Runs additional steps from the `extract.sh` script from the `folder_name` directory, if it exists

## Various configuration files
To fix `-bash: $'\r': command not found` error in Cygwin add `igncr` to the SHELLOPTS environment variable. On windows `setx SHELLOPTS "igncr"` will set the variable.

### Using [KDiff3](https://sourceforge.net/projects/kdiff3/files/) as the merge tool. Make sure it's set in PATH.
