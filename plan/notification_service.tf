resource "helm_release" "notification_service" {
  name       = "notification-service"
  repository = "oci://ghcr.io/position-pal/"
  chart      = "position-pal-notifications-service"
  namespace  = "pp-ns"
  version = "1.0.0"

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
    name = "serviceAccount"
    value = var.service_account
  }

  depends_on = [ helm_release.rabbitmq ]
}