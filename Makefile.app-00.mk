.PHONY: app/up
app/up: \
	app/build \
	app/load \
	app/up-components

.PHONY: app/down
app/down: \
	app/down-components

.PHONY: app/build
app/build: $$(APP_BUILD_TARGETS)

.PHONY: app/load
app/load: $$(APP_LOAD_TARGETS)

.PHONY: app/up-components
app/up-components: $$(APP_UP_TARGETS)

.PHONY: app/down-components
app/down-components: $$(APP_DOWN_TARGETS)
