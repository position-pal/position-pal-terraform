resource "helm_release" "user-service" {
    name = "user-service"
    repository = "ghcr.io/position-pal/"
    chart      = "position-pal-user-service"
    version    = "1.1.0"
    namespace  = "pp-us"

    create_namespace = true

    set {
        name = "jwtSecret"
        value = var.jwt_secret
    }

    set {
        name = "rabbitmq.password"
        value = var.rabbitmq_password
    }
}