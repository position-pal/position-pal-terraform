resource "helm_release" "gateway_service" {
  name       = "gateway-service"
  repository = "oci://ghcr.io/position-pal/"
  chart      = "position-pal-gateway-service"
  namespace  = "pp-gws"
  version = "1.0.0"
  
  create_namespace = true

  depends_on = [ 
    helm_release.chat_service,
    helm_release.location_service,
    helm_release.notification_service,
    helm_release.user-service
 ]

 
}