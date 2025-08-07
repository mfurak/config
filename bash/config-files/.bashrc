CONFIG_DIR="$HOME/.shell_config"

if [[ -d $CONFIG_DIR ]]; then
    for FILE in "$CONFIG_DIR"/*; do
      if [[ -f $FILE ]]; then
        source "$FILE"
      fi
    done
fi
