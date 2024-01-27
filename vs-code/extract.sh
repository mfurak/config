#! /bin/bash
source ./variables.sh
cp "$CONFIG_DIRECTORY"/keybindings.json ./
cp "$CONFIG_DIRECTORY"/settings.json ./
cp -r "$CONFIG_DIRECTORY"/snippets/ ./
$EXECUTABLE_NAME --list-extensions > "./$INSTALLED_EXTENSIONS"
