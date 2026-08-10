# multi-stage-compliance-sentinel
# Appsec Engineers use the service to score runtime policy exceptions across PCI workloads, so unsigned builds never reach staging.
#
# INFRASTRUCTURE REQUIREMENTS
# Kubernetes 1 x 2vCPU / 4GB
# CPU: 50m / 200m, MEM: 64Mi / 256Mi
# - Stateless service, no PVC required
# - Logs: stdout -> Loki
# Dependencies: - Trivy scanner
# - Cosign
# - Vault / External Secrets
# - OPA Gatekeeper
# Cost: **$0/month** on Oracle Always Free / Fly.io

resource "kubernetes_namespace" "app" {
  metadata {
    name = var.namespace
    labels = { "app" = "multi-stage-compliance-sentinel", "managed-by" = "terraform" }
  }
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = "multi-stage-compliance-sentinel"
    namespace = kubernetes_namespace.app.metadata[0].name
  }
  spec {
    replicas = var.replicas
    selector { match_labels = { app = "multi-stage-compliance-sentinel" } }
    template {
      metadata { labels = { app = "multi-stage-compliance-sentinel" } }
      spec {
        container {
          image = var.image
          name  = "app"
          port { container_port = 8080 }
          resources {
            requests = { cpu = "50m", memory = "64Mi" }
            limits   = { cpu = "200m", memory = "256Mi" }
          }
          liveness_probe {
            http_get { path = "/healthz" port = 8080 }
            initial_delay_seconds = 5
          }
          readiness_probe {
            http_get { path = "/readyz" port = 8080 }
            initial_delay_seconds = 3
          }
          security_context {
            run_as_non_root = true
            run_as_user = 10001
            allow_privilege_escalation = false
            read_only_root_filesystem = true
          }
        }
        security_context { fs_group = 10001 }
      }
    }
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name = "multi-stage-compliance-sentinel"
    namespace = kubernetes_namespace.app.metadata[0].name
  }
  spec {
    selector = { app = "multi-stage-compliance-sentinel" }
    port {
      port = 80
      target_port = 8080
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_horizontal_pod_autoscaler_v2" "app" {
  metadata {
    name = "multi-stage-compliance-sentinel"
    namespace = kubernetes_namespace.app.metadata[0].name
  }
  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind = "Deployment"
      name = kubernetes_deployment.app.metadata[0].name
    }
    min_replicas = 2
    max_replicas = 10
    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type = "AverageUtilization"
          average_utilization = 70
        }
      }
    }
  }
}
