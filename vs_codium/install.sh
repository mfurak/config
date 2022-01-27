#! /usr/bin/bash
source ./variables.sh
cp MY_DIR/keybindings.json "$VS_PATH"
cp MY_DIR/settings.json "$VS_PATH"
cp -r MY_DIR/snippets/ "$VS_PATH"
cat "$EXTENSION_LIST" | xargs -L 1 codium --install-extension

