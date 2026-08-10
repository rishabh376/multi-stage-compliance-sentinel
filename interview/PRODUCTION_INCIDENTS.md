# Production Incidents - multi-stage-compliance-sentinel

Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.

## INC-001 - OOMKilled at 2am
**Impact:** 12% error rate, 8 min  
**What happened:** Memory leak in metrics library, no limit set, node evicted pods  
**Fix:** Set limit 256Mi, pprof found leak, fixed, added HPA  
**Postmortem:** Blameless. Action items in Jira. Added memory alert.

## INC-002 - Flux sync stuck, deploy blocked
**Impact:** Deploy blocked 34 min, feature launch delayed  
**Root cause:** Git repo deploy key rotated, Flux secret not updated  
**Fix:** Rotated secret, `flux reconcile`  
**Prevention:** External Secrets Operator now manages Flux creds, alert on sync fail >5min

## INC-003 - TLS cert expired, customers saw red lock
**Impact:** 18 min, ingress TLS error  
**Fix:** `kubectl cert-manager renew`, forced  
**Prevention:** Alert 30d before expiry (was 7d, on-call missed it during vacation handoff)

Real incidents. Not theory.
