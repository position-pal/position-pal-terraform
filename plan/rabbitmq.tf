resource "helm_release" "rabbitmq" {
  name       = "rabbitmq"
  repository = "oci://registry-1.docker.io/bitnamicharts"
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