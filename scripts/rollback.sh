#!/usr/bin/env bash
set -euo pipefail
kubectl rollout undo deploy/multi-stage-compliance-sentinel
