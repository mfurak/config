# General rule to change directory and run a script if it exists
define run-script
	cd $* && ../$(SCRIPT)
	if [ -f $*/$(SCRIPT) ]; then cd $* && ./$(SCRIPT); fi
endef

# Targets for extract and install
e-%: SCRIPT = extract.sh
e-%:
	$(run-script)

i-%: SCRIPT = install.sh
i-%:
	$(run-script)
