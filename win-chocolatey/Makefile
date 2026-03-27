.SILENT:

include ../utils.mk

CONFIG_FILE := "packages.choco"

extract::
	choco list -lo | grep -E '^[^A-Z].*[0-9]+\.[0-9]+.*' > $(CONFIG_FILE)
