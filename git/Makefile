.SILENT:

include ../utils.mk

TARGET_CONFIG_DIRECTORY := "$$HOME"
TEMPLATES_DIRECTORY := "templates"
TARGET := "unix"

install::
	cat "$(TEMPLATES_DIRECTORY)/default.gitconfig" "$(TEMPLATES_DIRECTORY)/$(TARGET).gitconfig" > "$(LOCAL_CONFIG_DIRECTORY)/.gitconfig"
