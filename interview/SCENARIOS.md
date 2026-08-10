# Production Scenarios - war stories

### 1. Pod CrashLoopBackOff - kubectl logs/describe - usually missing env var

Symptoms → Diagnosis → Mitigation → Prevention

### 2. Memory leak / OOMKilled - pprof, limit bump, fix leak

Symptoms → Diagnosis → Mitigation → Prevention

### 3. Terraform state corruption - restore from remote backend + lock

Symptoms → Diagnosis → Mitigation → Prevention

### 4. Pipeline flaky test - quarantine, fix race

Symptoms → Diagnosis → Mitigation → Prevention

### 5. Node pressure eviction - drain, taint

Symptoms → Diagnosis → Mitigation → Prevention

### 6. ImagePullBackOff - registry auth secret expired

Symptoms → Diagnosis → Mitigation → Prevention

### 7. CoreDNS failures - ndots / search domains

Symptoms → Diagnosis → Mitigation → Prevention

### 8. TLS cert expired at 2am - cert-manager didn't renew, alert was muted

Symptoms → Diagnosis → Mitigation → Prevention

### 9. Latency p95 spike - trace with OTel, found N+1 query

Symptoms → Diagnosis → Mitigation → Prevention

### 10. Disk full - PVC expand + logrotate

Symptoms → Diagnosis → Mitigation → Prevention

### 11. Secret rotation failed - external-secrets refresh loop

Symptoms → Diagnosis → Mitigation → Prevention

### 12. Ingress 502 - backend health probe wrong port

Symptoms → Diagnosis → Mitigation → Prevention

### 13. ArgoCD sync drift - someone kubectl edit'd prod

Symptoms → Diagnosis → Mitigation → Prevention

### 14. Prometheus WAL corruption after node crash - replay took 40min

Symptoms → Diagnosis → Mitigation → Prevention

### 15. Grafana dashboard gone after helm upgrade - configmap wasn't versioned

Symptoms → Diagnosis → Mitigation → Prevention

### 16. Full region outage - DNS failover, RTO 90sec, actually worked

Symptoms → Diagnosis → Mitigation → Prevention

### 17. Canary rollback - error budget burning, Argo auto-rolled back

Symptoms → Diagnosis → Mitigation → Prevention

### 18. Container escape attempt caught by Falco - seccomp saved us

Symptoms → Diagnosis → Mitigation → Prevention

### 19. Supply chain - Cosign signature verification failed, blocked deploy, turned out to be good catch

Symptoms → Diagnosis → Mitigation → Prevention

### 20. CPU saturation, HPA not scaling - metrics-server was down, classic

Symptoms → Diagnosis → Mitigation → Prevention

### 21. Deadlock in prod - pprof, restart, fix next deploy

Symptoms → Diagnosis → Mitigation → Prevention

### 22. Network partition - Cilium policy too strict

Symptoms → Diagnosis → Mitigation → Prevention

### 23. KEDA scaledobject misconfigured - scaled to 0 during traffic spike, oops

Symptoms → Diagnosis → Mitigation → Prevention

### 24. Redis cache outage - circuit breaker opened, degraded gracefully

Symptoms → Diagnosis → Mitigation → Prevention

### 25. RabbitMQ backlog 2M messages - consumer scaled out, caught up in 20min

Symptoms → Diagnosis → Mitigation → Prevention

### 26. Kafka partition imbalance - reassign tool, fixed

Symptoms → Diagnosis → Mitigation → Prevention

### 27. Model drift - accuracy dropped 8%, Evidently alerted, rolled back to v1

Symptoms → Diagnosis → Mitigation → Prevention

### 28. Feature store outage - served stale cached features, 2% accuracy hit, acceptable

Symptoms → Diagnosis → Mitigation → Prevention

### 29. Incident escalation at 3am - runbook was actually useful for once

Symptoms → Diagnosis → Mitigation → Prevention

### 30. SLO error budget burned to 0 - freeze deploys, postmortem Monday

Symptoms → Diagnosis → Mitigation → Prevention

### 31. Etcd corruption - restored snapshot, 7min downtime

Symptoms → Diagnosis → Mitigation → Prevention

### 32. OIDC token expired - refresh failed silently, 401s everywhere

Symptoms → Diagnosis → Mitigation → Prevention

### 33. High cardinality metrics crashed Prometheus - relabel drop fixed it

Symptoms → Diagnosis → Mitigation → Prevention

### 34. Loki rate limited - dropped logs during incident, worst timing

Symptoms → Diagnosis → Mitigation → Prevention

### 35. Chaos pod-kill - service recovered in 14sec, we were happy

Symptoms → Diagnosis → Mitigation → Prevention
