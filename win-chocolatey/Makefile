.SILENT:

CONFIG_FILE := "packages.choco"

install:


extract:
	choco list -lo | grep -E '^[^A-Z].*[0-9]+\.[0-9]+.*' > $(CONFIG_FILE)
