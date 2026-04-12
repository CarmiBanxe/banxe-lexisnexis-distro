# CLAUDE.md — banxe-lexisnexis-distro
# Collective LexisNexis — AI Compliance Platform

## Purpose

Multi-service Docker stack providing AI-powered legal/compliance analysis.
Distributed to partners and employees as an installable platform.
Synced to GitLab automatically on every push.

## Architecture

```
services/
├── knowledge-engine/    port 8001 — AI provider integration (OpenAI/Anthropic)
├── compliance-checker/  port 8002 — AML/KYC rules
├── legal-analyzer/      port 8003 — Jurisdictional templates (FR, IL, RU)
├── mirofish-predictor/  port 8004 — ML models
├── orchestrator/        port 8000 — Main API gateway (MetaClaw)
└── web-ui/              port 3000 — Frontend
```

External: Ollama on port 11434 (local LLM, GPU-enabled)

## Quick start

```bash
cp .env.example .env
# Fill in API keys in .env
make up
```

## Quality gate

```bash
make quality-gate
```

## Security rules

- NEVER hardcode API keys — always use .env
- NEVER commit .env (gitignored)
- All secrets via GitHub Secrets in CI
- GitLab sync uses GITLAB_TOKEN from secrets (not hardcoded)

## CI/CD

- `sync-to-gitlab.yml` — syncs to GitLab on every push
- `ci.yml` — quality gate: secrets scan + Docker lint + shellcheck
