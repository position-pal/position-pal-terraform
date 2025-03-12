resource "helm_release" "gateway_service" {
  name       = "gateway-service"
  repository = "oci://ghcr.io/position-pal/"
  chart      = "position-pal-gateway-service"
  namespace  = "pp-gws"
  version = "1.17.0"
  
  create_namespace = true
  
  set {
    name = "chatServiceGrpcUrl"
    value = "chat-service.pp-cs:5052"
  }
  set {
    name = "chatServiceHttpUrl"
    value = "chat-service.pp-cs:8080"
  }
  set {
    name = "locationServiceHttpUrl"
    value = "location-service.pp-ls:8080"
  }
  set {
    name = "locationServiceGrpcUrl"
    value = "location-service.pp-ls:5052"
  }
  set {
    name = "userServiceGrpcUrl"
    value = "user-service.pp-us:5052"
  }
  set {
    name = "notificationServiceGrpcUrl"
    value = "notification-service.pp-ns:5052"
  }

  depends_on = [ 
    helm_release.chat_service,
    helm_release.location_service,
    helm_release.notification_service,
    helm_release.user_service
    ]
}