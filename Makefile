#####################################################
### Golang project Makefile template (2022-04-28) ###
#####################################################
# - Boilerplate CLI and API server
# - Docker image
# - GitHub Workflow
#####################################################
.DEFAULT_GOAL:=help

GOCMD=$(shell which go)
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GODOC:=$(shell which godoc)

BIN_OUT_DIR:=$(shell pwd)/bin

GIT_USER=cmattoon
GIT_REPO=x
PROJECT_NAME:=$(GIT_REPO)

GODOC_PORT:=9999
#GODOC_URL:=localhost:$(GODOC_PORT)
GODOC_URL:=http://localhost:$(GODOC_PORT)/pkg/github.com/cmattoon/x/
.PHONY: help
help: ## display this message
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: clean
clean: ## various clean commands
clean:
	rm -rf $(BIN_OUT_DIR)
	find . -name '*~' -delete
	$(GOCLEAN)

.PHONY: all
all: ## build and test
all: test-cli test-server build-cli build-server

.PHONY: build-all
build-all: ## build CLI and server
build-all: build-cli build-server

.PHONY: test-all
test-all: ## test CLI and server
test-all: test-cli test-server

.PHONY: test-cli
test-cli: ## test the CLI binary
test-cli:
	$(GOTEST) -o $(BIN_OUT_DIR)/$(CLI_NAME) $(CLI_SRC)

.PHONY: build-cli
build-cli: ## build the CLI binary
build-cli:
	$(GOBUILD) -o $(BIN_OUT_DIR)/$(CLI_NAME) $(CLI_SRC)

.PHONY: build-server
build-server: ## build the server binary
build-server:
	$(GOBUILD) -o $(BIN_OUT_DIR)/$(SRV_NAME) $(SRV_SRC)

.PHONY: test-server
test-server: ## test the server binary
test-server:
	$(GOTEST) -o $(BIN_OUT_DIR)/$(SRV_NAME) $(SRV_SRC)

.PHONY: docs
docs: ## generate docs
docs:
	goreadme -badge-godoc \
		-badge-goreportcard \
		-badge-golangci \
		-constants \
		-functions \
		-methods \
		-variabless \
		-types \
		-import-path github.com/cmattoon/x \
		-recursive \
		-factories \
		-title github.com/cmattoon/x > README.md

	@glow README.md
