resource "helm_release" "gateway_service" {
  name       = "gateway-service"
  repository = "oci://ghcr.io/position-pal/"
  chart      = "position-pal-gateway-service"
  namespace  = "pp-gws"
  version = "1.0.0"

  

  depends_on = [ 
    helm_release.chat_service,
    helm_release.location_service,
    helm_release.notification_service,
    helm_release.user-service
 ]


}