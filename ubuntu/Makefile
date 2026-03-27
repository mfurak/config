.SILENT:

include ../setup.mk

TARGET_CONFIG_DIRECTORY := "$$HOME/.shell_config"

install:
	make install-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"
	make install-aliases

extract:
	make extract-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"
	make extract-aliases

delete:
	make delete-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"
	make delete-aliases
