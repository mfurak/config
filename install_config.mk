install:
	make install-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"

extract:
	make extract-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"

delete:
	make delete-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"
