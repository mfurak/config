#! /usr/bin/bash
MY_DIR="./"
EXTENSION_LIST="vscode.extensions"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    VS_PATH=~/.config/VSCodium/User;
else
    VS_PATH=$APPDATA/VSCodium/User;
fi

