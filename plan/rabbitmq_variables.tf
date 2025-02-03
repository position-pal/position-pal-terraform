variable "rabbitmq_username" {
  default = "user"
  type = string
  description = "The username for the RabbitMQ instance"  
}

variable "rabbitmq_password" {
  type = string
  description = "The password for the RabbitMQ instance"
  sensitive = true
}
