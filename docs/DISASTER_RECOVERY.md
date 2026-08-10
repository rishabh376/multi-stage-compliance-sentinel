# Disaster Recovery - multi-stage-compliance-sentinel

RTO 15 min | RPO 1h

1. Failover DNS → secondary region
2. `terraform apply -auto-approve`
3. `flux reconcile kustomization multi-stage-compliance-sentinel --with-source`
4. Check SLO dashboard - are we green?

Full runbook: `interview/OPERATIONS_RUNBOOK.md`

We did a fire drill last month - 11 min to fully recovered.
