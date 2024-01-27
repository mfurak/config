#! /bin/bash
source ./variables.sh
cp "$CONFIG_DIRECTORY"/keybindings.json ./
cp "$CONFIG_DIRECTORY"/settings.json ./
cp -r "$CONFIG_DIRECTORY"/snippets/ ./
codium --list-extensions > "./$INSTALLED_EXTENSIONS"
