.SILENT:

include ../setup.mk

TARGET_CONFIG_DIRECTORY := "$$HOME"

install:
	make install-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"

extract:
	make extract-config-files TARGET_CONFIG_DIRECTORY="$(TARGET_CONFIG_DIRECTORY)"

color-test:
	echo "First color test:"
	./color-test.sh
	echo "Second color test:"
	./color-test2.sh
