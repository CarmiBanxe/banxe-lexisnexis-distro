# Installation Guide - Collective LexisNexis

## Prerequisites

- Docker 24+ with Docker Compose
- 16GB RAM minimum (32GB recommended)
- 50GB free disk space
- GPU (optional, for faster AI inference)

## Quick Install

```bash
git clone https://github.com/CarmiBanxe/banxe-lexisnexis-distro.git
cd banxe-lexisnexis-distro
cp .env.example .env
# Edit .env with your settings
bash install.sh
```

## Step-by-Step

### 1. Clone the repository
```bash
git clone https://github.com/CarmiBanxe/banxe-lexisnexis-distro.git
cd banxe-lexisnexis-distro
```

### 2. Configure environment
```bash
cp .env.example .env
nano .env  # or your preferred editor
```

Key settings:
- `AI_PROVIDER` - choose `ollama` (local) or `openai`/`anthropic` (cloud)
- `JURISDICTIONS` - legal jurisdictions (FR, IL, RU, UK, US)
- `LICENSE_KEY` - your license key (contact admin)

### 3. Run installer
```bash
bash install.sh
```

### 4. Access the platform
- Web UI: http://localhost:3000
- API: http://localhost:8000/docs

## Services Architecture

| Service | Port | Description |
|---------|------|-------------|
| Web UI | 3000 | Browser interface |
| Orchestrator | 8000 | Central API (MetaClaw) |
| Knowledge Engine | 8001 | Knowledge base & search |
| Compliance Checker | 8002 | AML/KYC validation |
| Legal Analyzer | 8003 | Legal document analysis |
| MiroFish Predictor | 8004 | Predictive analytics |
| Ollama | 11434 | Local AI models |

## Adding Knowledge Base Data

Place files in `data/knowledge-base/`:
- PDF, DOCX, TXT, MD documents
- CSV, JSON data files
- Restart knowledge engine: `docker compose restart knowledge-engine`

## Updating

```bash
bash update.sh
```

## Troubleshooting

### Services won't start
```bash
docker compose logs -f
```

### Out of memory
Increase Docker memory limit to 16GB+ in Docker Desktop settings.

### GPU not detected
Install NVIDIA Container Toolkit: https://docs.nvidia.com/datacenter/cloud-native/

## Support

Contact the BANXE development team or open an issue in this repository.
