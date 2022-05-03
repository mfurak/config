#! /usr/bin/bash
MY_DIR="./"
INSTALLED_EXTENSIONS=$MY_DIR"extensions_installed.txt"
UNINSTALLED_EXTENSIONS=$MY_DIR"extensions_uninstalled.txt"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    VS_PATH=~/.config/VSCodium/User;
else
    VS_PATH=$APPDATA/VSCodium/User;
fi

