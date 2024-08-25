#! /bin/bash
source ./variables.sh

# Config
cp "$CONFIG_DIRECTORY/keymap.json" ./
cp "$CONFIG_DIRECTORY/settings.json" ./

# Aliases
source ../shell/variables.sh
cp "$ALIASES_DIRECTORY/$ALIAS_FILE" ./
