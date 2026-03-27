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

define symlink-files
	LOCAL_DIRECTORY="$(1)"; \
	TARGET_DIRECTORY="$(2)"; \
	FULL_LOCAL_PATH=$$(pwd); \
	FILE_PATHS=$$(find "$$LOCAL_DIRECTORY" -type f); \
	IFS=$$'\n'; \
	for FILE_PATH in $$FILE_PATHS; do \
		TRIMMED_FILE_NAME=$${FILE_PATH#*/}; \
		FILE_FOLDER_PATH=$${FILE_PATH%/*}/; \
		TRIMMED_FILE_FOLDER_PATH=$${FILE_FOLDER_PATH#$$LOCAL_DIRECTORY/}; \
		FULL_LOCAL_FILE_PATH="$$FULL_LOCAL_PATH/$$FILE_PATH"; \
		FULL_TARGET_FILE_PATH="$$TARGET_DIRECTORY/$$TRIMMED_FILE_NAME"; \
		TARGET_FOLDER_PATH="$$TARGET_DIRECTORY/$$TRIMMED_FILE_FOLDER_PATH"; \
		if [ ! -d "$$TARGET_FOLDER_PATH" ]; then \
			if [ -n "$(DEBUG)" ]; then \
				echo "Creating '$$TARGET_FOLDER_PATH' directory"; \
			fi; \
			mkdir -p "$$TARGET_FOLDER_PATH"; \
		else \
			if [ -n "$(DEBUG)" ]; then \
				echo "Directory '$$TARGET_FOLDER_PATH' exists at '$$TARGET_DIRECTORY'"; \
			fi; \
		fi; \
		if [ -n "$(DEBUG)" ]; then \
			echo "Symlinking '$$FILE_PATH' to '$$FULL_TARGET_FILE_PATH'"; \
		fi; \
		ln -sf "$$FULL_LOCAL_FILE_PATH" "$$FULL_TARGET_FILE_PATH"; \
	done
endef

define import-files
	LOCAL_DIRECTORY="$(1)"; \
	TARGET_DIRECTORY="$(2)"; \
	FILES=$$(find "$$LOCAL_DIRECTORY" -type f); \
	IFS=$$'\n'; \
	for FILE in $$FILES; do \
		TRIMMED_FILE=$${FILE#*/}; \
		FULL_TARGET_FILE_PATH="$$TARGET_DIRECTORY/$$TRIMMED_FILE"; \
		if [ -L "$$FULL_TARGET_FILE_PATH" ]; then \
			if [ -n "$(DEBUG)" ]; then \
				echo "File '$$FULL_TARGET_FILE_PATH' is already symlinked"; \
			fi; \
		elif [ -f "$$FULL_TARGET_FILE_PATH" ]; then \
			if [ -n "$(DEBUG)" ]; then \
				echo "Copying from '$$FULL_TARGET_FILE_PATH' to '$$LOCAL_DIRECTORY/$$TRIMMED_FILE'"; \
			fi; \
			cp "$$FULL_TARGET_FILE_PATH" "$$LOCAL_DIRECTORY/$$TRIMMED_FILE"; \
		else \
			echo "'$$TRIMMED_FILE' doesn't exist at '$$TARGET_DIRECTORY'"; \
		fi; \
	done
endef

define delete-files
	LOCAL_DIRECTORY="$(1)"; \
	TARGET_DIRECTORY="$(2)"; \
	FILES=$$(find "$$LOCAL_DIRECTORY" -type f); \
	IFS=$$'\n'; \
	for FILE in $$FILES; do \
		TRIMMED_FILE=$${FILE#*/}; \
		if [ -n "$(DEBUG)" ]; then \
			echo "Checking if '$$TARGET_DIRECTORY/$$TRIMMED_FILE' exists"; \
		fi; \
		if [ -f "$$TARGET_DIRECTORY/$$TRIMMED_FILE" ]; then \
			if [ -n "$(DEBUG)" ]; then \
				echo "Removing '$$TARGET_DIRECTORY/$$TRIMMED_FILE'"; \
			fi; \
			rm "$$TARGET_DIRECTORY/$$TRIMMED_FILE"; \
		else \
			echo "'$$TRIMMED_FILE' doesn't exist at '$$TARGET_DIRECTORY'"; \
		fi; \
		if [ -n "$(DELETE_LOCAL)" ]; then \
			if [ -n "$(DEBUG)" ]; then \
				echo "Also removing '$$LOCAL_DIRECTORY/$$TRIMMED_FILE'"; \
			fi; \
			rm "$$LOCAL_DIRECTORY/$$TRIMMED_FILE"; \
		fi; \
	done
endef

install-aliases:
	$(call symlink-files,$(LOCAL_ALIASES_DIRECTORY),$(TARGET_ALIASES_DIRECTORY))

extract-aliases:
	$(call import-files,$(LOCAL_ALIASES_DIRECTORY),$(TARGET_ALIASES_DIRECTORY))

delete-aliases:
	$(call delete-files,$(LOCAL_ALIASES_DIRECTORY),$(TARGET_ALIASES_DIRECTORY))

install-config-files:
	$(call symlink-files,$(LOCAL_CONFIG_DIRECTORY),$(TARGET_CONFIG_DIRECTORY))

extract-config-files:
	$(call import-files,$(LOCAL_CONFIG_DIRECTORY),$(TARGET_CONFIG_DIRECTORY))

delete-config-files:
	$(call delete-files,$(LOCAL_CONFIG_DIRECTORY),$(TARGET_CONFIG_DIRECTORY))
