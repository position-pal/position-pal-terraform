resource "helm_release" "prometheus_grafana" {
  name       = "prometheus-grafana"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = "monitoring"
  version    = "69.2.0"

  create_namespace = true
  
  set {
    name  = "grafana.adminUser"
    value = var.grafana_admin
  }

  set {
    name  = "grafana.adminPassword"
    value = var.grafana_password
  }
}