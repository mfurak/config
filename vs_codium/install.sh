#! /usr/bin/bash
MY_DIR=./

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    VS_PATH=~/.config/VSCodium/User;
else
    VS_PATH=$APPDATA/VSCodium/User;
fi

cp MY_DIR/keybindings.json "$VS_PATH"
cp MY_DIR/settings.json "$VS_PATH"
cp -r MY_DIR/snippets/ "$VS_PATH"

cat extensions_list.txt | xargs -L 1 codium --install-extension
