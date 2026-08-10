# Infrastructure Requirements - multi-stage-compliance-sentinel

**Use Case:** Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.

## Compute
- Kubernetes cluster (K3s / EKS / AKS / GKE)
- Minimum nodes: 1 x 2vCPU / 4GB
- CPU per pod: 50m request / 200m limit
- Memory per pod: 64Mi request / 256Mi limit
- Replicas: 2-10 (HPA)

## Storage
- Stateless service, no PVC required
- Logs: stdout -> Loki

## Network
- Ingress controller (nginx / traefik)
- Service type: ClusterIP
- TLS: cert-manager recommended

## Dependencies
- Trivy scanner
- Cosign
- Vault / External Secrets
- OPA Gatekeeper

## Free Tier Options
- Oracle Cloud Always Free: 4 ARM OCPUs, 24GB RAM - FREE
- Fly.io: 3 shared VMs - FREE
- Render/Railway: $5 free credit

## Cost Estimate
**$0/month** on Oracle Always Free / Fly.io

## Setup Steps
1. `terraform init`
2. `terraform plan -out=tfplan`
3. `terraform apply tfplan`
4. `kubectl get pods -n multi-stage-compliance-sentinel`
5. `kubectl port-forward svc/multi-stage-compliance-sentinel 8080:80 -n multi-stage-compliance-sentinel`

## Scaling
HPA configured: 70% CPU target, 2-10 pods

## Disaster Recovery
RTO 15m, RPO 1h. Backup with Velero.
