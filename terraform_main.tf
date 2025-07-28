terraform {
  required_providers {
    portainer = {
      source  = "portainer/portainer"
      version = "~> 1.9.0"
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

# find all docker-compose.yml in first level
locals {
  compose_paths = fileset(path.module, "*/docker-compose.yml")
}

# create map key=name
locals {
  stacks = {
    for p in local.compose_paths :
    basename(dirname(p)) => p
  }
}

output "compose_paths" {
  value = local.compose_paths
}
output "stacks_map" {
  value = local.stacks
}

# create stack for each file
resource "portainer_stack" "swarm_repo" {
  for_each                  = local.stacks
  name                      = each.key
  deployment_type           = "swarm"
  method                    = "repository"
  endpoint_id               = 1
  repository_url            = "https://github.com/ggmanugg/homelab_terra"
  repository_reference_name = "refs/heads/main"
  file_path_in_repository   = each.value
}