variable "repository_url" {
  type    = string
  default = "https://github.com/ggmanugg/homelab_terra"
}

variable "repository_ref" {
  type    = string
  default = "refs/heads/main"
}

variable "repository_name" {
  type    = string
  default = "homelab_terra"
}

variable "portainer_endpoint" {}
variable "portainer_api_key" {}
variable "github_token" {}