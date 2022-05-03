#! /usr/bin/bash
source ./variables.sh
cp "$MY_DIR"/keybindings.json "$VS_PATH"
cp "$MY_DIR"/settings.json "$VS_PATH"
cp -r "$MY_DIR"/snippets/ "$VS_PATH"
cat "$UNINSTALLED_EXTENSIONS" | xargs -L 1 codium --uninstall-extension
cat "$INSTALLED_EXTENSIONS" | xargs -L 1 codium --install-extension
