
run-server: ## Run the gRPC server
	poetry run python src/async_server.py

run-client: ## Run the gRPC client
	poetry run python src/async_client.py

build: ## Rebuild the gRPC code
	poetry run python -m grpc_tools.protoc -I src/protos --python_out=src --grpc_python_out=src src/protos/helloworld.proto

help: ## Display the help menu
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

PHONY: run-server run-client build help

.DEFAULT_GOAL := help