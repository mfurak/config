SKIP_TOOLS := ublock
ALL_TOOLS := $(shell find . -maxdepth 1 -type d -not -path '.' -not -name '.git' -exec basename {} \;)
ALLOWED_TOOLS := $(filter-out $(SKIP_TOOLS), $(ALL_TOOLS))

.PHONY: i-all
i: i-all
i-all: $(addprefix i-, $(ALLOWED_TOOLS))
i-%: install-%;

install-%:
	@if echo "$(ALLOWED_TOOLS)" | grep -wq "$*"; then \
		if [ -n "$(DEBUG)" ]; then echo "Installing '$*'"; fi; \
		cd "$*" && $(MAKE) install; \
	else \
		echo "Error: '$*' MUST be set up manually."; \
	fi

.PHONY: e-all
e: e-all
e-all: $(addprefix e-, $(ALLOWED_TOOLS))
e-%: extract-%;

extract-%:
		@if echo "$(ALLOWED_TOOLS)" | grep -wq "$*"; then \
			if [ -n "$(DEBUG)" ]; then echo "Extracting '$*'"; fi; \
			cd "$*" && $(MAKE) extract; \
		else \
			echo "Error: '$*' is not an allowed tool."; \
		fi

f: format
format:
	shfmt -l -w .
