CLUSTER_KUSTOMIZATION_DIRS = $(wildcard manifests/cluster/overlays/*)

define cluster_kustomization_rules
CLUSTER_UP_ADDONS_TARGETS += cluster/up/$(notdir $1)
.PHONY: cluster/up/$(notdir $1)
cluster/up/$(notdir $1):
	kubectl apply -k $1 | hack/colorize-kubectl-apply.awk

# The target is defined, but is not added to dependencies of 'cluster/down' and 'cluster/down-addons'.
# CLUSTER_DOWN_ADDONS_TARGETS += cluster/down/$(notdir $1)
.PHONY: cluster/down/$(notdir $1)
cluster/down/$(notdir $1):
	kubectl delete -k $1

endef
$(eval $(foreach _,$(CLUSTER_KUSTOMIZATION_DIRS),$(call cluster_kustomization_rules,$_)))
