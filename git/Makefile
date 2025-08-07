.SILENT:

include ../setup.mk

TARGET_CONFIG_DIRECTORY := "$$HOME"
TEMPLATES_DIRECTORY := "templates"
TARGET := "unix"

install:
	cat "$(TEMPLATES_DIRECTORY)/default.gitconfig" "$(TEMPLATES_DIRECTORY)/$(TARGET).gitconfig" > "$(LOCAL_CONFIG_DIRECTORY)/.gitconfig"
	make install-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"
	make install-aliases

extract:
	make extract-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"
	make extract-aliases
