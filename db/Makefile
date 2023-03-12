COMPOSE_PROJECT_NAME := $(notdir $(abspath ..))-$(notdir $(abspath .))

DB_ENV := .env

POSTGRES_DB := postgres
POSTGRES_PASSWORD := postgres
POSTGRES_USER := postgres

.PHONY: init
init: $(DB_ENV)

$(DB_ENV):
	rm -f $@.tmp
	echo 'COMPOSE_PROJECT_NAME=$(COMPOSE_PROJECT_NAME)' >> $@.tmp
	echo 'POSTGRES_DB=$(POSTGRES_DB)' >> $@.tmp
	echo 'POSTGRES_PASSWORD=$(POSTGRES_PASSWORD)' >> $@.tmp
	echo 'POSTGRES_USER=$(POSTGRES_USER)' >> $@.tmp
	mv -f $@.tmp $@

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: clean
clean:
	docker compose down --remove-orphans -t 0 -v || true
	rm -rf $(DB_ENV)
