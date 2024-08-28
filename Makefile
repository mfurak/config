SKIP_FOLDERS := chocolatey git mintty nvidia raspberry-pi shell ublock windows

# Function to check if a folder is in the skip list
define is_skip_folder
	$(foreach folder,$(SKIP_FOLDERS),$(if $(filter $1,$(folder)),true))
endef

# General rule to change directory and run a script if it exists and is not in the skip list
define run-script
	if [ "$(strip $(call is_skip_folder,$*))" != "true" ]; then \
	  cd ./$*; \
	  ../$(SCRIPT); \
	  if [ -f ./$(SCRIPT) ]; then \
	    ./$(SCRIPT); \
	  fi; \
	else \
	  echo "Skipping $*"; \
	fi
endef

# Targets for extract and install
extract-%: SCRIPT = extract.sh
extract-%:
	$(run-script)

e-%: extract-%;

install-%: SCRIPT = install.sh
install-%:
	$(run-script)

i-%: install-%;
