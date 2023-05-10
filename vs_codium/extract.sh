#! /bin/bash
source ./variables.sh
cp "$VS_PATH"/keybindings.json "$MY_DIR"
cp "$VS_PATH"/settings.json "$MY_DIR"
cp -r "$VS_PATH"/snippets/ "$MY_DIR"
codium --list-extensions >"$MY_DIR$INSTALLED_EXTENSIONS"
