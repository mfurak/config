.SILENT:

LOCAL_ALIASES_DIRECTORY := "aliases"
TARGET_ALIASES_DIRECTORY := "$$HOME/.shell_aliases"

LOCAL_CONFIG_DIRECTORY := "config-files"

define symlink-files
	LOCAL_DIRECTORY="$(1)"; \
	TARGET_DIRECTORY="$(2)"; \
	FULL_LOCAL_PATH=$$(pwd); \
	LOCAL_FILE_PATHS=$$(find "$$LOCAL_DIRECTORY" -type f); \
	IFS=$$'\n'; \
	for LOCAL_FILE_PATH in $$LOCAL_FILE_PATHS; do \
		TRIMMED_FILE_NAME=$${LOCAL_FILE_PATH#*/}; \
		FILE_FOLDER_PATH=$${LOCAL_FILE_PATH%/*}/; \
		TRIMMED_FILE_FOLDER_PATH=$${FILE_FOLDER_PATH#$$LOCAL_DIRECTORY/}; \
		FULL_LOCAL_FILE_PATH="$$FULL_LOCAL_PATH/$$LOCAL_FILE_PATH"; \
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
			echo "Symlinking '$$LOCAL_FILE_PATH' to '$$FULL_TARGET_FILE_PATH'"; \
		fi; \
		ln -sf "$$FULL_LOCAL_FILE_PATH" "$$FULL_TARGET_FILE_PATH"; \
	done
endef

define import-files
	LOCAL_DIRECTORY="$(1)"; \
	TARGET_DIRECTORY="$(2)"; \
	LOCAL_FILE_PATHS=$$(find "$$LOCAL_DIRECTORY" -type f); \
	IFS=$$'\n'; \
	for LOCAL_FILE_PATH in $$LOCAL_FILE_PATHS; do \
		TRIMMED_FILE=$${LOCAL_FILE_PATH#*/}; \
		FULL_TARGET_FILE_PATH="$$TARGET_DIRECTORY/$$TRIMMED_FILE"; \
		if [ -L "$$FULL_TARGET_FILE_PATH" ]; then \
			if [ -n "$(DEBUG)" ]; then \
				echo "File '$$FULL_TARGET_FILE_PATH' is already symlinked"; \
			fi; \
		elif [ -f "$$FULL_TARGET_FILE_PATH" ]; then \
			if [ -n "$(DEBUG)" ]; then \
				echo "Copying from '$$FULL_TARGET_FILE_PATH' to '$$LOCAL_FILE_PATH'"; \
			fi; \
			cp "$$FULL_TARGET_FILE_PATH" "$$LOCAL_FILE_PATH"; \
		else \
			echo "'$$TRIMMED_FILE' doesn't exist at '$$TARGET_DIRECTORY'"; \
		fi; \
	done
endef

define delete-files
	LOCAL_DIRECTORY="$(1)"; \
	TARGET_DIRECTORY="$(2)"; \
	LOCAL_FILE_PATHS=$$(find "$$LOCAL_DIRECTORY" -type f); \
	IFS=$$'\n'; \
	for LOCAL_FILE_PATH in $$LOCAL_FILE_PATHS; do \
		TRIMMED_FILE=$${LOCAL_FILE_PATH#*/}; \
		FULL_TARGET_FILE_PATH="$$TARGET_DIRECTORY/$$TRIMMED_FILE"; \
		if [ -n "$(DEBUG)" ]; then \
			echo "Checking if '$$FULL_TARGET_FILE_PATH' exists"; \
		fi; \
		if [ -f "$$FULL_TARGET_FILE_PATH" ]; then \
			if [ -n "$(DEBUG)" ]; then \
				echo "Removing '$$FULL_TARGET_FILE_PATH'"; \
			fi; \
			rm "$$FULL_TARGET_FILE_PATH"; \
		else \
			echo "'$$TRIMMED_FILE' doesn't exist at '$$TARGET_DIRECTORY'"; \
		fi; \
		if [ -n "$(DELETE_LOCAL)" ]; then \
			if [ -n "$(DEBUG)" ]; then \
				echo "Also removing '$$LOCAL_FILE_PATH'"; \
			fi; \
			rm "$$LOCAL_FILE_PATH"; \
		fi; \
	done
endef

# Targets that can be extended in each tool's folder
install::
	@if [ -d "$(LOCAL_CONFIG_DIRECTORY)" ]; then \
		$(call symlink-files,$(LOCAL_CONFIG_DIRECTORY),$(TARGET_CONFIG_DIRECTORY)); \
	fi
	@if [ -d "$(LOCAL_ALIASES_DIRECTORY)" ]; then \
		$(call symlink-files,$(LOCAL_ALIASES_DIRECTORY),$(TARGET_ALIASES_DIRECTORY)); \
	fi

extract::
	@if [ -d "$(LOCAL_CONFIG_DIRECTORY)" ]; then \
		$(call import-files,$(LOCAL_CONFIG_DIRECTORY),$(TARGET_CONFIG_DIRECTORY)); \
	fi
	@if [ -d "$(LOCAL_ALIASES_DIRECTORY)" ]; then \
		$(call import-files,$(LOCAL_ALIASES_DIRECTORY),$(TARGET_ALIASES_DIRECTORY)); \
	fi

delete::
	@if [ -d "$(LOCAL_CONFIG_DIRECTORY)" ]; then \
		$(call delete-files,$(LOCAL_CONFIG_DIRECTORY),$(TARGET_CONFIG_DIRECTORY)); \
	fi
	@if [ -d "$(LOCAL_ALIASES_DIRECTORY)" ]; then \
		$(call delete-files,$(LOCAL_ALIASES_DIRECTORY),$(TARGET_ALIASES_DIRECTORY)); \
	fi
