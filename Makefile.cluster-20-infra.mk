CLUSTER_CONNECT_TARGETS += cluster/connect/infra
.PHONY: cluster/connect/infra
cluster/connect/infra: INFRA_NETWORK_NAME = $(call from_env,.env,INFRA_NETWORK_NAME)
cluster/connect/infra: KIND_CONTAINER_NAME = $(call from_env,.env,KIND_CONTAINER_NAME)
cluster/connect/infra: .env
	docker network connect $(INFRA_NETWORK_NAME) $(KIND_CONTAINER_NAME)

CLUSTER_DISCONNECT_TARGETS += cluster/disconnect/infra
.PHONY: cluster/disconnect/infra
cluster/disconnect/infra: INFRA_NETWORK_NAME = $(call from_env,.env,INFRA_NETWORK_NAME)
cluster/disconnect/infra: KIND_CONTAINER_NAME = $(call from_env,.env,KIND_CONTAINER_NAME)
cluster/disconnect/infra: .env
	docker network disconnect $(INFRA_NETWORK_NAME) $(KIND_CONTAINER_NAME)
