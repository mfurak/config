#! /usr/bin/bash
MY_DIR=./

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    VS_PATH=~/.config/VSCodium/User;
else
    VS_PATH=$APPDATA/VSCodium/User;
fi

cp -f "$VS_PATH"/keybindings.json $MY_DIR
cp -f "$VS_PATH"/settings.json $MY_DIR
cp -rf "$VS_PATH"/snippets/ $MY_DIR
codium --list-extensions > extensions_list.txt
