#! /usr/bin/bash
MY_DIR=./

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    VS_PATH=~/.config/VSCodium/User;
else
    VS_PATH=$APPDATA/VSCodium/User;
fi

cp "$VS_PATH"/keybindings.json "$MY_DIR"
cp "$VS_PATH"/settings.json "$MY_DIR"
cp -r "$VS_PATH"/snippets/ "$MY_DIR"
codium --list-extensions > extensions_list.txt
