resource "portainer_stack" "vse002-swarm" {
  for_each = local.stacks

  name                      = each.key
  deployment_type           = "swarm"
  method                    = "repository"
  endpoint_id               = 1
  repository_url            = var.repository_url
  repository_reference_name = var.repository_ref
  file_path_in_repository   = each.value
  stack_webhook             = true
}



resource "github_repository_webhook" "foo" {
  repository = "homelab_terra"

  configuration {
    url          = "https://google.de/"
    content_type = "form"
  }

  events = ["push"]
}