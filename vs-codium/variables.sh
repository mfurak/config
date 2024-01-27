#! /bin/bash
INSTALLED_EXTENSIONS="./extensions_installed.txt"
UNINSTALLED_EXTENSIONS="./extensions_uninstalled.txt"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    CONFIG_DIRECTORY="$HOME/.config/VSCodium/User"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    CONFIG_DIRECTORY="$HOME/Library/Application Support/VSCodium/User"
else
    CONFIG_DIRECTORY="$APPDATA/VSCodium/User"
fi
