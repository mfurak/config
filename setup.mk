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
		mkdir -p "$(3)"; \
		if [ -f "$(2)/$$TRIMMED_FILE" ]; then \
			cp "$(2)/$$TRIMMED_FILE" "$(3)/$$TRIMMED_FILE"; \
		else \
			echo "$$TRIMMED_FILE doesn't exist at $(2)"; \
		fi; \
	done
endef

install-aliases:
	$(call copy-files,$(LOCAL_ALIASES_DIRECTORY),$(LOCAL_ALIASES_DIRECTORY),$(TARGET_ALIASES_DIRECTORY))

extract-aliases:
	$(call copy-files,$(LOCAL_ALIASES_DIRECTORY),$(TARGET_ALIASES_DIRECTORY),$(LOCAL_ALIASES_DIRECTORY))

install-config-files:
	$(call copy-files,$(LOCAL_CONFIG_DIRECTORY),$(LOCAL_CONFIG_DIRECTORY),$(TARGET_CONFIG_DIRECTORY))

extract-config-files:
	$(call copy-files,$(LOCAL_CONFIG_DIRECTORY),$(TARGET_CONFIG_DIRECTORY),$(LOCAL_CONFIG_DIRECTORY))
