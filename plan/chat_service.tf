resource "helm_release" "chat_service" {
  name       = "chat-service"
  repository = "oci://ghcr.io/position-pal/"
  chart      = "position-pal-chat-service"
  namespace  = "pp-cs"
  version = "1.11.0"

  create_namespace = true

  set {
    name = "rabbitmq.username"
    value = var.rabbitmq_username
  }

  set {
    name = "rabbitmq.password"
    value = var.rabbitmq_password
  }

  set {
    name = "rabbitmq.namespace"
    value = "rabbitmq"
  }

  set {
    name = "rabbitmq.serviceName"
    value = "rabbitmq"
  }
  
  set {
    name = "akkaLicenseKey"
    value = var.akka_license_key
  }

  depends_on = [ helm_release.rabbitmq ]
}