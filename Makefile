VERSION ?=
IMAGE = php-wallet-core-protobuf:generator

.PHONY: generate

generate:
	@test -n "$(VERSION)" || { echo 'Usage: make generate VERSION=4.7.0' >&2; exit 1; }
	docker build -t $(IMAGE) .
	docker run --rm \
		--user "$$(id -u):$$(id -g)" \
		--volume "$(CURDIR):/work" \
		--env VERSION="$(VERSION)" \
		$(IMAGE)
