---
description: Start all LexisNexis services with Docker Compose
---

```bash
cd /home/mmber/banxe-lexisnexis-distro
cp .env.example .env  # first time only — fill in API keys
make up
```

Services will be available at:
- Orchestrator API: http://localhost:8000
- Knowledge Engine: http://localhost:8001
- Compliance Checker: http://localhost:8002
- Legal Analyzer: http://localhost:8003
- MiroFish Predictor: http://localhost:8004
- Web UI: http://localhost:3000
