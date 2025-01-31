# Variables
GO = /usr/local/go/bin/go
PROJECT_DIR = $(shell pwd)
GQLGEN = github.com/99designs/gqlgen


# Environment
PORT = 8080


# Commands
build:
	@echo "==> [1/2] Building Server..."
	@$(GO) build -o $(PROJECT_DIR)/bin/server $(PROJECT_DIR)/server.go
	@echo "==> [2/2] Server built into: $(PROJECT_DIR)/bin/server"

run: build
	@echo "==> [1/1] Runing Server..."
	@PORT=$(PORT) $(PROJECT_DIR)/bin/server

generate:
	@echo "==> [1/2] Generating GraphQL Schema..."
	@$(GO) run $(GQLGEN) generate
	@echo "==> [2/2] Schemas Generated Successfully"

clean:
	@echo "==> [1/2] Cleaning..."
	@rm -rf $(PROJECT_DIR)/bin
	@echo "==> [1/2] $(PROJECT_DIR)/bin cleaned up"


.DEFAULT_GOAL = run