#! /bin/bash
source variables.sh

# Config
cp $CONFIG_FILE "$CONFIG_DIRECTORY/"

# Aliases
source ../shell/variables.sh
cp $ALIAS_FILE "$ALIASES_DIRECTORY/"
