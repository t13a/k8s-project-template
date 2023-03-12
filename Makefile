include *.mk

.PHONY: up
up: code/init code/build code/up db/init db/up

.PHONY: down
down: code/init code/down db/init db/down

.PHONY: exec
exec: code/exec

.PHONY: clean
clean: code/clean db/clean
