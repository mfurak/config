include tool_config.mk

ALL_TOOLS := $(shell find . -maxdepth 1 -type d -not -path '.' -not -name '.git' -exec basename {} \;)
ALLOWED_TOOLS := $(filter-out $(SKIP_TOOLS), $(ALL_TOOLS))
MAKEFLAGS = --no-print-directory

## INSTALL
.PHONY: i-all
i: i-all
i-all: $(addprefix i-, $(ALLOWED_TOOLS))
i-%: install-%;
install-%:
	@if echo "$(ALLOWED_TOOLS)" | grep -wq "$*"; then \
		if [ -n "$(DEBUG)" ]; then echo "Installing '$*'"; fi; \
		cd "$*" && $(MAKE) DEBUG="$(DEBUG)" install; \
	else \
		echo "Error: '$*' MUST be set up manually."; \
	fi
# Enable debug logging
.PHONY: di-all
di: di-all
di-all: $(addprefix di-, $(ALLOWED_TOOLS))
di-%: DEBUG=1
di-%: install-%;

## EXTRACT
.PHONY: e-all
e: e-all
e-all: $(addprefix e-, $(ALLOWED_TOOLS))
e-%: extract-%;
extract-%:
	@if echo "$(ALLOWED_TOOLS)" | grep -wq "$*"; then \
		if [ -n "$(DEBUG)" ]; then echo "Extracting '$*'"; fi; \
		cd "$*" && $(MAKE) DEBUG="$(DEBUG)" extract; \
	else \
		echo "Error: '$*' is not an allowed tool."; \
	fi
# Enable debug logging
.PHONY: de-all
de: de-all
de-all: $(addprefix de-, $(ALLOWED_TOOLS))
de-%: DEBUG=1
de-%: extract-%;

## DELETE including LOCAL files
.PHONY: da-all
da: da-all
da-all: $(addprefix da-, $(ALLOWED_TOOLS))
da-%: delete-all-%;
delete-all-%:
	@if echo "$(ALLOWED_TOOLS)" | grep -wq "$*"; then \
		if [ -n "$(DEBUG)" ]; then echo "Deleting '$*'"; fi; \
		cd "$*" && $(MAKE) DEBUG="$(DEBUG)" delete DELETE_LOCAL=true; \
	else \
		echo "Error: '$*' is not an allowed tool."; \
	fi
# Enable debug logging
.PHONY: dda-all
dda: dda-all
dda-all: $(addprefix dda-, $(ALLOWED_TOOLS))
dda-%: DEBUG=1
dda-%: delete-all-%;

## DELETE without LOCAL files
.PHONY: d-all
d: d-all
d-all: $(addprefix d-, $(ALLOWED_TOOLS))
d-%: delete-%;
delete-%:
	@if echo "$(ALLOWED_TOOLS)" | grep -wq "$*"; then \
		if [ -n "$(DEBUG)" ]; then echo "Deleting '$*'"; fi; \
		cd "$*" && $(MAKE) DEBUG="$(DEBUG)" delete; \
	else \
		echo "Error: '$*' is not an allowed tool."; \
	fi
# Enable debug logging
.PHONY: dd-all
dd: dd-all
dd-all: $(addprefix dd-, $(ALLOWED_TOOLS))
dd-%: DEBUG=1
dd-%: delete-%;

## FORMAT
f: format
format:
	shfmt -l -w .
