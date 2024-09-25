SKIP_FOLDERS := raycast rectangle shell ssh
ALL_FOLDERS := $(shell find . -maxdepth 1 -type d -not -path '.' -not -name '.git' -exec basename {} \;)

# Function to check if a folder is in the skip list
define is_skip_folder
	$(foreach folder,$(SKIP_FOLDERS),$(if $(filter $1,$(folder)),true))
endef

# General rule to change directory and run a script if it exists and is not in the skip list
define run-script
	if [ "$(strip $(call is_skip_folder,$*))" != "true" ]; then \
	  echo "Processing $*"; \
	  if [ -d ./$* ]; then \
	    cd ./$*; \
	    if [ -f ../$(SCRIPT) ]; then \
	      ../$(SCRIPT); \
	    fi; \
	    if [ -f ./$(SCRIPT) ]; then \
	      ./$(SCRIPT); \
	    fi; \
	  else \
	    echo "Directory ./$* does not exist"; \
	  fi; \
	else \
	  echo "Skipping $*"; \
	fi
endef

# Targets for extract and install
extract-%: SCRIPT = extract.sh
extract-%:
	$(run-script)

.PHONY: e-all
e-all: $(addprefix e-, $(ALL_FOLDERS))
e-%: extract-%;
e: e-all

install-%: SCRIPT = install.sh
install-%:
	$(run-script)

.PHONY: i-all
i-all: $(addprefix i-, $(ALL_FOLDERS))
i-%: install-%;
i: i-all

fmt:
	shfmt -l -w .
