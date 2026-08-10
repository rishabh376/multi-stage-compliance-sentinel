# Supply Chain Security - multi-stage-compliance-sentinel

Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.

## Controls
- Trivy filesystem and image scans fail HIGH/CRITICAL findings before deploy.
- Cosign signs images in CI and Kyverno verifies signatures at admission.
- SBOM is generated in SPDX format and attached to the release artifact.
- OPA/Gatekeeper denies privileged pods and root containers.
- Vault or External Secrets handles runtime secrets; nothing sensitive is committed.

## Stack
Go, Kyverno, Vault, Falco, Sigstore, In-Toto, SLSA L3

## Interview Angle
Talk about where the gate sits: developer PR, CI scan, registry signature, Kubernetes admission, and runtime detection.
