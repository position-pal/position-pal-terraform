variable "grafana_password" {
  type = string
  sensitive = true
  description = "Grafana password"
}

variable "grafana_admin" {
  type = string
  description = "Grafana admin username"
}