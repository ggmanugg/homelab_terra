terraform {
  required_providers {
    portainer = {
      source = "portainer/portainer"
    }
  }
}

provider "portainer" {
  endpoint = var.portainer_endpoint
  api_key  = var.portainer_api_key
}

variable "portainer_endpoint" {
  type = string
}

variable "portainer_api_key" {
  type = string
}