---
description: Run full quality gate for banxe-lexisnexis-distro
---

```bash
cd /home/mmber/banxe-lexisnexis-distro
make quality-gate
```

Runs: docker-compose validation → Dockerfile lint → ShellCheck → secrets scan
