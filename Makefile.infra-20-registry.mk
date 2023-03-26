INIT_FILES += infra/registry/.env
.DELETE_ON_ERROR:
infra/registry/.env: INFRA_DOMAIN_NAME = $(call from_env,.env,INFRA_DOMAIN_NAME)
infra/registry/.env: INFRA_NETWORK_NAME = $(call from_env,.env,INFRA_NETWORK_NAME)
infra/registry/.env: REGISTRY_CONTAINER_NAME = $(call from_env,.env,REGISTRY_CONTAINER_NAME)
infra/registry/.env: REGISTRY_DOMAIN_NAME = $(call from_env,.env,REGISTRY_DOMAIN_NAME)
infra/registry/.env: .env
	rm -f $@
	echo 'COMPOSE_PROJECT_NAME=$(INFRA_NETWORK_NAME)-registry' >> $@
	echo 'INFRA_NETWORK_NAME=$(INFRA_NETWORK_NAME)' >> $@
	echo 'REGISTRY_CONTAINER_NAME=$(REGISTRY_CONTAINER_NAME)' >> $@
	echo 'REGISTRY_DOMAIN_NAME=$(REGISTRY_DOMAIN_NAME)' >> $@

INFRA_UP_ADDONS_TARGETS += infra/up/registry
.PHONY: infra/up/registry
infra/up/registry: infra/registry/.env
	cd infra/registry && docker compose up -d

INFRA_DOWN_ADDONS_TARGETS += infra/down/registry
.PHONY: infra/down/registry
infra/down/registry: infra/registry/.env
	cd infra/registry && docker compose down -v
