IMAGE = example
NAME = example

.PHONY: build
build:
	docker build --tag $(IMAGE) .

.PHONY: run
run:
	docker run \
		--name $(NAME) \
		--rm \
		$(IMAGE)

.PHONY: run-sh
run-sh:
	docker run \
		--env HOME=/mnt \
		--interactive \
		--name $(NAME) \
		--rm \
		--tty \
		--user $(shell id -u):$(shell id -g) \
		--volume $(PWD):/mnt \
		--workdir /mnt \
		$(IMAGE) \
		sh

.PHONY: kill
kill:
	docker kill $(NAME)

.PHONY: exec
exec:
	docker exec \
		--interactive \
		--tty \
		$(NAME) \
		sh
