include *.mk

.PHONY: up
up: code/init code/build code/up

.PHONY: down
down: code/init code/down

.PHONY: exec
exec: code/exec

.PHONY: clean
clean: code/clean
