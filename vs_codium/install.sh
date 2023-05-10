#! /bin/bash
source ./variables.sh
cp "$MY_DIR"/keybindings.json "$VS_PATH"
cp "$MY_DIR"/settings.json "$VS_PATH"
cp -r "$MY_DIR"/snippets/ "$VS_PATH"
cat "$UNINSTALLED_EXTENSIONS" | xargs --no-run-if-empty -I % codium --uninstall-extension % --force
cat "$INSTALLED_EXTENSIONS" | xargs --no-run-if-empty -I % codium --install-extension % --force
