.SILENT:

include ../setup.mk

TARGET_CONFIG_DIRECTORY := "$$HOME"
TARGET := "unix"

install:
	cat "templates/default.gitconfig" "templates/$(TARGET).gitconfig" > "$(LOCAL_CONFIG_DIRECTORY)/.gitconfig"
	make install-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"
	make install-aliases

extract:
	make extract-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"
	make extract-aliases
