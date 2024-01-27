#! /bin/bash
INSTALLED_EXTENSIONS="./extensions_installed.txt"
UNINSTALLED_EXTENSIONS="./extensions_uninstalled.txt"
EXECUTABLE_NAME="codium"
DIRECTORY_NAME="VSCodium"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    CONFIG_DIRECTORY="$HOME/.config/$DIRECTORY_NAME/User"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    CONFIG_DIRECTORY="$HOME/Library/Application Support/$DIRECTORY_NAME/User"
else
    CONFIG_DIRECTORY="$APPDATA/$DIRECTORY_NAME/User"
fi
