#! /bin/bash
source ./variables.sh

# Config
if [ -n "$CONFIG_DIRECTORY" ]; then
  CONFIG_FILES=($(find . -type f ! -name "variables.sh" ! -name "*.shell_aliases"))
  for CONFIG_FILE in "${CONFIG_FILES[@]}"; do
    cp "$CONFIG_DIRECTORY/$CONFIG_FILE" ./
    echo "Copied $CONFIG_DIRECTORY/$CONFIG_FILE"
  done
fi

# Aliases
if [ -n "$ALIAS_FILE" ]; then
  source ../shell/variables.sh
  cp "$ALIASES_DIRECTORY/$ALIAS_FILE" ./
  echo "Copied $ALIASES_DIRECTORY/$ALIAS_FILE"
fi
