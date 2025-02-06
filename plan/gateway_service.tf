resource "helm_release" "gateway_service" {
  name       = "gateway-service"
  repository = "oci://ghcr.io/position-pal/"
  chart      = "position-pal-gateway-service"
  namespace  = "pp-gws"
  version = "1.0.0"
  
  create_namespace = true
  
  set {
    name = "config.chatServiceGrpcUrl"
    value = "chat-service.pp-cs:5052"
  }
  set {
    name = "config.chatServiceHttpUrl"
    value = "chat-service.pp-cs:8080"
  }
  set {
    name = "config.locationServiceHttpUrl"
    value = "location-service.pp-ls:8080"
  }
  set {
    name = "config.locationServiceGrpcUrl"
    value = "location-service.pp-ls:5052"
  }
  set {
    name = "config.userServiceGrpcUrl"
    value = "user-service.pp-us:5052"
  }
  set {
    name = "config.notificationServiceGrpcUrl"
    value = "notification-service.pp-ns:5052"
  }

  depends_on = [ 
    helm_release.chat_service,
    helm_release.location_service,
    helm_release.notification_service,
    helm_release.user-service
    ]
}