resource "helm_release" "notification_service" {
  name       = "notification-service"
  repository = "oci://ghcr.io/position-pal/"
  chart      = "position-pal-notifications-service"
  namespace  = "pp-ns"
  version = "1.0.0"

  create_namespace = true

  values = [
    yamlencode({
      serviceAccount = var.service_account
    })
  ]

  set {
    name = "rabbitmq.username"
    value = var.rabbitmq_username
  }

  set {
    name = "rabbitmq.password"
    value = var.rabbitmq_password
  }

  depends_on = [ helm_release.rabbitmq ]
}