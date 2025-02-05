resource "helm_release" "chat_service" {
  name       = "chat-service"
  repository = "oci://ghcr.io/position-pal/"
  chart      = "position-pal-chat-service"
  namespace  = "pp-cs"
  version = "1.0.2"

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
    name = "akkaLicenseKey"
    value = var.akka_license_key
  }

  depends_on = [ helm_release.rabbitmq ]
}