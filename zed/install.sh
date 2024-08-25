#! /bin/bash
source variables.sh

# Config
cp ./keymap.json "$CONFIG_DIRECTORY/"
cp ./settings.json "$CONFIG_DIRECTORY/"

# Aliases
source ../shell/variables.sh
cp $ALIAS_FILE "$ALIASES_DIRECTORY/"
