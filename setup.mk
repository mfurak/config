.SILENT:

LOCAL_ALIASES_DIRECTORY := "aliases"
TARGET_ALIASES_DIRECTORY := "$$HOME/.shell_aliases"

LOCAL_CONFIG_DIRECTORY := "config-files"

define copy-files
	LOCAL_DIRECTORY="$(1)"; \
	SOURCE_DIRECTORY="$(2)"; \
	TARGET_DIRECTORY="$(3)"; \
	FILES=$$(find "$$LOCAL_DIRECTORY" -type f); \
	IFS=$$'\n'; \
	for FILE in $$FILES; do \
		TRIMMED_FILE=$${FILE#*/}; \
		if [ -n "$(DEBUG)" ]; then \
			echo "Copying from '$$SOURCE_DIRECTORY/$$TRIMMED_FILE' to '$$TARGET_DIRECTORY/$$TRIMMED_FILE'"; \
		fi; \
		mkdir -p "$$TARGET_DIRECTORY"; \
		if [ -f "$$SOURCE_DIRECTORY/$$TRIMMED_FILE" ]; then \
			cp "$$SOURCE_DIRECTORY/$$TRIMMED_FILE" "$$TARGET_DIRECTORY/$$TRIMMED_FILE"; \
		else \
			echo "$$TRIMMED_FILE doesn't exist at $$SOURCE_DIRECTORY"; \
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
