# AGENTS.md — banxe-lexisnexis-distro

**Repository:** `~/banxe-lexisnexis-distro/`
**Version:** 1.0 | 2026-04-12
**Purpose:** BANXE LexisNexis WorldCompliance distribution layer
**Stack:** Docker, bash, hadolint

---

## Core mission

Docker-based distribution layer for LexisNexis WorldCompliance integration.
Manages service deployment, health checks, and data synchronisation for compliance screening.

---

## Four-Partner Swarm

| # | Partner | Role |
|---|---------|------|
| 1 | **Claude Code** | Architecture, config review |
| 2 | **Aider CLI** | Script executor |
| 3 | **MiroFish** | Sanctions screening scenarios |

---

## Instruction hierarchy

1. Explicit user instruction
2. `CLAUDE.md` — infrastructure context
3. `AGENTS.md` — this file
4. `~/.claude/CLAUDE.md` — global defaults

---

## Critical rules

| Rule | Details |
|------|---------|
| **Secrets** | API keys in `.env` — never in Dockerfile or scripts |
| **Hadolint** | Dockerfile must pass hadolint before commit |
| **Health check** | `docker compose up` must reach `healthy` state |

---

## Development commands

```bash
docker compose up -d
docker compose ps        # verify healthy
make lint                # hadolint Dockerfile
bash install.sh --dry-run
pre-commit run --all-files
```

---

## Repository structure

```
banxe-lexisnexis-distro/
├── services/       ← Service configurations
├── docs/           ← Integration documentation
├── docker-compose.yml
├── install.sh      ← Installation script
└── Makefile
```

---

## Definition of done

- [ ] `docker compose up` → all services `healthy`
- [ ] `make lint` (hadolint) passes
- [ ] No secrets in committed files
- [ ] `pre-commit run --all-files` green
