#! /bin/bash
CONFIG_DIRECTORY="~/.config/VSCodium"
INSTALLED_EXTENSIONS="./extensions_installed.txt"
UNINSTALLED_EXTENSIONS="./extensions_uninstalled.txt"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    VS_PATH="$HOME/.config/VSCodium/User"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    VS_PATH="$HOME/Library/Application Support/VSCodium/User"
else
    VS_PATH="$APPDATA/VSCodium/User"
fi
