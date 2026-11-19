# Image build and push targets for installer-ai-dev
#
# Usage:
#   make build                    # build with defaults
#   make push                     # push to quay.io/stolostron/installer-ai-dev:latest
#   make publish                  # build + push
#   make publish IMAGE_TAG=v1.0   # build + push with specific tag

REGISTRY ?= quay.io/stolostron
IMAGE_NAME ?= installer-ai-dev
IMAGE_TAG ?= latest
DOCKERFILE ?= dev-bot/Dockerfile.runner

IMAGE := $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build push publish

build:
	podman build -f $(DOCKERFILE) -t $(IMAGE) .

push:
	podman push $(IMAGE)

publish: build push
