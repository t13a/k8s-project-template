APP_KUSTOMIZATION_DIRS = $(addprefix manifests/app/overlays/,namespace workload)

define app_kustomization_rules
APP_UP_TARGETS += app/up/$(notdir $1)
.PHONY: app/up/$(notdir $1)
app/up/$(notdir $1):
	kubectl apply -k $1 | hack/colorize-kubectl-apply.awk

APP_DOWN_TARGETS += app/down/$(notdir $1)
.PHONY: app/down/$(notdir $1)
app/down/$(notdir $1):
	kubectl delete -k $1

endef
$(eval $(foreach _,$(APP_KUSTOMIZATION_DIRS),$(call app_kustomization_rules,$_)))
