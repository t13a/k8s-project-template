CODE_ENV := .env
CODE_HOME := .home/code
CODE_SHELL := /bin/zsh

COMPOSE_PROJECT_NAME := $(notdir $(abspath ..))

.PHONY: init
init: $(CODE_ENV) $(CODE_HOME)

$(CODE_ENV): /var/run/docker.sock
	rm -f $@.tmp
	echo 'CODE_GID=$(shell id -g)' >> $@.tmp
	echo 'CODE_SHELL=$(CODE_SHELL)' >> $@.tmp
	echo 'CODE_UID=$(shell id -u)' >> $@.tmp
	echo 'COMPOSE_PROJECT_NAME=$(COMPOSE_PROJECT_NAME)' >> $@.tmp
	echo 'DOCKER_GID=$(shell stat -c %g /var/run/docker.sock)' >> $@.tmp
	mv -f $@.tmp $@

$(CODE_HOME):
	mkdir -p $@

.PHONY: build
build:
	docker compose build

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: exec
exec:
	docker compose exec code $(CODE_SHELL)

.PHONY: clean
clean:
	docker compose down --remove-orphans --rmi all -t 0 -v || true
	rm -rf $(CODE_ENV) $(CODE_HOME)
