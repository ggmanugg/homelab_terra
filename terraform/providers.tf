provider "portainer" {
  endpoint = var.portainer_endpoint
  api_key  = var.portainer_api_key
}

provider "github" {
  token = var.github_token
}