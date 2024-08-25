#! /bin/bash
source ./variables.sh

# Config
cp "$CONFIG_DIRECTORY/$CONFIG_FILE" ./

# Aliases
source ../shell/variables.sh
cp "$ALIASES_DIRECTORY/$ALIAS_FILE" ./
