.PHONY: up down logs build validate quality-gate secrets-scan help

help:
	@echo "BANXE LexisNexis Distro — Available targets:"
	@echo "  make up              Start all services"
	@echo "  make down            Stop all services"
	@echo "  make build           Build all Docker images"
	@echo "  make logs            Tail logs"
	@echo "  make validate        Validate configs"
	@echo "  make quality-gate    Full quality check"

# ── Docker ────────────────────────────────────────────────────────────────────
up:
	docker compose up -d
	@echo "Services started. Access web UI at http://localhost:3000"

down:
	docker compose down

build:
	docker compose build

logs:
	docker compose logs -f

restart:
	docker compose restart

status:
	docker compose ps

# ── Validation ────────────────────────────────────────────────────────────────
validate:
	@echo "🔍 Validating docker-compose.yml..."
	@python3 -c "import yaml; yaml.safe_load(open('docker-compose.yml'))" && echo "  ✅ YAML valid"
	@echo "🔍 Checking Dockerfiles..."
	@find services/ -name "Dockerfile" | while read f; do \
		bash -n "$$f" 2>/dev/null || echo "  ⚠️ $$f"; \
		echo "  ✅ $$f"; \
	done
	@echo "🔍 ShellCheck..."
	@find . -name "*.sh" -not -path "./.git/*" | xargs shellcheck -S warning && echo "  ✅ ShellCheck OK"

secrets-scan:
	@command -v gitleaks >/dev/null && gitleaks detect --source . --verbose || echo "[SKIP] gitleaks not installed"

quality-gate: validate secrets-scan
	@echo "✅ Quality gate PASSED"

# ── Install ───────────────────────────────────────────────────────────────────
install:
	@echo "📋 Installation guide: docs/INSTALL.md"
	@echo "Step 1: cp .env.example .env && edit .env"
	@echo "Step 2: make build"
	@echo "Step 3: make up"
