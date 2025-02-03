variable "github_username" {
  description = "Username for ghcr"
  type = string
}

variable "github_password" {
  description = "Password for ghcr"
  type = string
  sensitive = true
}


variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive = true
}

variable "region" {
  default = "fra1"
  type = string
  description = "The region where the cluster will be created"
}

variable "k8s_clustername" {
  default = "position-pal-cluster"
  type = string
  description = "The name of the Kubernetes cluster"
}

variable "size" {
  default = "s-4vcpu-8gb-intel"
  type = string
  description = "The size of the nodes in the cluster"
}

variable "k8s_version" {
  default = "1.31.1-do.5"
  type = string
  description = "The version of Kubernetes to use"
}

variable "k8s_poolname" {
  default = "position-pal-cluster-pool"
  type = string
  description = "The name of the default node pool"
}

variable "k8s_count" {
  default = "3"
  type = number
  description = "The number of nodes in the default node pool"
}

data "digitalocean_ssh_key" "terraform" {
  name = "position-pal"
}