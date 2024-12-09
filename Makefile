# Proxy Makefile

.PHONY: help default
default: help
help:
	@echo "make\tbuild\t<Folder/Project>\t- Build the project"
	@echo "make\trun\t<Folder/Project>\t- Run the project"
	@echo "make\tclean\t<Folder/Project>\t- Clean the project"
	@echo "make\ttest\t<Folder/Project>\t- test the project"

DIR := $(word 2, $(MAKECMDGOALS))
ifneq ($(wildcard $(DIR)),)
	VALID_DIR := 1
else
	VALID_DIR :=
endif

define ensure-valid-dir
	@if [ -z "$(VALID_DIR)" ]; then \
		echo "Error: Directory '$(DIR)' does not exist."; \
		$(MAKE) help; \
		exit 1; \
	fi
endef

.PHONY: run
run:
	$(call ensure-valid-dir)
	cd $(DIR) && $(MAKE) run

.PHONY: build
build:
	$(call ensure-valid-dir)
	cd $(DIR) && $(MAKE) build

.PHONY: clean
clean:
	$(call ensure-valid-dir)
	cd $(DIR) && $(MAKE) clean

.PHONY: test
test:
	$(call ensure-valid-dir)
	cd $(DIR) && $(MAKE) test
