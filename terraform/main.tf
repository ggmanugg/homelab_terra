resource "portainer_stack" "vse002-swarm" {
  for_each = local.stacks

  name                      = each.key
  deployment_type           = "swarm"
  method                    = "repository"
  endpoint_id               = 1
  repository_url            = var.repository_url
  repository_reference_name = var.repository_ref
  file_path_in_repository   = each.value

  stack_webhook = true
  #prune        = true
}

resource "portainer_webhook_execute" "trigger_gitops_stack" {
  for_each = local.webhook_ids
  stack_id = each.value

  depends_on = [portainer_stack.vse002-swarm]
}