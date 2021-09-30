#! /usr/bin/bash
MY_DIR=./
#VS_PATH=$APPDATA/Code/User;
VS_PATH=$APPDATA/VSCodium/User;
cp -f "$VS_PATH"/keybindings.json $MY_DIR
cp -f "$VS_PATH"/settings.json $MY_DIR
cp -rf "$VS_PATH"/snippets/ $MY_DIR
vscodium --list-extensions > extensions_list.txt
