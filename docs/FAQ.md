# FAQ - multi-stage-compliance-sentinel

**Q: What problem does this actually solve?**
A: Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.

Pain point: Audit evidence is collected manually after the release is already finished.

**Q: Free to run?**
A: Yep. Fly.io - $0/mo. See `terraform/INFRA_REQUIREMENTS.md`

**Q: Production ready?**
A: Yes - SLOs, security hardening, DR runbook, Helm, Terraform, monitoring.

**Q: Stack?**
A: Go, Kyverno, Vault, Falco, Sigstore, In-Toto, SLSA L3

**Q: What infra do I need?**
A: `terraform/INFRA_REQUIREMENTS.md` has the full breakdown - CPU/RAM/storage/network/cost.
