# Setup - multi-stage-compliance-sentinel

Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.

1. **Infra first**: `cd terraform && terraform init && terraform apply`
2. `kubectl apply -k k8s/ -n multi-stage-compliance-sentinel`
3. `kubectl port-forward svc/multi-stage-compliance-sentinel 8080:80 -n multi-stage-compliance-sentinel`
4. `curl localhost:8080/healthz`

Env vars: `PORT=8080`, `LOG_LEVEL=info`

Runtime detection and telemetry let us prove the security controls are actually working in prod.
