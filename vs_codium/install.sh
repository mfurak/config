#! /usr/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    VS_PATH=~/.config/VSCodium/User;
else
    VS_PATH=$APPDATA/VSCodium/User;
fi
cp -rf ./* "$VS_PATH"/
cat extensions_list.txt | xargs -L 1 codium --install-extension
