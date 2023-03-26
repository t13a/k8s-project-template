.PHONY: infra/up
infra/up: \
	infra/build \
	infra/create \
	infra/up-addons

.PHONY: infra/down
infra/down: \
	infra/down-addons \
	infra/delete

.PHONY: infra/build
infra/build: $$(INFRA_BUILD_TARGETS)

.PHONY: infra/create
infra/create: $$(INFRA_CREATE_TARGETS)

.PHONY: infra/delete
infra/delete: $$(INFRA_DELETE_TARGETS)

.PHONY: infra/up-addons
infra/up-addons: $$(INFRA_UP_ADDONS_TARGETS)

.PHONY: infra/down-addons
infra/down-addons: $$(INFRA_DOWN_ADDONS_TARGETS)

.PHONY: infra/exec
infra/exec:
	@cd infra/main && docker compose exec main bash
