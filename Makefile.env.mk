INIT_FILES += .env
.DELETE_ON_ERROR:
.env: PROJECT_NAME = $(notdir $(PWD))
.env: INFRA_DOMAIN_NAME = infra.internal
.env: INFRA_NETWORK_NAME = $(PROJECT_NAME)-infra
.env: REGISTRY_NAMESPACE = app
.env:
	rm -f $@
	echo 'INFRA_DOMAIN_NAME=$(INFRA_DOMAIN_NAME)' >> $@
	echo 'INFRA_NETWORK_NAME=$(INFRA_NETWORK_NAME)' >> $@
	echo 'KIND_CLUSTER_NAME=$(PROJECT_NAME)' >> $@
	echo 'KIND_CONTAINER_NAME=$(PROJECT_NAME)-control-plane' >> $@
	echo 'MAIN_CONTAINER_NAME=$(INFRA_NETWORK_NAME)-main' >> $@
	echo 'MAIN_DOMAIN_NAME=main.$(INFRA_DOMAIN_NAME)' >> $@
	echo 'PROJECT_NAME=$(PROJECT_NAME)' >> $@
	echo 'REGISTRY_CONTAINER_NAME=$(INFRA_NETWORK_NAME)-registry' >> $@
	echo 'REGISTRY_DOMAIN_NAME=registry.$(INFRA_DOMAIN_NAME)' >> $@
	echo 'REGISTRY_NAMESPACE=$(REGISTRY_NAMESPACE)' >> $@