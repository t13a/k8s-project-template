.SECONDEXPANSION:

from_env = $(shell hack/dotenv.sh $1 -- printenv $2)
from_json = $(shell jq -r '$2' $1)

.PHONY: gen
gen: $$(GEN_FILES) $$(GEN_FILES_NON_IDEMPOTENT)

.PHONY: rm
rm:
	rm -f $(GEN_FILES)

.PHONY: rm-all
rm-all:
	rm -f $(GEN_FILES) $(GEN_FILES_NON_IDEMPOTENT)

.PHONY: init
init: $$(INIT_FILES) $$(INIT_DIRS)

.PHONY: clean
clean:
	rm -f $(INIT_FILES)

.PHONY: clean-all
clean-all:
	rm -rf $(INIT_FILES) $(INIT_DIRS)

include *.mk
