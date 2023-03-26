CLUSTER_CREATE_TARGETS += cluster/up/kind
.PHONY: cluster/up/kind
cluster/up/kind: KIND_CLUSTER_NAME = $(call from_env,.env,KIND_CLUSTER_NAME)
cluster/up/kind: .env
	kind get clusters -q | grep -q '^$(KIND_CLUSTER_NAME)$$' || kind create cluster --config cluster/config.yaml --name $(KIND_CLUSTER_NAME)

CLUSTER_CREATE_TARGETS += cluster/up/kind-fix-kubeconfig
.PHONY: cluster/up/kind-fix-kubeconfig
cluster/up/kind-fix-kubeconfig: KIND_CLUSTER_NAME = $(call from_env,.env,KIND_CLUSTER_NAME)
cluster/up/kind-fix-kubeconfig: KIND_INTERNAL_SERVER = $(shell hack/print-kind-internal-server.sh $(KIND_CLUSTER_NAME))
cluster/up/kind-fix-kubeconfig: .env
	kubectl config set-cluster kind-$(KIND_CLUSTER_NAME) --server=$(KIND_INTERNAL_SERVER)

CLUSTER_DELETE_TARGETS += cluster/down/kind
.PHONY: cluster/down/kind
cluster/down/kind: KIND_CLUSTER_NAME = $(call from_env,.env,KIND_CLUSTER_NAME)
cluster/down/kind: .env
	kind delete cluster --name $(KIND_CLUSTER_NAME)
