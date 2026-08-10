# Deployment - multi-stage-compliance-sentinel

**Use case:** Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.

## Infra requirements
→ `terraform/INFRA_REQUIREMENTS.md` - CPU/RAM/storage/network/cost breakdown

## GitOps
Flux watches `main` and reconciles changes automatically.

## Rollback
```
./scripts/rollback.sh
kubectl rollout undo deploy/multi-stage-compliance-sentinel -n multi-stage-compliance-sentinel
```
Usually < 30 sec.

## Cost
Fly.io - $0/mo

The focus is supply-chain hardening: SBOMs, Cosign signatures, and policy enforcement across build and deploy.
