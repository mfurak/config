CONFIG_FILES=$(find . -type f ! -name "install.sh" ! -name "extract.sh" ! -name "variables.sh" ! -name "*.shell_aliases" -maxdepth 1 | sed 's|^\./||')
# set internal field separator to newline to be able to loop over config files
IFS=$'\n'
