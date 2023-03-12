.PHONY: $(addprefix db/,init up down clean)
$(addprefix db/,init up down clean):
	$(MAKE) -C db $(patsubst db/%,%,$@)
