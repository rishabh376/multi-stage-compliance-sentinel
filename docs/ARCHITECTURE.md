# Architecture - multi-stage-compliance-sentinel

> Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.

**Pain:** Audit evidence is collected manually after the release is already finished.  
**Success metric:** Rotate leaked or stale credentials within 15 minutes without app downtime.

## Decision log

We chose K8s + go because the service needs to be deployed, observed, and rolled back under real production conditions. The architecture reflects the operational problem behind Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.: we need something that ships quickly, is observable, and can be recovered without hand-waving.

We also prioritized The focus is supply-chain hardening: SBOMs, Cosign signatures, and policy enforcement across build and deploy. and Runtime detection and telemetry let us prove the security controls are actually working in prod. so the architecture is built around real operational signal, not just feature scope.

See `docs/architecture/ADR-001-runtime-choice.md`

## Components

- go service with health, readiness, and domain-specific endpoints for Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.
- Prometheus metrics and structured logging for operators
- Docker image with non-root runtime and secure defaults
- K8s Deployment + HPA 2-10, 70% CPU
- GitOps (FluxCD) and rollback scripts
- The operational stack implied by the project: Go, Kyverno, Vault, Falco, Sigstore, In-Toto, SLSA L3

## Trade-offs

| Choice | Why | Cost |
|---|---|---|
| K8s over serverless | team expertise, portability, predictable ops | more YAML |
| Self-hosted observability | lower cost than SaaS alternatives | we run it |
| RollingUpdate first | simpler for v0.1, canary later | faster shipping |

## Data flow

```
Client -> Ingress -> Service -> Pod
Pod -> /metrics -> Prometheus -> Alertmanager -> Slack
Domain actions -> API -> logs/metrics -> operators
```

## Scaling

HPA 2-10 pods. Stateless. 50m/64Mi request.

## Why not...

- **Serverless?** Cold start would hurt the main user flow and violate the reliability target.
- **Managed SaaS only?** The project must remain cost-effective and under operational control.
