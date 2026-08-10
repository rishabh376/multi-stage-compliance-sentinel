# Troubleshooting - multi-stage-compliance-sentinel

**CrashLoopBackOff**
`kubectl logs deploy/multi-stage-compliance-sentinel -n multi-stage-compliance-sentinel --previous`
Usually missing env var or bad config.

**ImagePullBackOff**
GHCR auth secret expired. `kubectl create secret docker-registry ...`

**500s spiking**
Check `/metrics`, then Prometheus alerts. Usually downstream timeout.

**Latency p95 high**
`kubectl get hpa -n multi-stage-compliance-sentinel` - is it scaling? Check metrics-server.

**OOMKilled**
Bump memory limit in `helm/multi-stage-compliance-sentinel/values.yaml`. Then find the leak.

**Flux won't sync**
`flux get kustomizations` - usually git repo URL rotated.
