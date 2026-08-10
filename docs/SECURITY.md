# Security - multi-stage-compliance-sentinel

What we do:
- Trivy scan in CI - blocks HIGH/CRITICAL
- Cosign sign images
- Non-root UID 10001, readOnlyRootFilesystem
- NetworkPolicy default-deny
- RBAC least-privilege
- Secrets via External Secrets / Vault (not in git)
- Dependabot + CodeQL on

Threat model: Audit evidence is collected manually after the release is already finished.

The focus is supply-chain hardening: SBOMs, Cosign signatures, and policy enforcement across build and deploy.
