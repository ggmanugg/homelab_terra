terraform {
  required_providers {
    portainer = {
      source  = "portainer/portainer"
      version = "~> 1.12.0"
    }
    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }
  }
}