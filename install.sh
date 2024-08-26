#! /bin/bash
source variables.sh

# Config
if [ -n "$CONFIG_DIRECTORY" ]; then
  CONFIG_FILES=($(find . -type f ! -name "variables.sh" ! -name "*.shell_aliases"))
  for CONFIG_FILE in "${CONFIG_FILES[@]}"; do
    cp $CONFIG_FILE "$CONFIG_DIRECTORY/"
    echo "Copied $CONFIG_FILE to $CONFIG_DIRECTORY"
  done
fi

# Aliases
if [ -n "$ALIAS_FILE" ]; then
  source ../shell/variables.sh
  cp $ALIAS_FILE "$ALIASES_DIRECTORY/"
  echo "Copied $ALIAS_FILE to $ALIASES_DIRECTORY"
fi
