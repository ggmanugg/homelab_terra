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

resource "github_repository_webhook" "vse002-swarm" {
  for_each   = local.stacks
  repository = var.repository_name

  configuration {
    url          = portainer_stack.vse002-swarm[each.key].webhook_url
    content_type = "json"
  }

  events = ["push"]
}