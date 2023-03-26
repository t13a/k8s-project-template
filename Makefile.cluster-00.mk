.PHONY: cluster/up
cluster/up: \
	cluster/create \
	cluster/connect \
	cluster/up-addons

.PHONY: cluster/down
cluster/down: \
	cluster/disconnect \
	cluster/delete

.PHONY: cluster/create
cluster/create: $$(CLUSTER_CREATE_TARGETS)

.PHONY: cluster/delete
cluster/delete: $$(CLUSTER_DELETE_TARGETS)

.PHONY: cluster/connect
cluster/connect: $$(CLUSTER_CONNECT_TARGETS)

.PHONY: cluster/disconnect
cluster/disconnect: $$(CLUSTER_DISCONNECT_TARGETS)

.PHONY: cluster/up-addons
cluster/up-addons: $$(CLUSTER_UP_ADDONS_TARGETS)

.PHONY: cluster/down-addons
cluster/down-addons: $$(CLUSTER_DOWN_ADDONS_TARGETS)
