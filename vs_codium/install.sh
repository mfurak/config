#! /usr/bin/bash
#VS_PATH=$APPDATA/Code/User;
VS_PATH=$APPDATA/VSCodium/User;
cp -rf ./* "$VS_PATH"/
cat extensions_list.txt | xargs -L 1 vscodium --install-extension