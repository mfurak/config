#! /bin/bash
source ./variables.sh
cp ./keybindings.json "$CONFIG_DIRECTORY"
cp ./settings.json "$CONFIG_DIRECTORY"
cp -r ./snippets/ "$CONFIG_DIRECTORY"
cat "$UNINSTALLED_EXTENSIONS" | xargs --no-run-if-empty -I % $EXECUTABLE_NAME --uninstall-extension % --force
cat "$INSTALLED_EXTENSIONS" | xargs --no-run-if-empty -I % $EXECUTABLE_NAME --install-extension % --force
