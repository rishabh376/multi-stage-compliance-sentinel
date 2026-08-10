# Backup

Stateless service - nothing to back up in-app.

For stateful bits (if any):
- Velero daily
- etcd snapshot hourly
- RPO 1h, RTO 15m
