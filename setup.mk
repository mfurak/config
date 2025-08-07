.SILENT:

LOCAL_ALIASES_DIRECTORY := "aliases"
TARGET_ALIASES_DIRECTORY := "$$HOME/.shell_aliases"

LOCAL_CONFIG_DIRECTORY := "config-files"

define copy-files
	FILES=$$(find "$(1)" -type f); \
	IFS=$$'\n'; \
	for FILE in $$FILES; do \
		TRIMMED_FILE=$${FILE#*/}; \
		if [ -n "$(DEBUG)" ]; then \
			echo "Copying from '$(2)/$$TRIMMED_FILE' to '$(3)/$$TRIMMED_FILE'"; \
		fi; \
		cp "$(2)/$$TRIMMED_FILE" "$(3)/$$TRIMMED_FILE"; \
	done
endef

install-aliases:
	mkdir -p "$(TARGET_ALIASES_DIRECTORY)"
	$(call copy-files,$(LOCAL_ALIASES_DIRECTORY),$(LOCAL_ALIASES_DIRECTORY),$(TARGET_ALIASES_DIRECTORY))

extract-aliases:
	mkdir -p "$(LOCAL_ALIASES_DIRECTORY)"
	$(call copy-files,$(LOCAL_ALIASES_DIRECTORY),$(TARGET_ALIASES_DIRECTORY),$(LOCAL_ALIASES_DIRECTORY))

install-config-files:
	mkdir -p "$(TARGET_CONFIG_DIRECTORY)"
	$(call copy-files,$(LOCAL_CONFIG_DIRECTORY),$(LOCAL_CONFIG_DIRECTORY),$(TARGET_CONFIG_DIRECTORY))

extract-config-files:
	mkdir -p "$(LOCAL_CONFIG_DIRECTORY)"
	$(call copy-files,$(LOCAL_CONFIG_DIRECTORY),$(TARGET_CONFIG_DIRECTORY),$(LOCAL_CONFIG_DIRECTORY))
