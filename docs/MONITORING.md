# Monitoring - multi-stage-compliance-sentinel

- Prometheus scrapes `/metrics` every 15s
- Grafana dashboard: `monitoring/grafana-dashboard.json`
- Alerts include high error rate, crash loops, and latency spikes.

SLO: 99.9% availability, p95 < 250ms
Error budget: 43m/month

Runtime detection and telemetry let us prove the security controls are actually working in prod.
