## Various configuration files

To fix `-bash: $'\r': command not found` error in Cygwin add `igncr` to the SHELLOPTS environment variable. On windows `setx SHELLOPTS "igncr"` will set the variable.

### Using Git credential manager for windows with Cygwin
Get the [GCMW's latest release](https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases/latest), download the zip file (not the installer), extract it's contents (only `.dll` and `.exe` files are needed) to `C:\cygwin\usr\libexec\git-core\` for 32-bit Cygwin, or `C:\cygwin64\usr\libexec\git-core\` for 64-bit Cygwin. [Reference](https://github.com/Microsoft/Git-Credential-Manager-for-Windows/issues/146)

To tell git to use GCMW, execute: `git config --global credential.helper manager`

To get GUI prompts for credentials, execute: `git config --global credential.modalprompt true`
 
If you want this to be a per-repository setting, remove the `--global` option.

### Using [KDiff3](https://sourceforge.net/projects/kdiff3/files/) as the merge tool. Make sure it's set in PATH.
