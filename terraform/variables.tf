variable "repository_url" {
  type    = string
  default = "https://github.com/ggmanugg/homelab_terra"
}

variable "repository_ref" {
  type    = string
  default = "refs/heads/main"
}

variable "portainer_endpoint" {}
variable "portainer_api_key" {}