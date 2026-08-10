# Operations Runbook - multi-stage-compliance-sentinel

Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.

**On-call? Read this first.**

## Deploy
```
kubectl apply -k k8s/ -n multi-stage-compliance-sentinel
kubectl rollout status deploy/multi-stage-compliance-sentinel -n multi-stage-compliance-sentinel
```

## Rollback (when things go red)
```
./scripts/rollback.sh
# usually < 30sec
```

## Scale up NOW
```
kubectl scale deploy/multi-stage-compliance-sentinel --replicas=10 -n multi-stage-compliance-sentinel
```

## Logs
```
kubectl logs -l app=multi-stage-compliance-sentinel -n multi-stage-compliance-sentinel -f --tail=200
```

## Crashloop?
```
kubectl describe pod -l app=multi-stage-compliance-sentinel -n multi-stage-compliance-sentinel
kubectl logs <pod> --previous -n multi-stage-compliance-sentinel
```
90% of the time: missing env var in ConfigMap.

## Metrics
`curl localhost:8080/metrics` or Grafana dashboard in `monitoring/`

## DR / Failover
See `docs/DISASTER_RECOVERY.md` - RTO 15m

We actually tested this. 11 min.
