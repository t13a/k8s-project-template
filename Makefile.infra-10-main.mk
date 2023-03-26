INIT_FILES += infra/.env
.DELETE_ON_ERROR:
infra/.env: INFRA_DOMAIN_NAME = $(call from_env,.env,INFRA_DOMAIN_NAME)
infra/.env: INFRA_NETWORK_NAME = $(call from_env,.env,INFRA_NETWORK_NAME)
infra/.env: MAIN_CONTAINER_NAME = $(call from_env,.env,MAIN_CONTAINER_NAME)
infra/.env: MAIN_DOMAIN_NAME = $(call from_env,.env,MAIN_DOMAIN_NAME)
infra/.env: PROJECT_NAME = $(call from_env,.env,PROJECT_NAME)
infra/.env: .env
	rm -f $@
	echo 'COMPOSE_PROJECT_NAME=$(INFRA_NETWORK_NAME)-main' >> $@
	echo 'DOCKER_GID=$(shell stat -c %g /var/run/docker.sock)' >> $@
	echo 'INFRA_NETWORK_NAME=$(INFRA_NETWORK_NAME)' >> $@
	echo 'MAIN_CONTAINER_NAME=$(MAIN_CONTAINER_NAME)' >> $@
	echo 'MAIN_DOMAIN_NAME=$(MAIN_DOMAIN_NAME)' >> $@
	echo 'MAIN_GID=$(shell id -g)' >> $@
	echo 'MAIN_HTTP_HOST_PORT=127.0.0.1:8080' >> $@
	echo 'MAIN_UID=$(shell id -u)' >> $@
	echo 'PROJECT_NAME=$(PROJECT_NAME)' >> $@

INIT_DIRS += infra/.main
infra/.main:
	mkdir -m 700 -p $@

INFRA_BUILD_TARGETS += infra/build/main
.PHONY: infra/build/main
infra/build/main: infra/.env
	cd infra && docker compose build

INFRA_CREATE_TARGETS += infra/up/main
.PHONY: infra/up/main
infra/up/main: infra/.env infra/.main infra/ca/ca.crt
	cd infra && docker compose up -d

INFRA_DELETE_TARGETS += infra/down/main
.PHONY: infra/down/main
infra/down/main: infra/.env
	cd infra && docker compose down -v
