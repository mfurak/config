# General rule to change directory and run a script if it exists
define run-script
	cd $* && ../$(SCRIPT)
	if [ -f $*/$(SCRIPT) ]; then cd $* && ./$(SCRIPT); fi
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
