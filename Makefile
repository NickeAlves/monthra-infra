.DEFAULT_GOAL := help
NETWORK := monthra-net

.PHONY: help network lint

help: ## List the available targets
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-12s %s\n", $$1, $$2}'

network: ## Create the shared Docker network used by every Monthra compose file
	@docker network inspect $(NETWORK) >/dev/null 2>&1 || docker network create $(NETWORK)
	@echo "network $(NETWORK) ready"

lint: ## Scan the working tree for secrets
	gitleaks dir --no-banner --redact .
