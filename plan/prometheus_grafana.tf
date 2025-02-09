resource "helm_release" "prometheus_grafana" {
  name       = "prometheus-grafana"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = ""
}