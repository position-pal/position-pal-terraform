resource "helm_release" "location_service" {
  name       = "location-service"
  repository = "oci://ghcr.io/position-pal/"
  chart      = "position-pal-location-service"
  namespace  = "pp-ls"
  version = "1.14.0"

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
    name = "mapboxApi"
    value = var.mapbox_key
  }
  
  set {
    name = "akkaLicenseKey"
    value = var.akka_license_key
  }

  depends_on = [ helm_release.rabbitmq ]
}