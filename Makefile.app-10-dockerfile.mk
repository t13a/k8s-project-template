APP_DOCKERFILE_DIRS = $(wildcard app/*)

define app_dockerfile_rule
APP_BUILD_TARGETS += app/build/$(notdir $1)
.PHONY: app/build/$(notdir $1)
app/build/$(notdir $1): REGISTRY_DOMAIN_NAME = $$(call from_env,.env,REGISTRY_DOMAIN_NAME)
app/build/$(notdir $1): REGISTRY_NAMESPACE = $$(call from_env,.env,REGISTRY_NAMESPACE)
app/build/$(notdir $1): IMAGE_NAME = $$(call from_json,$1/package.json,.name)
app/build/$(notdir $1): IMAGE_TAG = $$(call from_json,$1/package.json,.version)
app/build/$(notdir $1): IMAGE = $$(REGISTRY_DOMAIN_NAME)/$$(REGISTRY_NAMESPACE)/$$(IMAGE_NAME):$$(IMAGE_TAG)
app/build/$(notdir $1): .env $1/package.json
	docker build -t $$(IMAGE) $1

APP_LOAD_TARGETS += app/load/$(notdir $1)
.PHONY: app/load/$(notdir $1)
app/load/$(notdir $1): KIND_CLUSTER_NAME = $$(call from_env,.env,KIND_CLUSTER_NAME)
app/load/$(notdir $1): REGISTRY_DOMAIN_NAME = $$(call from_env,.env,REGISTRY_DOMAIN_NAME)
app/load/$(notdir $1): REGISTRY_NAMESPACE = $$(call from_env,.env,REGISTRY_NAMESPACE)
app/build/$(notdir $1): IMAGE_NAME = $$(call from_json,$1/package.json,.name)
app/build/$(notdir $1): IMAGE_TAG = $$(call from_json,$1/package.json,.version)
app/load/$(notdir $1): IMAGE = $$(REGISTRY_DOMAIN_NAME)/$$(REGISTRY_NAMESPACE)/$$(IMAGE_NAME):$$(IMAGE_TAG)
app/load/$(notdir $1): .env $1/package.json
	kind load docker-image $$(IMAGE) --name $$(KIND_CLUSTER_NAME) # TODO replace with 'docker push'

endef
$(eval $(foreach _,$(APP_DOCKERFILE_DIRS),$(call app_dockerfile_rule,$_)))
