.PHONY: $(addprefix code/,init build up down exec clean)
$(addprefix code/,init build up down exec clean):
	$(MAKE) -C code $(patsubst code/%,%,$@)
