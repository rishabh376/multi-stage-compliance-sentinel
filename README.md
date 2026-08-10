# multi-stage-compliance-sentinel

> Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.

**Domain:** devsecops | **Complexity:** expert | **Stack:** Go, Kyverno, Vault, Falco, Sigstore, In-Toto, SLSA L3

| | |
|---|---|
| Use case | Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging. |
| Pain point | Audit evidence is collected manually after the release is already finished. |
| Success metric | Rotate leaked or stale credentials within 15 minutes without app downtime. |
| Cost | $0/mo on Fly.io |

## Why this exists

Audit evidence is collected manually after the release is already finished.. Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.

> This service shifts security left with scans, signatures, and admission controls so teams can ship safely. For this implementation, the service is designed to remove the operational friction behind Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging..

## What this product does

This project ships a production-oriented service that exposes health, readiness, observability, and domain-specific endpoints for Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.. The implementation is intended to be deployed behind Kubernetes with secure defaults, CI validation, and rollback-ready manifests.

## Quick start

```bash
docker build -t multi-stage-compliance-sentinel:local .
docker run -p 8080:8080 multi-stage-compliance-sentinel:local
curl http://localhost:8080/healthz
```

## Architecture

```
GitHub CI -> Container Registry -> Kubernetes -> Go -> Operators / SRE
```

See `docs/ARCHITECTURE.md`

## Infrastructure

Full spec: `terraform/INFRA_REQUIREMENTS.md`

TL;DR: K8s cluster, 2-10 pods HPA, $0 on Fly.io

## Docs

- `docs/ARCHITECTURE.md` - components, tradeoffs
- `docs/DESIGN_DISCUSSION.md` - how we decided to build this
- `docs/DEPLOYMENT.md` - GitOps, rollback
- `docs/SECURITY.md` - threat model
- `docs/TROUBLESHOOTING.md` - 3am runbook
- `terraform/INFRA_REQUIREMENTS.md` - **infra: CPU/RAM/storage/cost**

Interview prep: `interview/`
