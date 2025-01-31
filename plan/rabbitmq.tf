resource "helm_release" "rabbitmq" {
  name       = "rabbitmq"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "rabbitmq"
  namespace  = "rabbitmq"
  version = "15.2.4"

  create_namespace = true

  set {
    name  = "auth.username"
    value = var.rabbitmq_username
  }

  set {
    name  = "auth.password"
    value = var.rabbitmq_password
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

}