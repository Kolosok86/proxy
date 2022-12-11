export GO ?= go

.DEFAULT_GOAL := build

.PHONY: docker-build
docker-build:
	docker build -t proxy .

.PHONY: docker-run
docker-run:
	docker run -d --restart always --name proxy proxy

.PHONY: run
run:
	${GO} run ./cmd

.PHONY: build
build:
	${GO} build ./cmd

.PHONY: clean
clean:
	${RM} proxy

.PHONY: lint
lint:
	golangci-lint run